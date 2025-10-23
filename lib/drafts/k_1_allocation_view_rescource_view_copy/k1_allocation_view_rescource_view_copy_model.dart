import '/backend/backend.dart';
import '/drafts/resource_calender/resource_calender_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/side_menu/side_menu_widget.dart';
import '/index.dart';
import 'k1_allocation_view_rescource_view_copy_widget.dart'
    show K1AllocationViewRescourceViewCopyWidget;
import 'package:flutter/material.dart';

class K1AllocationViewRescourceViewCopyModel
    extends FlutterFlowModel<K1AllocationViewRescourceViewCopyWidget> {
  ///  Local state fields for this page.

  DateTime? startDate;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in K-1-Allocation_view_rescource_viewCopy widget.
  List<ClientsRecord>? clientsList;
  // Model for sideMenu component.
  late SideMenuModel sideMenuModel;
  // Model for Resource_calender component.
  late ResourceCalenderModel resourceCalenderModel;

  @override
  void initState(BuildContext context) {
    sideMenuModel = createModel(context, () => SideMenuModel());
    resourceCalenderModel = createModel(context, () => ResourceCalenderModel());
  }

  @override
  void dispose() {
    sideMenuModel.dispose();
    resourceCalenderModel.dispose();
  }
}
