import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'c_time_off_widget.dart' show CTimeOffWidget;
import 'package:flutter/material.dart';

class CTimeOffModel extends FlutterFlowModel<CTimeOffWidget> {
  ///  Local state fields for this component.

  int noOfHours = 0;

  bool satarday = true;

  bool sunday = true;

  bool monday = true;

  bool? tuesday = true;

  bool wednesday = true;

  bool thursday = true;

  bool friday = true;

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

  ///  State fields for stateful widgets in this component.

  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textFieldTextController;
  String? Function(BuildContext, String?)? textFieldTextControllerValidator;
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
