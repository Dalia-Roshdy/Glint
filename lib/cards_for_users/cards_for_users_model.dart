import '/flutter_flow/flutter_flow_util.dart';
import 'cards_for_users_widget.dart' show CardsForUsersWidget;
import 'package:flutter/material.dart';

class CardsForUsersModel extends FlutterFlowModel<CardsForUsersWidget> {
  ///  State fields for stateful widgets in this page.

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
