import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'l_forget_password_widget.dart' show LForgetPasswordWidget;
import 'package:flutter/material.dart';

class LForgetPasswordModel extends FlutterFlowModel<LForgetPasswordWidget> {
  ///  Local state fields for this page.

  String? errorMS;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for emailAddress_register widget.
  FocusNode? emailAddressRegisterFocusNode;
  TextEditingController? emailAddressRegisterTextController;
  String? Function(BuildContext, String?)?
      emailAddressRegisterTextControllerValidator;
  String? _emailAddressRegisterTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? count;

  @override
  void initState(BuildContext context) {
    emailAddressRegisterTextControllerValidator =
        _emailAddressRegisterTextControllerValidator;
  }

  @override
  void dispose() {
    emailAddressRegisterFocusNode?.dispose();
    emailAddressRegisterTextController?.dispose();
  }
}
