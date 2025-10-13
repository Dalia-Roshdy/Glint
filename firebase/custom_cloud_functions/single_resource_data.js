const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

// Helper maps
const WEEKDAY_SHORT = {
  monday: "Mon",
  tuesday: "Tue",
  wednesday: "Wed",
  thursday: "Thu",
  friday: "Fri",
  saturday: "Sat",
  sunday: "Sun",
};

function toDateString(d) {
  return d.toISOString().split("T")[0];
}

function getDatesInRange(start, end) {
  const dates = [];
  const current = new Date(start);
  while (current <= end) {
    dates.push(toDateString(new Date(current)));
    current.setDate(current.getDate() + 1);
  }
  return dates;
}

exports.singleResourceData = functions.https.onCall((data, context) => {
  try {
    const { startDate, endDate, userId } = data;

    if (!startDate || !endDate || !userId) {
      res
        .status(400)
        .json({ error: "Missing start_date, end_date, or user_id" });
      return;
    }

    const start = new Date(startDate);
    const end = new Date(endDate);
    const userRef = db.doc(`users/${userId}`);

    if (isNaN(start.getTime()) || isNaN(end.getTime()) || start > end) {
      res.status(400).json({ error: "Invalid date range" });
      return;
    }

    const allDates = getDatesInRange(start, end);

    // Fetch working pattern
    const calendarSnap = db
      .collection("calendar_settings")
      .where("user_id", "==", userRef)
      .limit(1)
      .get();

    const calendarData = calendarSnap.empty
      ? null
      : calendarSnap.docs[0].data();
    const workingPattern = (calendarData && calendarData.working_pattern) || [];

    const workingMap = {};
    for (const entry of workingPattern) {
      const shortDay = WEEKDAY_SHORT[entry.working_day.toLowerCase()];
      if (shortDay) workingMap[shortDay] = entry.working_hour;
    }

    // Fetch allocations
    const allocationsSnap = db
      .collection("allocations")
      .where("user_id", "==", userRef)
      .get();

    const projectIds = new Set();
    const userIds = new Set();

    allocationsSnap.docs.forEach((doc) => {
      const data = doc.data();
      if (data.project_id?.id) projectIds.add(data.project_id.id);
      if (data.assigned_by?.id) userIds.add(data.assigned_by.id);
    });

    const [projectDocs, assignedByUserDocs, projectPermissionDocs] =
      Promise.all([
        projectIds.size
          ? db
              .collection("projects")
              .where(
                admin.firestore.FieldPath.documentId(),
                "in",
                Array.from(projectIds),
              )
              .get()
          : Promise.resolve({ docs: [] }),
        userIds.size
          ? db
              .collection("users")
              .where(
                admin.firestore.FieldPath.documentId(),
                "in",
                Array.from(userIds),
              )
              .get()
          : Promise.resolve({ docs: [] }),
        projectIds.size
          ? db
              .collection("project_permession")
              .where("user_id", "==", userRef)
              .where(
                "project_id",
                "in",
                Array.from(projectIds).map((id) => db.doc(`projects/${id}`)),
              )
              .get()
          : Promise.resolve({ docs: [] }),
      ]);

    const projectDetails = {};
    projectDocs.docs.forEach((doc) => {
      const data = doc.data();
      projectDetails[doc.id] = {
        name: data.name || "Unknown Project",
        color: data.color || "#CCCCCC",
        startDate: toDateString(new Date(data.startDate || new Date())),
        endDate: toDateString(new Date(data.endDate || new Date("2099-12-31"))),
      };
    });

    const assignedByUserDetails = {};
    assignedByUserDocs.docs.forEach((doc) => {
      assignedByUserDetails[doc.id] = doc.data().display_name || "Unknown User";
    });

    const projectPermissionDetails = {};
    projectPermissionDocs.docs.forEach((doc) => {
      const data = doc.data();
      if (data.project_id?.id) {
        projectPermissionDetails[data.project_id.id] = {
          roleInProject: data.role_in_project || null,
        };
      }
    });

    const expandedAllocations = [];
    for (const doc of allocationsSnap.docs) {
      const data = doc.data();
      const allocStart = data.startDate?.toDate?.();
      const allocEnd = data.repeat_untill?.toDate?.();
      const projectId = data.project_id?.id || null;
      const assignedById = data.assigned_by?.id || null;
      const allocPattern = data.repeat_pattern || [];

      const patternMap = {};
      for (const entry of allocPattern) {
        const dayKey = WEEKDAY_SHORT[entry.working_day.toLowerCase()];
        if (dayKey) patternMap[dayKey] = entry.working_hour;
      }

      if (!allocStart || !allocEnd || !projectId || !assignedById) continue;

      for (
        let d = new Date(allocStart);
        d <= allocEnd;
        d.setDate(d.getDate() + 1)
      ) {
        const dayStr = toDateString(d);
        const weekday = d.toLocaleDateString("en-US", { weekday: "short" });
        if (d < start || d > end) continue;
        if (patternMap[weekday] > 0) {
          expandedAllocations.push({
            date: dayStr,
            projectId,
            allocatedHours: patternMap[weekday],
            assignedById,
          });
        }
      }
    }

    const result = [];
    for (const date of allDates) {
      const dateObj = new Date(date);
      const weekdayShort = dateObj.toLocaleDateString("en-US", {
        weekday: "short",
      });
      const weekdayFull = dateObj.toLocaleDateString("en-US", {
        weekday: "long",
      });

      const workingHoursForDay = workingMap[weekdayShort] || 0;
      const matchingAllocations = expandedAllocations.filter(
        (a) => a.date === date,
      );

      let totalAllocatedHours = 0;
      const projectsForDay = [];

      matchingAllocations.forEach((alloc) => {
        totalAllocatedHours += alloc.allocatedHours;
        const project = projectDetails[alloc.projectId];
        const assignedByName = assignedByUserDetails[alloc.assignedById];
        const roleInProject =
          (projectPermissionDetails[alloc.projectId] &&
            projectPermissionDetails[alloc.projectId].roleInProject) ||
          "N/A";

        if (project) {
          projectsForDay.push({
            name: project.name,
            color: project.color,
            role_in_project: roleInProject,
            assigned_by: assignedByName,
            start_date: project.startDate,
            end_date: project.endDate,
            hours: alloc.allocatedHours,
          });
        }
      });

      result.push({
        date,
        day: weekdayFull,
        off_days: workingHoursForDay === 0,
        total_hours: totalAllocatedHours,
        projects: projectsForDay,
      });
    }

    res.status(200).json(result);
  } catch (error) {
    logger.error("Error in singleResourceWorkLoad", error);
    res.status(500).json({ error: "Internal server error" });
  }
});
