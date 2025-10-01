import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'a_sign_up22_widget.dart' show ASignUp22Widget;
import 'package:flutter/material.dart';

class ASignUp22Model extends FlutterFlowModel<ASignUp22Widget> {
  ///  Local state fields for this page.

  String? errorMS;

  List<WorkingDayHourStruct> workingDays = [];
  void addToWorkingDays(WorkingDayHourStruct item) => workingDays.add(item);
  void removeFromWorkingDays(WorkingDayHourStruct item) =>
      workingDays.remove(item);
  void removeAtIndexFromWorkingDays(int index) => workingDays.removeAt(index);
  void insertAtIndexInWorkingDays(int index, WorkingDayHourStruct item) =>
      workingDays.insert(index, item);
  void updateWorkingDaysAtIndex(
          int index, Function(WorkingDayHourStruct) updateFn) =>
      workingDays[index] = updateFn(workingDays[index]);

  List<DateTime> holidays = [];
  void addToHolidays(DateTime item) => holidays.add(item);
  void removeFromHolidays(DateTime item) => holidays.remove(item);
  void removeAtIndexFromHolidays(int index) => holidays.removeAt(index);
  void insertAtIndexInHolidays(int index, DateTime item) =>
      holidays.insert(index, item);
  void updateHolidaysAtIndex(int index, Function(DateTime) updateFn) =>
      holidays[index] = updateFn(holidays[index]);

  CalendarSettingsRecord? generalCalendar;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for calendarType widget.
  CalendarType? calendarTypeValue1;
  FormFieldController<CalendarType>? calendarTypeValueController1;
  // State field(s) for calendarType widget.
  CalendarType? calendarTypeValue2;
  FormFieldController<CalendarType>? calendarTypeValueController2;
  // Stores action output result for [Firestore Query - Query a collection] action in calendarType widget.
  CalendarSettingsRecord? generaCalenda;
  DateTime? datePicked;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CalendarSettingsRecord? calendar;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
