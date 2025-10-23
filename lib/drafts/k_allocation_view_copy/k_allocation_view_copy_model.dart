import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/calendarwidget/calendarwidget_widget.dart';
import '/pages/components/side_menu/side_menu_widget.dart';
import '/index.dart';
import 'k_allocation_view_copy_widget.dart' show KAllocationViewCopyWidget;
import 'package:flutter/material.dart';

class KAllocationViewCopyModel
    extends FlutterFlowModel<KAllocationViewCopyWidget> {
  ///  Local state fields for this page.

  DateTime? startDate;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in K-Allocation_viewCopy widget.
  List<ClientsRecord>? clientsList;
  // Model for sideMenu component.
  late SideMenuModel sideMenuModel;
  // Model for calendarwidget component.
  late CalendarwidgetModel calendarwidgetModel;

  @override
  void initState(BuildContext context) {
    sideMenuModel = createModel(context, () => SideMenuModel());
    calendarwidgetModel = createModel(context, () => CalendarwidgetModel());
  }

  @override
  void dispose() {
    sideMenuModel.dispose();
    calendarwidgetModel.dispose();
  }
}
