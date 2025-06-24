// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class WorkingDayHourStruct extends FFFirebaseStruct {
  WorkingDayHourStruct({
    String? workingDay,
    int? workingHour,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _workingDay = workingDay,
        _workingHour = workingHour,
        super(firestoreUtilData);

  // "working_day" field.
  String? _workingDay;
  String get workingDay => _workingDay ?? 'Mon';
  set workingDay(String? val) => _workingDay = val;

  bool hasWorkingDay() => _workingDay != null;

  // "working_hour" field.
  int? _workingHour;
  int get workingHour => _workingHour ?? 8;
  set workingHour(int? val) => _workingHour = val;

  void incrementWorkingHour(int amount) => workingHour = workingHour + amount;

  bool hasWorkingHour() => _workingHour != null;

  static WorkingDayHourStruct fromMap(Map<String, dynamic> data) =>
      WorkingDayHourStruct(
        workingDay: data['working_day'] as String?,
        workingHour: castToType<int>(data['working_hour']),
      );

  static WorkingDayHourStruct? maybeFromMap(dynamic data) => data is Map
      ? WorkingDayHourStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'working_day': _workingDay,
        'working_hour': _workingHour,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'working_day': serializeParam(
          _workingDay,
          ParamType.String,
        ),
        'working_hour': serializeParam(
          _workingHour,
          ParamType.int,
        ),
      }.withoutNulls;

  static WorkingDayHourStruct fromSerializableMap(Map<String, dynamic> data) =>
      WorkingDayHourStruct(
        workingDay: deserializeParam(
          data['working_day'],
          ParamType.String,
          false,
        ),
        workingHour: deserializeParam(
          data['working_hour'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'WorkingDayHourStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WorkingDayHourStruct &&
        workingDay == other.workingDay &&
        workingHour == other.workingHour;
  }

  @override
  int get hashCode => const ListEquality().hash([workingDay, workingHour]);
}

WorkingDayHourStruct createWorkingDayHourStruct({
  String? workingDay,
  int? workingHour,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WorkingDayHourStruct(
      workingDay: workingDay,
      workingHour: workingHour,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

WorkingDayHourStruct? updateWorkingDayHourStruct(
  WorkingDayHourStruct? workingDayHour, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    workingDayHour
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addWorkingDayHourStructData(
  Map<String, dynamic> firestoreData,
  WorkingDayHourStruct? workingDayHour,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (workingDayHour == null) {
    return;
  }
  if (workingDayHour.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && workingDayHour.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final workingDayHourData =
      getWorkingDayHourFirestoreData(workingDayHour, forFieldValue);
  final nestedData =
      workingDayHourData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = workingDayHour.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getWorkingDayHourFirestoreData(
  WorkingDayHourStruct? workingDayHour, [
  bool forFieldValue = false,
]) {
  if (workingDayHour == null) {
    return {};
  }
  final firestoreData = mapToFirestore(workingDayHour.toMap());

  // Add any Firestore field values
  workingDayHour.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWorkingDayHourListFirestoreData(
  List<WorkingDayHourStruct>? workingDayHours,
) =>
    workingDayHours
        ?.map((e) => getWorkingDayHourFirestoreData(e, true))
        .toList() ??
    [];
