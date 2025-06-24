import '/flutter_flow/flutter_flow_util.dart';
import 'b_create_team_widget.dart' show BCreateTeamWidget;
import 'package:flutter/material.dart';

class BCreateTeamModel extends FlutterFlowModel<BCreateTeamWidget> {
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
