// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SubProjectStruct extends FFFirebaseStruct {
  SubProjectStruct({
    String? name,
    String? color,
    String? roleInProject,
    String? assignedBy,
    String? startDate,
    String? endDate,
    int? hours,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _color = color,
        _roleInProject = roleInProject,
        _assignedBy = assignedBy,
        _startDate = startDate,
        _endDate = endDate,
        _hours = hours,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "color" field.
  String? _color;
  String get color => _color ?? '';
  set color(String? val) => _color = val;

  bool hasColor() => _color != null;

  // "role_in_project" field.
  String? _roleInProject;
  String get roleInProject => _roleInProject ?? '';
  set roleInProject(String? val) => _roleInProject = val;

  bool hasRoleInProject() => _roleInProject != null;

  // "assigned_by" field.
  String? _assignedBy;
  String get assignedBy => _assignedBy ?? '';
  set assignedBy(String? val) => _assignedBy = val;

  bool hasAssignedBy() => _assignedBy != null;

  // "start_date" field.
  String? _startDate;
  String get startDate => _startDate ?? '';
  set startDate(String? val) => _startDate = val;

  bool hasStartDate() => _startDate != null;

  // "end_date" field.
  String? _endDate;
  String get endDate => _endDate ?? '';
  set endDate(String? val) => _endDate = val;

  bool hasEndDate() => _endDate != null;

  // "hours" field.
  int? _hours;
  int get hours => _hours ?? 0;
  set hours(int? val) => _hours = val;

  void incrementHours(int amount) => hours = hours + amount;

  bool hasHours() => _hours != null;

  static SubProjectStruct fromMap(Map<String, dynamic> data) =>
      SubProjectStruct(
        name: data['name'] as String?,
        color: data['color'] as String?,
        roleInProject: data['role_in_project'] as String?,
        assignedBy: data['assigned_by'] as String?,
        startDate: data['start_date'] as String?,
        endDate: data['end_date'] as String?,
        hours: castToType<int>(data['hours']),
      );

  static SubProjectStruct? maybeFromMap(dynamic data) => data is Map
      ? SubProjectStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'color': _color,
        'role_in_project': _roleInProject,
        'assigned_by': _assignedBy,
        'start_date': _startDate,
        'end_date': _endDate,
        'hours': _hours,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'color': serializeParam(
          _color,
          ParamType.String,
        ),
        'role_in_project': serializeParam(
          _roleInProject,
          ParamType.String,
        ),
        'assigned_by': serializeParam(
          _assignedBy,
          ParamType.String,
        ),
        'start_date': serializeParam(
          _startDate,
          ParamType.String,
        ),
        'end_date': serializeParam(
          _endDate,
          ParamType.String,
        ),
        'hours': serializeParam(
          _hours,
          ParamType.int,
        ),
      }.withoutNulls;

  static SubProjectStruct fromSerializableMap(Map<String, dynamic> data) =>
      SubProjectStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.String,
          false,
        ),
        roleInProject: deserializeParam(
          data['role_in_project'],
          ParamType.String,
          false,
        ),
        assignedBy: deserializeParam(
          data['assigned_by'],
          ParamType.String,
          false,
        ),
        startDate: deserializeParam(
          data['start_date'],
          ParamType.String,
          false,
        ),
        endDate: deserializeParam(
          data['end_date'],
          ParamType.String,
          false,
        ),
        hours: deserializeParam(
          data['hours'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'SubProjectStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SubProjectStruct &&
        name == other.name &&
        color == other.color &&
        roleInProject == other.roleInProject &&
        assignedBy == other.assignedBy &&
        startDate == other.startDate &&
        endDate == other.endDate &&
        hours == other.hours;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [name, color, roleInProject, assignedBy, startDate, endDate, hours]);
}

SubProjectStruct createSubProjectStruct({
  String? name,
  String? color,
  String? roleInProject,
  String? assignedBy,
  String? startDate,
  String? endDate,
  int? hours,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SubProjectStruct(
      name: name,
      color: color,
      roleInProject: roleInProject,
      assignedBy: assignedBy,
      startDate: startDate,
      endDate: endDate,
      hours: hours,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SubProjectStruct? updateSubProjectStruct(
  SubProjectStruct? subProject, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    subProject
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSubProjectStructData(
  Map<String, dynamic> firestoreData,
  SubProjectStruct? subProject,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (subProject == null) {
    return;
  }
  if (subProject.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && subProject.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final subProjectData = getSubProjectFirestoreData(subProject, forFieldValue);
  final nestedData = subProjectData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = subProject.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSubProjectFirestoreData(
  SubProjectStruct? subProject, [
  bool forFieldValue = false,
]) {
  if (subProject == null) {
    return {};
  }
  final firestoreData = mapToFirestore(subProject.toMap());

  // Add any Firestore field values
  subProject.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSubProjectListFirestoreData(
  List<SubProjectStruct>? subProjects,
) =>
    subProjects?.map((e) => getSubProjectFirestoreData(e, true)).toList() ?? [];
