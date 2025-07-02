// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CalendarProjectDataStruct extends FFFirebaseStruct {
  CalendarProjectDataStruct({
    DocumentReference? projectId,
    DateTime? date,
    int? workingHours,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _projectId = projectId,
        _date = date,
        _workingHours = workingHours,
        super(firestoreUtilData);

  // "projectId" field.
  DocumentReference? _projectId;
  DocumentReference? get projectId => _projectId;
  set projectId(DocumentReference? val) => _projectId = val;

  bool hasProjectId() => _projectId != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "workingHours" field.
  int? _workingHours;
  int get workingHours => _workingHours ?? 0;
  set workingHours(int? val) => _workingHours = val;

  void incrementWorkingHours(int amount) =>
      workingHours = workingHours + amount;

  bool hasWorkingHours() => _workingHours != null;

  static CalendarProjectDataStruct fromMap(Map<String, dynamic> data) =>
      CalendarProjectDataStruct(
        projectId: data['projectId'] as DocumentReference?,
        date: data['date'] as DateTime?,
        workingHours: castToType<int>(data['workingHours']),
      );

  static CalendarProjectDataStruct? maybeFromMap(dynamic data) => data is Map
      ? CalendarProjectDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'projectId': _projectId,
        'date': _date,
        'workingHours': _workingHours,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'projectId': serializeParam(
          _projectId,
          ParamType.DocumentReference,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'workingHours': serializeParam(
          _workingHours,
          ParamType.int,
        ),
      }.withoutNulls;

  static CalendarProjectDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CalendarProjectDataStruct(
        projectId: deserializeParam(
          data['projectId'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['projects'],
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        workingHours: deserializeParam(
          data['workingHours'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'CalendarProjectDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CalendarProjectDataStruct &&
        projectId == other.projectId &&
        date == other.date &&
        workingHours == other.workingHours;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([projectId, date, workingHours]);
}

CalendarProjectDataStruct createCalendarProjectDataStruct({
  DocumentReference? projectId,
  DateTime? date,
  int? workingHours,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CalendarProjectDataStruct(
      projectId: projectId,
      date: date,
      workingHours: workingHours,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CalendarProjectDataStruct? updateCalendarProjectDataStruct(
  CalendarProjectDataStruct? calendarProjectData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    calendarProjectData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCalendarProjectDataStructData(
  Map<String, dynamic> firestoreData,
  CalendarProjectDataStruct? calendarProjectData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (calendarProjectData == null) {
    return;
  }
  if (calendarProjectData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && calendarProjectData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final calendarProjectDataData =
      getCalendarProjectDataFirestoreData(calendarProjectData, forFieldValue);
  final nestedData =
      calendarProjectDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      calendarProjectData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCalendarProjectDataFirestoreData(
  CalendarProjectDataStruct? calendarProjectData, [
  bool forFieldValue = false,
]) {
  if (calendarProjectData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(calendarProjectData.toMap());

  // Add any Firestore field values
  calendarProjectData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCalendarProjectDataListFirestoreData(
  List<CalendarProjectDataStruct>? calendarProjectDatas,
) =>
    calendarProjectDatas
        ?.map((e) => getCalendarProjectDataFirestoreData(e, true))
        .toList() ??
    [];
