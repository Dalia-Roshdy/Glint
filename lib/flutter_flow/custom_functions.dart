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

List<ProjectUserHoursStruct>? listUserProjectCalenderData(
  DocumentReference userid,
  DateTime startDate,
  DateTime endDate,
  CalendarSettingsRecord calendar,
  List<AllocationsRecord> allocationList,
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

  List<ProjectUserHoursStruct> projectUserList = [];

  for (final allocation in allocationList) {
    // Defensive checks
    if (allocation.userId == null ||
        allocation.projectId == null ||
        allocation.repeatUntill == null) {
      continue;
    }

    DateTime currentDate = startDate;

    while (currentDate.isBefore(allocation.repeatUntill ?? DateTime.now()) ||
        currentDate
            .isAtSameMomentAs(allocation.repeatUntill ?? DateTime.now())) {
      for (final pattern in allocation.repeatPattern) {
        if (DateFormat.EEEE().format(currentDate) == pattern.workingDay) {
          projectUserList.add(ProjectUserHoursStruct(
              date: currentDate,
              usreId: allocation.userId,
              projectId: allocation.projectId,
              projectUserHours: pattern.workingHour,
              totalUserHours: calendarData
                  .firstWhere((r) =>
                      r.userId == allocation.userId && r.date == currentDate)
                  .workingHours));
        }
      }
    }
  }
  return projectUserList.isNotEmpty ? projectUserList : null;
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

List<DateTime> generateDateList(
  DateTime startDate,
  DateTime endDate,
) {
  // return list of dates from startdate to enddate
  List<DateTime> dateList = [];
  DateTime currentDate = startDate;

  while (
      currentDate.isBefore(endDate) || currentDate.isAtSameMomentAs(endDate)) {
    dateList.add(currentDate);
    currentDate = currentDate.add(Duration(days: 1));
  }

  return dateList;
}
