import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/side_menu/side_menu_widget.dart';
import '/index.dart';
import 'f_calender_allocations_widget.dart' show FCalenderAllocationsWidget;
import 'package:flutter/material.dart';

class FCalenderAllocationsModel
    extends FlutterFlowModel<FCalenderAllocationsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for sideMenu component.
  late SideMenuModel sideMenuModel;
  // State field(s) for Slider widget.
  double? sliderValue;

  @override
  void initState(BuildContext context) {
    sideMenuModel = createModel(context, () => SideMenuModel());
  }

  @override
  void dispose() {
    sideMenuModel.dispose();
  }
}
