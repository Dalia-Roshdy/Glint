import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'c_add_team_members_copy_widget.dart' show CAddTeamMembersCopyWidget;
import 'package:flutter/material.dart';

class CAddTeamMembersCopyModel
    extends FlutterFlowModel<CAddTeamMembersCopyWidget> {
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

  ProjectPermissionsRecord? projPerSelected;

  bool isUpdate = true;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for UserDropDown widget.
  String? userDropDownValue;
  FormFieldController<String>? userDropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in UserDropDown widget.
  UsersRecord? userRef;
  // State field(s) for roleTextField widget.
  FocusNode? roleTextFieldFocusNode1;
  TextEditingController? roleTextFieldTextController1;
  String? Function(BuildContext, String?)?
      roleTextFieldTextController1Validator;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for roleTextField widget.
  FocusNode? roleTextFieldFocusNode2;
  TextEditingController? roleTextFieldTextController2;
  String? Function(BuildContext, String?)?
      roleTextFieldTextController2Validator;
  // State field(s) for Switch widget.
  bool? switchValue2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    roleTextFieldFocusNode1?.dispose();
    roleTextFieldTextController1?.dispose();

    roleTextFieldFocusNode2?.dispose();
    roleTextFieldTextController2?.dispose();
  }
}
