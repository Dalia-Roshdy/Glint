import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/message_add/message_add_widget.dart';
import '/pages/components/side_menu/side_menu_widget.dart';
import '/index.dart';
import 'e_project_management_new_widget.dart' show EProjectManagementNewWidget;
import 'package:flutter/material.dart';

class EProjectManagementNewModel
    extends FlutterFlowModel<EProjectManagementNewWidget> {
  ///  Local state fields for this page.

  int activeProject = 0;

  int? totalProjects = 0;

  List<ProjectsRecord> userProjectList = [];
  void addToUserProjectList(ProjectsRecord item) => userProjectList.add(item);
  void removeFromUserProjectList(ProjectsRecord item) =>
      userProjectList.remove(item);
  void removeAtIndexFromUserProjectList(int index) =>
      userProjectList.removeAt(index);
  void insertAtIndexInUserProjectList(int index, ProjectsRecord item) =>
      userProjectList.insert(index, item);
  void updateUserProjectListAtIndex(
          int index, Function(ProjectsRecord) updateFn) =>
      userProjectList[index] = updateFn(userProjectList[index]);

  List<ProjectColorRecord> colorList = [];
  void addToColorList(ProjectColorRecord item) => colorList.add(item);
  void removeFromColorList(ProjectColorRecord item) => colorList.remove(item);
  void removeAtIndexFromColorList(int index) => colorList.removeAt(index);
  void insertAtIndexInColorList(int index, ProjectColorRecord item) =>
      colorList.insert(index, item);
  void updateColorListAtIndex(
          int index, Function(ProjectColorRecord) updateFn) =>
      colorList[index] = updateFn(colorList[index]);

  int showPicture = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in E-Project_management_new widget.
  List<ClientsRecord>? clientsList;
  // Stores action output result for [Firestore Query - Query a collection] action in E-Project_management_new widget.
  List<ProjectColorRecord>? colors;
  // Stores action output result for [Custom Action - getUserProjects] action in E-Project_management_new widget.
  List<ProjectsRecord>? ptojectList;
  // Stores action output result for [Firestore Query - Query a collection] action in E-Project_management_new widget.
  List<ProjectsRecord>? projList;
  // Model for sideMenu component.
  late SideMenuModel sideMenuModel;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<ProjectsRecord>();
  // Model for message_add component.
  late MessageAddModel messageAddModel;

  @override
  void initState(BuildContext context) {
    sideMenuModel = createModel(context, () => SideMenuModel());
    messageAddModel = createModel(context, () => MessageAddModel());
  }

  @override
  void dispose() {
    sideMenuModel.dispose();
    paginatedDataTableController.dispose();
    messageAddModel.dispose();
  }
}
