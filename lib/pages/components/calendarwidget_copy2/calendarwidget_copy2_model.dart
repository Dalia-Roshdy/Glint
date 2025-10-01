import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'calendarwidget_copy2_widget.dart' show CalendarwidgetCopy2Widget;
import 'package:flutter/material.dart';

class CalendarwidgetCopy2Model
    extends FlutterFlowModel<CalendarwidgetCopy2Widget> {
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

  List<UserProjectListStruct> apiResult = [];
  void addToApiResult(UserProjectListStruct item) => apiResult.add(item);
  void removeFromApiResult(UserProjectListStruct item) =>
      apiResult.remove(item);
  void removeAtIndexFromApiResult(int index) => apiResult.removeAt(index);
  void insertAtIndexInApiResult(int index, UserProjectListStruct item) =>
      apiResult.insert(index, item);
  void updateApiResultAtIndex(
          int index, Function(UserProjectListStruct) updateFn) =>
      apiResult[index] = updateFn(apiResult[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (WorkLoadTest)] action in calendarwidgetCopy2 widget.
  ApiCallResponse? apiResultns4;
  DateTime? datePicked;
  // Stores action output result for [Backend Call - API (WorkLoadTest)] action in Container widget.
  ApiCallResponse? apiResultns3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
