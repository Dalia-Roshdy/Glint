import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'b_create_project_widget.dart' show BCreateProjectWidget;
import 'package:flutter/material.dart';

class BCreateProjectModel extends FlutterFlowModel<BCreateProjectWidget> {
  ///  Local state fields for this page.

  String? errorMS;

  ClientsRecord? client;

  bool active = true;

  List<ProjectColorRecord> colorData = [];
  void addToColorData(ProjectColorRecord item) => colorData.add(item);
  void removeFromColorData(ProjectColorRecord item) => colorData.remove(item);
  void removeAtIndexFromColorData(int index) => colorData.removeAt(index);
  void insertAtIndexInColorData(int index, ProjectColorRecord item) =>
      colorData.insert(index, item);
  void updateColorDataAtIndex(
          int index, Function(ProjectColorRecord) updateFn) =>
      colorData[index] = updateFn(colorData[index]);

  String? color;

  List<ClientsRecord> clientList = [];
  void addToClientList(ClientsRecord item) => clientList.add(item);
  void removeFromClientList(ClientsRecord item) => clientList.remove(item);
  void removeAtIndexFromClientList(int index) => clientList.removeAt(index);
  void insertAtIndexInClientList(int index, ClientsRecord item) =>
      clientList.insert(index, item);
  void updateClientListAtIndex(int index, Function(ClientsRecord) updateFn) =>
      clientList[index] = updateFn(clientList[index]);

  int colorCount = 0;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in B-Create_project widget.
  List<ProjectColorRecord>? colorList;
  // Stores action output result for [Firestore Query - Query a collection] action in B-Create_project widget.
  List<ProjectsRecord>? projectList;
  // Stores action output result for [Firestore Query - Query a collection] action in B-Create_project widget.
  List<ClientsRecord>? clientsVar;
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

  // State field(s) for color widget.
  String? colorValue;
  FormFieldController<String>? colorValueController;
  // State field(s) for client widget.
  String? clientValue;
  FormFieldController<String>? clientValueController;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? form;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? updateCount;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? count;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ProjectsRecord? createdProject;

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
