import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'c_edit_team_members_widget.dart' show CEditTeamMembersWidget;
import 'package:flutter/material.dart';

class CEditTeamMembersModel extends FlutterFlowModel<CEditTeamMembersWidget> {
  ///  Local state fields for this page.

  ProjectPermissionsRecord? projectPer;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for roleTextField widget.
  FocusNode? roleTextFieldFocusNode;
  TextEditingController? roleTextFieldTextController;
  String? Function(BuildContext, String?)? roleTextFieldTextControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    roleTextFieldFocusNode?.dispose();
    roleTextFieldTextController?.dispose();
  }
}
