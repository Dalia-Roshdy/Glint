import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'b_create_project_widget.dart' show BCreateProjectWidget;
import 'package:flutter/material.dart';

class BCreateProjectModel extends FlutterFlowModel<BCreateProjectWidget> {
  ///  Local state fields for this page.

  String? errorMS;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for projectName widget.
  FocusNode? projectNameFocusNode;
  TextEditingController? projectNameTextController;
  String? Function(BuildContext, String?)? projectNameTextControllerValidator;
  String? _projectNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Name is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? form;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? count;

  @override
  void initState(BuildContext context) {
    projectNameTextControllerValidator = _projectNameTextControllerValidator;
  }

  @override
  void dispose() {
    projectNameFocusNode?.dispose();
    projectNameTextController?.dispose();
  }
}
