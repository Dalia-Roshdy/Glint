// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ProjectUserHoursStruct extends FFFirebaseStruct {
  ProjectUserHoursStruct({
    DateTime? date,
    DocumentReference? usreId,
    DocumentReference? projectId,
    int? totalUserHours,
    int? projectUserHours,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _date = date,
        _usreId = usreId,
        _projectId = projectId,
        _totalUserHours = totalUserHours,
        _projectUserHours = projectUserHours,
        super(firestoreUtilData);

  // "Date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "usre_id" field.
  DocumentReference? _usreId;
  DocumentReference? get usreId => _usreId;
  set usreId(DocumentReference? val) => _usreId = val;

  bool hasUsreId() => _usreId != null;

  // "project_id" field.
  DocumentReference? _projectId;
  DocumentReference? get projectId => _projectId;
  set projectId(DocumentReference? val) => _projectId = val;

  bool hasProjectId() => _projectId != null;

  // "total_user_hours" field.
  int? _totalUserHours;
  int get totalUserHours => _totalUserHours ?? 0;
  set totalUserHours(int? val) => _totalUserHours = val;

  void incrementTotalUserHours(int amount) =>
      totalUserHours = totalUserHours + amount;

  bool hasTotalUserHours() => _totalUserHours != null;

  // "project_user_hours" field.
  int? _projectUserHours;
  int get projectUserHours => _projectUserHours ?? 0;
  set projectUserHours(int? val) => _projectUserHours = val;

  void incrementProjectUserHours(int amount) =>
      projectUserHours = projectUserHours + amount;

  bool hasProjectUserHours() => _projectUserHours != null;

  static ProjectUserHoursStruct fromMap(Map<String, dynamic> data) =>
      ProjectUserHoursStruct(
        date: data['Date'] as DateTime?,
        usreId: data['usre_id'] as DocumentReference?,
        projectId: data['project_id'] as DocumentReference?,
        totalUserHours: castToType<int>(data['total_user_hours']),
        projectUserHours: castToType<int>(data['project_user_hours']),
      );

  static ProjectUserHoursStruct? maybeFromMap(dynamic data) => data is Map
      ? ProjectUserHoursStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Date': _date,
        'usre_id': _usreId,
        'project_id': _projectId,
        'total_user_hours': _totalUserHours,
        'project_user_hours': _projectUserHours,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'usre_id': serializeParam(
          _usreId,
          ParamType.DocumentReference,
        ),
        'project_id': serializeParam(
          _projectId,
          ParamType.DocumentReference,
        ),
        'total_user_hours': serializeParam(
          _totalUserHours,
          ParamType.int,
        ),
        'project_user_hours': serializeParam(
          _projectUserHours,
          ParamType.int,
        ),
      }.withoutNulls;

  static ProjectUserHoursStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ProjectUserHoursStruct(
        date: deserializeParam(
          data['Date'],
          ParamType.DateTime,
          false,
        ),
        usreId: deserializeParam(
          data['usre_id'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        projectId: deserializeParam(
          data['project_id'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['projects'],
        ),
        totalUserHours: deserializeParam(
          data['total_user_hours'],
          ParamType.int,
          false,
        ),
        projectUserHours: deserializeParam(
          data['project_user_hours'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ProjectUserHoursStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProjectUserHoursStruct &&
        date == other.date &&
        usreId == other.usreId &&
        projectId == other.projectId &&
        totalUserHours == other.totalUserHours &&
        projectUserHours == other.projectUserHours;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([date, usreId, projectId, totalUserHours, projectUserHours]);
}

ProjectUserHoursStruct createProjectUserHoursStruct({
  DateTime? date,
  DocumentReference? usreId,
  DocumentReference? projectId,
  int? totalUserHours,
  int? projectUserHours,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProjectUserHoursStruct(
      date: date,
      usreId: usreId,
      projectId: projectId,
      totalUserHours: totalUserHours,
      projectUserHours: projectUserHours,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProjectUserHoursStruct? updateProjectUserHoursStruct(
  ProjectUserHoursStruct? projectUserHoursStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    projectUserHoursStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProjectUserHoursStructData(
  Map<String, dynamic> firestoreData,
  ProjectUserHoursStruct? projectUserHoursStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (projectUserHoursStruct == null) {
    return;
  }
  if (projectUserHoursStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      projectUserHoursStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final projectUserHoursStructData =
      getProjectUserHoursFirestoreData(projectUserHoursStruct, forFieldValue);
  final nestedData =
      projectUserHoursStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      projectUserHoursStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProjectUserHoursFirestoreData(
  ProjectUserHoursStruct? projectUserHoursStruct, [
  bool forFieldValue = false,
]) {
  if (projectUserHoursStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(projectUserHoursStruct.toMap());

  // Add any Firestore field values
  projectUserHoursStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProjectUserHoursListFirestoreData(
  List<ProjectUserHoursStruct>? projectUserHoursStructs,
) =>
    projectUserHoursStructs
        ?.map((e) => getProjectUserHoursFirestoreData(e, true))
        .toList() ??
    [];
