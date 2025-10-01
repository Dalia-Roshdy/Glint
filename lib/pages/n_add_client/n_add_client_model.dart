import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'n_add_client_widget.dart' show NAddClientWidget;
import 'package:flutter/material.dart';

class NAddClientModel extends FlutterFlowModel<NAddClientWidget> {
  ///  Local state fields for this page.

  String? errorMS;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for clientName widget.
  FocusNode? clientNameFocusNode;
  TextEditingController? clientNameTextController;
  String? Function(BuildContext, String?)? clientNameTextControllerValidator;
  String? _clientNameTextControllerValidator(
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
  int? countUpd;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? count;

  @override
  void initState(BuildContext context) {
    clientNameTextControllerValidator = _clientNameTextControllerValidator;
  }

  @override
  void dispose() {
    clientNameFocusNode?.dispose();
    clientNameTextController?.dispose();
  }
}
