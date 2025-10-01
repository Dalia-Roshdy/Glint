import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'c_add_team_members_copy2_widget.dart' show CAddTeamMembersCopy2Widget;
import 'package:flutter/material.dart';

class CAddTeamMembersCopy2Model
    extends FlutterFlowModel<CAddTeamMembersCopy2Widget> {
  ///  Local state fields for this page.

  List<UsersRecord> selectedUsers = [];
  void addToSelectedUsers(UsersRecord item) => selectedUsers.add(item);
  void removeFromSelectedUsers(UsersRecord item) => selectedUsers.remove(item);
  void removeAtIndexFromSelectedUsers(int index) =>
      selectedUsers.removeAt(index);
  void insertAtIndexInSelectedUsers(int index, UsersRecord item) =>
      selectedUsers.insert(index, item);
  void updateSelectedUsersAtIndex(int index, Function(UsersRecord) updateFn) =>
      selectedUsers[index] = updateFn(selectedUsers[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for UserDropDown widget.
  String? userDropDownValue;
  FormFieldController<String>? userDropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in UserDropDown widget.
  UsersRecord? userRef;
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
