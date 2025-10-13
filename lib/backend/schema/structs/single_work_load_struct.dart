// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SingleWorkLoadStruct extends FFFirebaseStruct {
  SingleWorkLoadStruct({
    String? date,
    String? day,
    bool? offDays,
    int? totalHours,
    List<SubProjectStruct>? projects,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _date = date,
        _day = day,
        _offDays = offDays,
        _totalHours = totalHours,
        _projects = projects,
        super(firestoreUtilData);

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;

  bool hasDate() => _date != null;

  // "day" field.
  String? _day;
  String get day => _day ?? '';
  set day(String? val) => _day = val;

  bool hasDay() => _day != null;

  // "off_days" field.
  bool? _offDays;
  bool get offDays => _offDays ?? false;
  set offDays(bool? val) => _offDays = val;

  bool hasOffDays() => _offDays != null;

  // "total_hours" field.
  int? _totalHours;
  int get totalHours => _totalHours ?? 0;
  set totalHours(int? val) => _totalHours = val;

  void incrementTotalHours(int amount) => totalHours = totalHours + amount;

  bool hasTotalHours() => _totalHours != null;

  // "projects" field.
  List<SubProjectStruct>? _projects;
  List<SubProjectStruct> get projects => _projects ?? const [];
  set projects(List<SubProjectStruct>? val) => _projects = val;

  void updateProjects(Function(List<SubProjectStruct>) updateFn) {
    updateFn(_projects ??= []);
  }

  bool hasProjects() => _projects != null;

  static SingleWorkLoadStruct fromMap(Map<String, dynamic> data) =>
      SingleWorkLoadStruct(
        date: data['date'] as String?,
        day: data['day'] as String?,
        offDays: data['off_days'] as bool?,
        totalHours: castToType<int>(data['total_hours']),
        projects: getStructList(
          data['projects'],
          SubProjectStruct.fromMap,
        ),
      );

  static SingleWorkLoadStruct? maybeFromMap(dynamic data) => data is Map
      ? SingleWorkLoadStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
        'day': _day,
        'off_days': _offDays,
        'total_hours': _totalHours,
        'projects': _projects?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
        'day': serializeParam(
          _day,
          ParamType.String,
        ),
        'off_days': serializeParam(
          _offDays,
          ParamType.bool,
        ),
        'total_hours': serializeParam(
          _totalHours,
          ParamType.int,
        ),
        'projects': serializeParam(
          _projects,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static SingleWorkLoadStruct fromSerializableMap(Map<String, dynamic> data) =>
      SingleWorkLoadStruct(
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
        day: deserializeParam(
          data['day'],
          ParamType.String,
          false,
        ),
        offDays: deserializeParam(
          data['off_days'],
          ParamType.bool,
          false,
        ),
        totalHours: deserializeParam(
          data['total_hours'],
          ParamType.int,
          false,
        ),
        projects: deserializeStructParam<SubProjectStruct>(
          data['projects'],
          ParamType.DataStruct,
          true,
          structBuilder: SubProjectStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'SingleWorkLoadStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SingleWorkLoadStruct &&
        date == other.date &&
        day == other.day &&
        offDays == other.offDays &&
        totalHours == other.totalHours &&
        listEquality.equals(projects, other.projects);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([date, day, offDays, totalHours, projects]);
}

SingleWorkLoadStruct createSingleWorkLoadStruct({
  String? date,
  String? day,
  bool? offDays,
  int? totalHours,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SingleWorkLoadStruct(
      date: date,
      day: day,
      offDays: offDays,
      totalHours: totalHours,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SingleWorkLoadStruct? updateSingleWorkLoadStruct(
  SingleWorkLoadStruct? singleWorkLoad, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    singleWorkLoad
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSingleWorkLoadStructData(
  Map<String, dynamic> firestoreData,
  SingleWorkLoadStruct? singleWorkLoad,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (singleWorkLoad == null) {
    return;
  }
  if (singleWorkLoad.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && singleWorkLoad.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final singleWorkLoadData =
      getSingleWorkLoadFirestoreData(singleWorkLoad, forFieldValue);
  final nestedData =
      singleWorkLoadData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = singleWorkLoad.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSingleWorkLoadFirestoreData(
  SingleWorkLoadStruct? singleWorkLoad, [
  bool forFieldValue = false,
]) {
  if (singleWorkLoad == null) {
    return {};
  }
  final firestoreData = mapToFirestore(singleWorkLoad.toMap());

  // Add any Firestore field values
  singleWorkLoad.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSingleWorkLoadListFirestoreData(
  List<SingleWorkLoadStruct>? singleWorkLoads,
) =>
    singleWorkLoads
        ?.map((e) => getSingleWorkLoadFirestoreData(e, true))
        .toList() ??
    [];
