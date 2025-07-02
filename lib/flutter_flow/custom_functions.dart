import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

List<DateHourStruct>? expandRepeatPattern(
  DateTime startDate,
  DateTime repeatUntil,
  List<WorkingDayHourStruct> repeatpattern,
) {
  // need to expand repeated patern in allocation collection into date and hour list
  List<DateHourStruct> result = [];
  DateTime currentDate = startDate;

  while (currentDate.isBefore(repeatUntil) ||
      currentDate.isAtSameMomentAs(repeatUntil)) {
    for (var pattern in repeatpattern) {
      if (DateFormat.EEEE().format(currentDate) == pattern.workingDay) {
        result
            .add(DateHourStruct(date: currentDate, hours: pattern.workingHour));
      }
    }
    currentDate = currentDate.add(Duration(days: 1));
  }

  return result.isNotEmpty ? result : null;
}

List<ProjectUserHoursStruct>? listProjectUserHours(
  DateTime startDate,
  DateTime endDate,
  List<AllocationsRecord> allocationDocs,
  List<CalendarSettingsRecord> calendarSettingsDocs,
) {
/*


List<UserProjectHoursPerDay> generateUserProjectHoursSummary(
  DateTime startDate,
  DateTime endDate,
  List<dynamic> userDocs,
  List<dynamic> projectDocs,
  List<dynamic> calendarSettings,
  List<dynamic> allocationDocs,
) {
  final result = <UserProjectHoursPerDay>[];

  // Get general calendar
  final generalCalendar = calendarSettings.firstWhere(
    (cal) => cal['type'] == 'general',
    orElse: () => null,
  );

  // Build a working hours map from calendar settings (user or general)
  Map<String, int> getWorkingHoursForUser(String userId, String day) {
    final userCal = calendarSettings.firstWhere(
      (cal) => cal['type'] == 'user' && cal['user_id'] == userId,
      orElse: () => null,
    );
    final pattern = userCal?['working_pattern'] ?? generalCalendar?['working_pattern'] ?? [];

    for (var p in pattern) {
      if (p is Map && p['day'] == day) {
        return { 'hours': p['hours'] ?? 0 };
      }
    }
    return { 'hours': 0 };
  }

  // Loop through each allocation and expand it into specific dates
  for (var alloc in allocationDocs) {
    final String userId = alloc['user_id'];
    final String projectId = alloc['project_id'];
    final int noOfHours = alloc['no_of_hours'];
    final DateTime baseDate = DateTime.parse(alloc['start_date']);

    List<String> repeatDays = [];
    DateTime? repeatUntil;
    if (alloc.containsKey('repeat_pattern')) {
      final pattern = alloc['repeat_pattern'];
      if (pattern != null && pattern['days'] != null) {
        repeatDays = List<String>.from(pattern['days']);
        repeatUntil = pattern['repeat_until'] != null
          ? DateTime.parse(pattern['repeat_until'])
          : endDate;
      }
    }

    List<DateTime> allocationDates = [];

    if (repeatDays.isEmpty) {
      // One-time allocation
      if (!baseDate.isBefore(startDate) && !baseDate.isAfter(endDate)) {
        allocationDates.add(baseDate);
      }
    } else {
      // Repeating allocation
      final from = baseDate.isAfter(startDate) ? baseDate : startDate;
      final to = repeatUntil != null && repeatUntil.isBefore(endDate) ? repeatUntil : endDate;

      for (var date = from;
          !date.isAfter(to);
          date = date.add(Duration(days: 1))) {
        final dayLabel = DateFormat('EEE').format(date).toLowerCase(); // e.g., 'mon'
        if (repeatDays.contains(dayLabel)) {
          allocationDates.add(date);
        }
      }
    }

    for (final allocDate in allocationDates) {
      final dayLabel = DateFormat('EEE').format(allocDate).toLowerCase();
      final working = getWorkingHoursForUser(userId, dayLabel);
      final workingHours = working['hours'] ?? 0;

      result.add(UserProjectHoursPerDay(
        date: DateFormat('yyyy-MM-dd').format(allocDate),
        userId: userId,
        projectId: projectId,
        workingHoursInProject: noOfHours,
        workingHourSetting: workingHours,
      ));
    }
  }

  return result;
}









  // function to list the following date, userid , projectid , workinghoursinproject , workinghour setting , from allocation , calendar setting collection giving startdate , enddate as parameter a list of userdocument records a lis of project document record a list off calenar record and a list of allocation in the brevious period
  List<ProjectUserHoursStruct> userHoursList = [];

  for (var allocation in allocationDocs) {
    if (allocation.date.isAfter(startDate) &&
        allocation.date.isBefore(endDate)) {
      var calendarSetting = calendarSettingsDocs.firstWhere(
          (setting) => setting.id == allocation.calendarSettingId,
          orElse: () => null);

      if (calendarSetting != null) {
        userHoursList.add(ProjectUserHoursStruct(
          userId: allocation.userId,
          projectId: allocation.projectId,
          workingHoursInProject: allocation.workingHours,
          workingHourSetting: calendarSetting.workingHourSetting,
          fromAllocation: allocation.fromAllocation,
          calendarSetting: calendarSetting,
        ));
      }
    }
  }
*/
  return null;
}

List<CalendarUserDataStruct>? listUserCalenderData(
  DocumentReference userid,
  DateTime startDate,
  DateTime endDate,
  CalendarSettingsRecord calendar,
) {
  // List to hold the final output
  List<CalendarUserDataStruct> calendarData = [];

  // Get holidays from the calendar
  final List<DateTime> holidays = calendar.holidays;

  // Iterate through each date from start to end
  for (DateTime date = startDate;
      !date.isAfter(endDate);
      date = date.add(Duration(days: 1))) {
    // Skip holidays
    if (holidays.contains(date)) continue;

    // Check if this day matches a working pattern
    for (final pattern in calendar.workingPattern) {
      final dayName = DateFormat.EEEE().format(date); // "Monday", etc.

      if (pattern.workingDay == dayName) {
        // Create and add the user calendar data
        calendarData.add(CalendarUserDataStruct(
          userId: userid,
          date: date,
          workingHours: pattern.workingHour,
        ));
        break; // No need to check more patterns once matched
      }
    }
  }
  return calendarData;
}

List<CalendarProjectDataStruct>? listProjectCalenderData(
  DocumentReference projectid,
  DateTime startDate,
  DateTime endDate,
  CalendarSettingsRecord calendar,
) {
  // List to hold the final output
  List<CalendarProjectDataStruct> calendarData = [];

  // Get holidays from the calendar
  final List<DateTime> holidays = calendar.holidays;

  // Iterate through each date from start to end
  for (DateTime date = startDate;
      !date.isAfter(endDate);
      date = date.add(Duration(days: 1))) {
    // Skip holidays
    if (holidays.contains(date)) continue;

    // Check if this day matches a working pattern
    for (final pattern in calendar.workingPattern) {
      final dayName = DateFormat.EEEE().format(date); // "Monday", etc.

      if (pattern.workingDay == dayName) {
        // Create and add the user calendar data
        calendarData.add(CalendarProjectDataStruct(
          projectId: projectid,
          date: date,
          workingHours: pattern.workingHour,
        ));
        break; // No need to check more patterns once matched
      }
    }
  }
  return calendarData;
}
