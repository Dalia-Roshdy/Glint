import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'b_booking_widget.dart' show BBookingWidget;
import 'package:flutter/material.dart';

class BBookingModel extends FlutterFlowModel<BBookingWidget> {
  ///  Local state fields for this component.

  int noOfHours = 0;

  List<WorkingDayHourStruct> workingPattern = [];
  void addToWorkingPattern(WorkingDayHourStruct item) =>
      workingPattern.add(item);
  void removeFromWorkingPattern(WorkingDayHourStruct item) =>
      workingPattern.remove(item);
  void removeAtIndexFromWorkingPattern(int index) =>
      workingPattern.removeAt(index);
  void insertAtIndexInWorkingPattern(int index, WorkingDayHourStruct item) =>
      workingPattern.insert(index, item);
  void updateWorkingPatternAtIndex(
          int index, Function(WorkingDayHourStruct) updateFn) =>
      workingPattern[index] = updateFn(workingPattern[index]);

  AllocationsRecord? allocation;

  DateTime? fromDate;

  DateTime? toDate;

  List<Days> holidays = [];
  void addToHolidays(Days item) => holidays.add(item);
  void removeFromHolidays(Days item) => holidays.remove(item);
  void removeAtIndexFromHolidays(int index) => holidays.removeAt(index);
  void insertAtIndexInHolidays(int index, Days item) =>
      holidays.insert(index, item);
  void updateHolidaysAtIndex(int index, Function(Days) updateFn) =>
      holidays[index] = updateFn(holidays[index]);

  List<WorkingDayHourStruct> userWarkPattern = [];
  void addToUserWarkPattern(WorkingDayHourStruct item) =>
      userWarkPattern.add(item);
  void removeFromUserWarkPattern(WorkingDayHourStruct item) =>
      userWarkPattern.remove(item);
  void removeAtIndexFromUserWarkPattern(int index) =>
      userWarkPattern.removeAt(index);
  void insertAtIndexInUserWarkPattern(int index, WorkingDayHourStruct item) =>
      userWarkPattern.insert(index, item);
  void updateUserWarkPatternAtIndex(
          int index, Function(WorkingDayHourStruct) updateFn) =>
      userWarkPattern[index] = updateFn(userWarkPattern[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in B-Booking widget.
  CalendarSettingsRecord? userCalendar;
  // Stores action output result for [Firestore Query - Query a collection] action in B-Booking widget.
  AllocationsRecord? allocationObj;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textFieldTextController;
  String? Function(BuildContext, String?)? textFieldTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  AllocationsRecord? newAllocation;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  AllocationsRecord? insertallocation;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textFieldTextController?.dispose();
  }
}
