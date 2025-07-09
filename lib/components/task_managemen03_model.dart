import '/flutter_flow/flutter_flow_util.dart';
import 'task_managemen03_widget.dart' show TaskManagemen03Widget;
import 'package:flutter/material.dart';

class TaskManagemen03Model extends FlutterFlowModel<TaskManagemen03Widget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
