import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/components/d_no_res/d_no_res_widget.dart';
import '/pages/components/side_menu/side_menu_widget.dart';
import 'k1_allocation_view_rescource_view_widget.dart'
    show K1AllocationViewRescourceViewWidget;
import 'package:flutter/material.dart';

class K1AllocationViewRescourceViewModel
    extends FlutterFlowModel<K1AllocationViewRescourceViewWidget> {
  ///  Local state fields for this page.

  String? selectedDate;

  List<UsersRecord> usersList = [];
  void addToUsersList(UsersRecord item) => usersList.add(item);
  void removeFromUsersList(UsersRecord item) => usersList.remove(item);
  void removeAtIndexFromUsersList(int index) => usersList.removeAt(index);
  void insertAtIndexInUsersList(int index, UsersRecord item) =>
      usersList.insert(index, item);
  void updateUsersListAtIndex(int index, Function(UsersRecord) updateFn) =>
      usersList[index] = updateFn(usersList[index]);

  UsersRecord? selectedRes;

  List<String> dateList = [];
  void addToDateList(String item) => dateList.add(item);
  void removeFromDateList(String item) => dateList.remove(item);
  void removeAtIndexFromDateList(int index) => dateList.removeAt(index);
  void insertAtIndexInDateList(int index, String item) =>
      dateList.insert(index, item);
  void updateDateListAtIndex(int index, Function(String) updateFn) =>
      dateList[index] = updateFn(dateList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in K-1-Allocation_view_rescource_view widget.
  List<UsersRecord>? users;
  // Model for sideMenu component.
  late SideMenuModel sideMenuModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  UsersRecord? selecUser;
  DateTime? datePicked;
  // Model for D-No_Res component.
  late DNoResModel dNoResModel;

  @override
  void initState(BuildContext context) {
    sideMenuModel = createModel(context, () => SideMenuModel());
    dNoResModel = createModel(context, () => DNoResModel());
  }

  @override
  void dispose() {
    sideMenuModel.dispose();
    dNoResModel.dispose();
  }
}
