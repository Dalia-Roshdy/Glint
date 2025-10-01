import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/components/side_menu/side_menu_widget.dart';
import '/index.dart';
import 'h_calender_setting_widget.dart' show HCalenderSettingWidget;
import 'package:flutter/material.dart';

class HCalenderSettingModel extends FlutterFlowModel<HCalenderSettingWidget> {
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

  int noOfHours = 8;

  CalendarSettingsRecord? generalCalendar;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in H-Calender_setting widget.
  CalendarSettingsRecord? calendar;
  // Stores action output result for [Backend Call - Read Document] action in H-Calender_setting widget.
  CalendarSettingsRecord? generalCalAct;
  // Model for sideMenu component.
  late SideMenuModel sideMenuModel;
  // State field(s) for generalCalendarType widget.
  CalendarType? generalCalendarTypeValue;
  FormFieldController<CalendarType>? generalCalendarTypeValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in generalCalendarType widget.
  CalendarSettingsRecord? generaCalenda;
  // State field(s) for calendarType widget.
  CalendarType? calendarTypeValue;
  FormFieldController<CalendarType>? calendarTypeValueController;
  DateTime? datePicked;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? form;

  @override
  void initState(BuildContext context) {
    sideMenuModel = createModel(context, () => SideMenuModel());
  }

  @override
  void dispose() {
    sideMenuModel.dispose();
  }
}
