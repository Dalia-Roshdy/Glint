import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProjectPermissionsRecord extends FirestoreRecord {
  ProjectPermissionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "projct_id" field.
  DocumentReference? _projctId;
  DocumentReference? get projctId => _projctId;
  bool hasProjctId() => _projctId != null;

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "role_in_project" field.
  String? _roleInProject;
  String get roleInProject => _roleInProject ?? '';
  bool hasRoleInProject() => _roleInProject != null;

  // "can_allocate" field.
  bool? _canAllocate;
  bool get canAllocate => _canAllocate ?? false;
  bool hasCanAllocate() => _canAllocate != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _projctId = snapshotData['projct_id'] as DocumentReference?;
    _userId = snapshotData['user_id'] as DocumentReference?;
    _roleInProject = snapshotData['role_in_project'] as String?;
    _canAllocate = snapshotData['can_allocate'] as bool?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _createdDate = snapshotData['created_date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('project_permissions');

  static Stream<ProjectPermissionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProjectPermissionsRecord.fromSnapshot(s));

  static Future<ProjectPermissionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ProjectPermissionsRecord.fromSnapshot(s));

  static ProjectPermissionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProjectPermissionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProjectPermissionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProjectPermissionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProjectPermissionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProjectPermissionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProjectPermissionsRecordData({
  String? id,
  DocumentReference? projctId,
  DocumentReference? userId,
  String? roleInProject,
  bool? canAllocate,
  DocumentReference? createdBy,
  DateTime? createdDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'projct_id': projctId,
      'user_id': userId,
      'role_in_project': roleInProject,
      'can_allocate': canAllocate,
      'created_by': createdBy,
      'created_date': createdDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProjectPermissionsRecordDocumentEquality
    implements Equality<ProjectPermissionsRecord> {
  const ProjectPermissionsRecordDocumentEquality();

  @override
  bool equals(ProjectPermissionsRecord? e1, ProjectPermissionsRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.projctId == e2?.projctId &&
        e1?.userId == e2?.userId &&
        e1?.roleInProject == e2?.roleInProject &&
        e1?.canAllocate == e2?.canAllocate &&
        e1?.createdBy == e2?.createdBy &&
        e1?.createdDate == e2?.createdDate;
  }

  @override
  int hash(ProjectPermissionsRecord? e) => const ListEquality().hash([
        e?.id,
        e?.projctId,
        e?.userId,
        e?.roleInProject,
        e?.canAllocate,
        e?.createdBy,
        e?.createdDate
      ]);

  @override
  bool isValidKey(Object? o) => o is ProjectPermissionsRecord;
}
