import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'c_add_team_members_widget.dart' show CAddTeamMembersWidget;
import 'package:flutter/material.dart';

class CAddTeamMembersModel extends FlutterFlowModel<CAddTeamMembersWidget> {
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

  UsersRecord? clikedUser;

  int employeeCount = 0;

  List<UsersRecord> empList = [];
  void addToEmpList(UsersRecord item) => empList.add(item);
  void removeFromEmpList(UsersRecord item) => empList.remove(item);
  void removeAtIndexFromEmpList(int index) => empList.removeAt(index);
  void insertAtIndexInEmpList(int index, UsersRecord item) =>
      empList.insert(index, item);
  void updateEmpListAtIndex(int index, Function(UsersRecord) updateFn) =>
      empList[index] = updateFn(empList[index]);

  ProjectPermissionsRecord? currentRecordVar;

  bool canAllocate = true;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in C-Add_Team_members widget.
  ProjectPermissionsRecord? projpermission;
  // Stores action output result for [Firestore Query - Query a collection] action in C-Add_Team_members widget.
  List<ProjectPermissionsRecord>? bookedUsers;
  // Stores action output result for [Firestore Query - Query a collection] action in C-Add_Team_members widget.
  List<UsersRecord>? allUsers;
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
  bool? switchValue1;
  // State field(s) for roleTextFieldupdate widget.
  FocusNode? roleTextFieldupdateFocusNode;
  TextEditingController? roleTextFieldupdateTextController;
  String? Function(BuildContext, String?)?
      roleTextFieldupdateTextControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    roleTextFieldFocusNode?.dispose();
    roleTextFieldTextController?.dispose();

    roleTextFieldupdateFocusNode?.dispose();
    roleTextFieldupdateTextController?.dispose();
  }
}
