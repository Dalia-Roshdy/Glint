import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/d_add_project_member/d_add_project_member_widget.dart';
import '/pages/components/side_menu/side_menu_widget.dart';
import '/index.dart';
import 'd_people_management_dashboard_widget.dart'
    show DPeopleManagementDashboardWidget;
import 'package:flutter/material.dart';

class DPeopleManagementDashboardModel
    extends FlutterFlowModel<DPeopleManagementDashboardWidget> {
  ///  Local state fields for this page.

  bool currentUserCanAllocate = true;

  List<ProjectPermissionsRecord> projectUsers = [];
  void addToProjectUsers(ProjectPermissionsRecord item) =>
      projectUsers.add(item);
  void removeFromProjectUsers(ProjectPermissionsRecord item) =>
      projectUsers.remove(item);
  void removeAtIndexFromProjectUsers(int index) => projectUsers.removeAt(index);
  void insertAtIndexInProjectUsers(int index, ProjectPermissionsRecord item) =>
      projectUsers.insert(index, item);
  void updateProjectUsersAtIndex(
          int index, Function(ProjectPermissionsRecord) updateFn) =>
      projectUsers[index] = updateFn(projectUsers[index]);

  int showPicture = 0;

  bool canBook = true;

  bool allowAllocation = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in D-People_management_dashboard widget.
  ProjectPermissionsRecord? currentPerm;
  // Stores action output result for [Firestore Query - Query a collection] action in D-People_management_dashboard widget.
  List<ProjectPermissionsRecord>? permissions;
  // Model for sideMenu component.
  late SideMenuModel sideMenuModel;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<ProjectPermissionsRecord>();
  // Model for D-add_project_member component.
  late DAddProjectMemberModel dAddProjectMemberModel;

  @override
  void initState(BuildContext context) {
    sideMenuModel = createModel(context, () => SideMenuModel());
    dAddProjectMemberModel =
        createModel(context, () => DAddProjectMemberModel());
  }

  @override
  void dispose() {
    sideMenuModel.dispose();
    paginatedDataTableController.dispose();
    dAddProjectMemberModel.dispose();
  }
}
