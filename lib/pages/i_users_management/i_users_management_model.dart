import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/side_menu/side_menu_widget.dart';
import '/index.dart';
import 'i_users_management_widget.dart' show IUsersManagementWidget;
import 'package:flutter/material.dart';

class IUsersManagementModel extends FlutterFlowModel<IUsersManagementWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for sideMenu component.
  late SideMenuModel sideMenuModel;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<UsersRecord>();

  @override
  void initState(BuildContext context) {
    sideMenuModel = createModel(context, () => SideMenuModel());
  }

  @override
  void dispose() {
    sideMenuModel.dispose();
    paginatedDataTableController.dispose();
  }
}
