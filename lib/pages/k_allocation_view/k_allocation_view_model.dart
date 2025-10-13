import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/calendarwidget/calendarwidget_widget.dart';
import '/pages/components/side_menu/side_menu_widget.dart';
import 'k_allocation_view_widget.dart' show KAllocationViewWidget;
import 'package:flutter/material.dart';

class KAllocationViewModel extends FlutterFlowModel<KAllocationViewWidget> {
  ///  Local state fields for this page.

  DateTime? startDate;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in K-Allocation_view widget.
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
