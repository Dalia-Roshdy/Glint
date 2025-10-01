// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserProjectListStruct extends FFFirebaseStruct {
  UserProjectListStruct({
    String? userId,
    String? displayName,
    String? date,
    int? workingHours,
    String? projectId,
    String? projectName,
    int? allocatedHours,
    String? photoUrl,
    String? color,
    Color? allocationColor,
    int? isHoliday,
    String? main,
    String? complementary,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userId = userId,
        _displayName = displayName,
        _date = date,
        _workingHours = workingHours,
        _projectId = projectId,
        _projectName = projectName,
        _allocatedHours = allocatedHours,
        _photoUrl = photoUrl,
        _color = color,
        _allocationColor = allocationColor,
        _isHoliday = isHoliday,
        _main = main,
        _complementary = complementary,
        super(firestoreUtilData);

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  set displayName(String? val) => _displayName = val;

  bool hasDisplayName() => _displayName != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;

  bool hasDate() => _date != null;

  // "working_hours" field.
  int? _workingHours;
  int get workingHours => _workingHours ?? 0;
  set workingHours(int? val) => _workingHours = val;

  void incrementWorkingHours(int amount) =>
      workingHours = workingHours + amount;

  bool hasWorkingHours() => _workingHours != null;

  // "project_id" field.
  String? _projectId;
  String get projectId => _projectId ?? '';
  set projectId(String? val) => _projectId = val;

  bool hasProjectId() => _projectId != null;

  // "project_name" field.
  String? _projectName;
  String get projectName => _projectName ?? '';
  set projectName(String? val) => _projectName = val;

  bool hasProjectName() => _projectName != null;

  // "allocated_hours" field.
  int? _allocatedHours;
  int get allocatedHours => _allocatedHours ?? 0;
  set allocatedHours(int? val) => _allocatedHours = val;

  void incrementAllocatedHours(int amount) =>
      allocatedHours = allocatedHours + amount;

  bool hasAllocatedHours() => _allocatedHours != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  set photoUrl(String? val) => _photoUrl = val;

  bool hasPhotoUrl() => _photoUrl != null;

  // "color" field.
  String? _color;
  String get color => _color ?? '';
  set color(String? val) => _color = val;

  bool hasColor() => _color != null;

  // "allocation_color" field.
  Color? _allocationColor;
  Color? get allocationColor => _allocationColor;
  set allocationColor(Color? val) => _allocationColor = val;

  bool hasAllocationColor() => _allocationColor != null;

  // "isHoliday" field.
  int? _isHoliday;
  int get isHoliday => _isHoliday ?? 0;
  set isHoliday(int? val) => _isHoliday = val;

  void incrementIsHoliday(int amount) => isHoliday = isHoliday + amount;

  bool hasIsHoliday() => _isHoliday != null;

  // "main" field.
  String? _main;
  String get main => _main ?? '';
  set main(String? val) => _main = val;

  bool hasMain() => _main != null;

  // "complementary" field.
  String? _complementary;
  String get complementary => _complementary ?? '';
  set complementary(String? val) => _complementary = val;

  bool hasComplementary() => _complementary != null;

  static UserProjectListStruct fromMap(Map<String, dynamic> data) =>
      UserProjectListStruct(
        userId: data['user_id'] as String?,
        displayName: data['display_name'] as String?,
        date: data['date'] as String?,
        workingHours: castToType<int>(data['working_hours']),
        projectId: data['project_id'] as String?,
        projectName: data['project_name'] as String?,
        allocatedHours: castToType<int>(data['allocated_hours']),
        photoUrl: data['photo_url'] as String?,
        color: data['color'] as String?,
        allocationColor: getSchemaColor(data['allocation_color']),
        isHoliday: castToType<int>(data['isHoliday']),
        main: data['main'] as String?,
        complementary: data['complementary'] as String?,
      );

  static UserProjectListStruct? maybeFromMap(dynamic data) => data is Map
      ? UserProjectListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'user_id': _userId,
        'display_name': _displayName,
        'date': _date,
        'working_hours': _workingHours,
        'project_id': _projectId,
        'project_name': _projectName,
        'allocated_hours': _allocatedHours,
        'photo_url': _photoUrl,
        'color': _color,
        'allocation_color': _allocationColor,
        'isHoliday': _isHoliday,
        'main': _main,
        'complementary': _complementary,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user_id': serializeParam(
          _userId,
          ParamType.String,
        ),
        'display_name': serializeParam(
          _displayName,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
        'working_hours': serializeParam(
          _workingHours,
          ParamType.int,
        ),
        'project_id': serializeParam(
          _projectId,
          ParamType.String,
        ),
        'project_name': serializeParam(
          _projectName,
          ParamType.String,
        ),
        'allocated_hours': serializeParam(
          _allocatedHours,
          ParamType.int,
        ),
        'photo_url': serializeParam(
          _photoUrl,
          ParamType.String,
        ),
        'color': serializeParam(
          _color,
          ParamType.String,
        ),
        'allocation_color': serializeParam(
          _allocationColor,
          ParamType.Color,
        ),
        'isHoliday': serializeParam(
          _isHoliday,
          ParamType.int,
        ),
        'main': serializeParam(
          _main,
          ParamType.String,
        ),
        'complementary': serializeParam(
          _complementary,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserProjectListStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserProjectListStruct(
        userId: deserializeParam(
          data['user_id'],
          ParamType.String,
          false,
        ),
        displayName: deserializeParam(
          data['display_name'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
        workingHours: deserializeParam(
          data['working_hours'],
          ParamType.int,
          false,
        ),
        projectId: deserializeParam(
          data['project_id'],
          ParamType.String,
          false,
        ),
        projectName: deserializeParam(
          data['project_name'],
          ParamType.String,
          false,
        ),
        allocatedHours: deserializeParam(
          data['allocated_hours'],
          ParamType.int,
          false,
        ),
        photoUrl: deserializeParam(
          data['photo_url'],
          ParamType.String,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.String,
          false,
        ),
        allocationColor: deserializeParam(
          data['allocation_color'],
          ParamType.Color,
          false,
        ),
        isHoliday: deserializeParam(
          data['isHoliday'],
          ParamType.int,
          false,
        ),
        main: deserializeParam(
          data['main'],
          ParamType.String,
          false,
        ),
        complementary: deserializeParam(
          data['complementary'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserProjectListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserProjectListStruct &&
        userId == other.userId &&
        displayName == other.displayName &&
        date == other.date &&
        workingHours == other.workingHours &&
        projectId == other.projectId &&
        projectName == other.projectName &&
        allocatedHours == other.allocatedHours &&
        photoUrl == other.photoUrl &&
        color == other.color &&
        allocationColor == other.allocationColor &&
        isHoliday == other.isHoliday &&
        main == other.main &&
        complementary == other.complementary;
  }

  @override
  int get hashCode => const ListEquality().hash([
        userId,
        displayName,
        date,
        workingHours,
        projectId,
        projectName,
        allocatedHours,
        photoUrl,
        color,
        allocationColor,
        isHoliday,
        main,
        complementary
      ]);
}

UserProjectListStruct createUserProjectListStruct({
  String? userId,
  String? displayName,
  String? date,
  int? workingHours,
  String? projectId,
  String? projectName,
  int? allocatedHours,
  String? photoUrl,
  String? color,
  Color? allocationColor,
  int? isHoliday,
  String? main,
  String? complementary,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserProjectListStruct(
      userId: userId,
      displayName: displayName,
      date: date,
      workingHours: workingHours,
      projectId: projectId,
      projectName: projectName,
      allocatedHours: allocatedHours,
      photoUrl: photoUrl,
      color: color,
      allocationColor: allocationColor,
      isHoliday: isHoliday,
      main: main,
      complementary: complementary,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserProjectListStruct? updateUserProjectListStruct(
  UserProjectListStruct? userProjectList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userProjectList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserProjectListStructData(
  Map<String, dynamic> firestoreData,
  UserProjectListStruct? userProjectList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userProjectList == null) {
    return;
  }
  if (userProjectList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userProjectList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userProjectListData =
      getUserProjectListFirestoreData(userProjectList, forFieldValue);
  final nestedData =
      userProjectListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userProjectList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserProjectListFirestoreData(
  UserProjectListStruct? userProjectList, [
  bool forFieldValue = false,
]) {
  if (userProjectList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userProjectList.toMap());

  // Add any Firestore field values
  userProjectList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserProjectListListFirestoreData(
  List<UserProjectListStruct>? userProjectLists,
) =>
    userProjectLists
        ?.map((e) => getUserProjectListFirestoreData(e, true))
        .toList() ??
    [];
