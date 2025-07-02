// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DateHourStruct extends FFFirebaseStruct {
  DateHourStruct({
    DateTime? date,
    int? hours,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _date = date,
        _hours = hours,
        super(firestoreUtilData);

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "hours" field.
  int? _hours;
  int get hours => _hours ?? 0;
  set hours(int? val) => _hours = val;

  void incrementHours(int amount) => hours = hours + amount;

  bool hasHours() => _hours != null;

  static DateHourStruct fromMap(Map<String, dynamic> data) => DateHourStruct(
        date: data['date'] as DateTime?,
        hours: castToType<int>(data['hours']),
      );

  static DateHourStruct? maybeFromMap(dynamic data) =>
      data is Map ? DateHourStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
        'hours': _hours,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'hours': serializeParam(
          _hours,
          ParamType.int,
        ),
      }.withoutNulls;

  static DateHourStruct fromSerializableMap(Map<String, dynamic> data) =>
      DateHourStruct(
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        hours: deserializeParam(
          data['hours'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DateHourStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DateHourStruct &&
        date == other.date &&
        hours == other.hours;
  }

  @override
  int get hashCode => const ListEquality().hash([date, hours]);
}

DateHourStruct createDateHourStruct({
  DateTime? date,
  int? hours,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DateHourStruct(
      date: date,
      hours: hours,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DateHourStruct? updateDateHourStruct(
  DateHourStruct? dateHour, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dateHour
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDateHourStructData(
  Map<String, dynamic> firestoreData,
  DateHourStruct? dateHour,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dateHour == null) {
    return;
  }
  if (dateHour.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dateHour.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dateHourData = getDateHourFirestoreData(dateHour, forFieldValue);
  final nestedData = dateHourData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dateHour.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDateHourFirestoreData(
  DateHourStruct? dateHour, [
  bool forFieldValue = false,
]) {
  if (dateHour == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dateHour.toMap());

  // Add any Firestore field values
  dateHour.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDateHourListFirestoreData(
  List<DateHourStruct>? dateHours,
) =>
    dateHours?.map((e) => getDateHourFirestoreData(e, true)).toList() ?? [];
