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

List<String> generateDateList(DateTime startDate) {
  // create a string list from startDate and 6 more  consequant dates in a string format MM/dd/yyyy
  List<String> dateList = [];
  for (int i = 0; i < 7; i++) {
    dateList
        .add(DateFormat('yyyy-MM-dd').format(startDate.add(Duration(days: i))));
  }
  return dateList;
}

int dateDifference(
  DateTime startDate,
  DateTime endDate,
) {
  // find date difference after extracting only date componend
  // Extract only the date components (year, month, day) from the DateTime objects
  DateTime start = DateTime(startDate.year, startDate.month, startDate.day);
  DateTime end = DateTime(endDate.year, endDate.month, endDate.day);

  // Calculate the difference in days
  return end.difference(start).inDays + 1;
}

DateTime weekstartDate(String dateVar) {
  // return start of week date  consider sunday is the start of the week

  DateTime date = DateTime.parse(dateVar);

  // Convert Sunday (7) to 0, other days remain 1–6
  int weekday = date.weekday == 7 ? 0 : date.weekday;

  // Subtract to get to previous Sunday
  return DateTime(date.year, date.month, date.day)
      .subtract(Duration(days: weekday));
}

DateTime weekendDate(String dateVar) {
  // return start of week date  consider sunday is the start of the week

  DateTime date = DateTime.parse(dateVar);

  // Convert Sunday (7) to 0, other days remain 1–6
  int weekday = date.weekday == 7 ? 0 : date.weekday;

  // Subtract to get to previous Sunday
  DateTime weekStart = DateTime(date.year, date.month, date.day)
      .subtract(Duration(days: weekday));

  return weekStart.add(Duration(days: 6));
}

DateTime getYesterday() {
  // Create a FlutterFlow custom Dart function named getYesterday that returns yesterday’s DateTime.
  return DateTime.now().subtract(Duration(days: 1));
}

List<UsersRecord>? getFreeEmp(
  List<UsersRecord>? allUsers,
  List<ProjectPermissionsRecord>? bookedUsers,
) {
  if (bookedUsers != null &&
      bookedUsers.isNotEmpty &&
      allUsers != null &&
      allUsers.isNotEmpty) {
    // Extract all assigned user references
    final assignedUserRefs = bookedUsers
        .map((perm) => perm.userId) // adjust field name if needed
        .whereType<DocumentReference>()
        .toSet();

    // Return users not in assignedUserRefs
    return allUsers
        .where((user) => !assignedUserRefs.contains(user.reference))
        .toList();
  } else {
    // If no booked users → everyone is unassigned
    return allUsers;
  }
}
