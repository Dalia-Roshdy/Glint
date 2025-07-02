// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CalendarUserDataStruct extends FFFirebaseStruct {
  CalendarUserDataStruct({
    DocumentReference? userId,
    DateTime? date,
    int? workingHours,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userId = userId,
        _date = date,
        _workingHours = workingHours,
        super(firestoreUtilData);

  // "userId" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  set userId(DocumentReference? val) => _userId = val;

  bool hasUserId() => _userId != null;

  // "Date" field.
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

  static CalendarUserDataStruct fromMap(Map<String, dynamic> data) =>
      CalendarUserDataStruct(
        userId: data['userId'] as DocumentReference?,
        date: data['Date'] as DateTime?,
        workingHours: castToType<int>(data['workingHours']),
      );

  static CalendarUserDataStruct? maybeFromMap(dynamic data) => data is Map
      ? CalendarUserDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'userId': _userId,
        'Date': _date,
        'workingHours': _workingHours,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'userId': serializeParam(
          _userId,
          ParamType.DocumentReference,
        ),
        'Date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'workingHours': serializeParam(
          _workingHours,
          ParamType.int,
        ),
      }.withoutNulls;

  static CalendarUserDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CalendarUserDataStruct(
        userId: deserializeParam(
          data['userId'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        date: deserializeParam(
          data['Date'],
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
  String toString() => 'CalendarUserDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CalendarUserDataStruct &&
        userId == other.userId &&
        date == other.date &&
        workingHours == other.workingHours;
  }

  @override
  int get hashCode => const ListEquality().hash([userId, date, workingHours]);
}

CalendarUserDataStruct createCalendarUserDataStruct({
  DocumentReference? userId,
  DateTime? date,
  int? workingHours,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CalendarUserDataStruct(
      userId: userId,
      date: date,
      workingHours: workingHours,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CalendarUserDataStruct? updateCalendarUserDataStruct(
  CalendarUserDataStruct? calendarUserData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    calendarUserData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCalendarUserDataStructData(
  Map<String, dynamic> firestoreData,
  CalendarUserDataStruct? calendarUserData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (calendarUserData == null) {
    return;
  }
  if (calendarUserData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && calendarUserData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final calendarUserDataData =
      getCalendarUserDataFirestoreData(calendarUserData, forFieldValue);
  final nestedData =
      calendarUserDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = calendarUserData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCalendarUserDataFirestoreData(
  CalendarUserDataStruct? calendarUserData, [
  bool forFieldValue = false,
]) {
  if (calendarUserData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(calendarUserData.toMap());

  // Add any Firestore field values
  calendarUserData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCalendarUserDataListFirestoreData(
  List<CalendarUserDataStruct>? calendarUserDatas,
) =>
    calendarUserDatas
        ?.map((e) => getCalendarUserDataFirestoreData(e, true))
        .toList() ??
    [];
