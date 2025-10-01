import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'calendarwidget_copy_widget.dart' show CalendarwidgetCopyWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class CalendarwidgetCopyModel
    extends FlutterFlowModel<CalendarwidgetCopyWidget> {
  ///  Local state fields for this component.

  String startDate = '20250720';

  List<String> dateList = [];
  void addToDateList(String item) => dateList.add(item);
  void removeFromDateList(String item) => dateList.remove(item);
  void removeAtIndexFromDateList(int index) => dateList.removeAt(index);
  void insertAtIndexInDateList(int index, String item) =>
      dateList.insert(index, item);
  void updateDateListAtIndex(int index, Function(String) updateFn) =>
      dateList[index] = updateFn(dateList[index]);

  String selectedDate = '20050701';

  ///  State fields for stateful widgets in this component.

  Completer<ApiCallResponse>? apiRequestCompleter;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
