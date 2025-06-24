import '/flutter_flow/flutter_flow_util.dart';
import 'd_add_project_screen_draft_widget.dart'
    show DAddProjectScreenDraftWidget;
import 'package:flutter/material.dart';

class DAddProjectScreenDraftModel
    extends FlutterFlowModel<DAddProjectScreenDraftWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
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
