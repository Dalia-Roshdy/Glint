import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProjectsRecord extends FirestoreRecord {
  ProjectsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "color" field.
  String? _color;
  String get color => _color ?? '';
  bool hasColor() => _color != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "calendar_id" field.
  DocumentReference? _calendarId;
  DocumentReference? get calendarId => _calendarId;
  bool hasCalendarId() => _calendarId != null;

  // "Active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "Client" field.
  String? _client;
  String get client => _client ?? '';
  bool hasClient() => _client != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _name = snapshotData['name'] as String?;
    _color = snapshotData['color'] as String?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _createdDate = snapshotData['created_date'] as DateTime?;
    _calendarId = snapshotData['calendar_id'] as DocumentReference?;
    _active = snapshotData['Active'] as bool?;
    _client = snapshotData['Client'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('projects');

  static Stream<ProjectsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProjectsRecord.fromSnapshot(s));

  static Future<ProjectsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProjectsRecord.fromSnapshot(s));

  static ProjectsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProjectsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProjectsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProjectsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProjectsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProjectsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProjectsRecordData({
  String? id,
  String? name,
  String? color,
  DocumentReference? createdBy,
  DateTime? createdDate,
  DocumentReference? calendarId,
  bool? active,
  String? client,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'name': name,
      'color': color,
      'created_by': createdBy,
      'created_date': createdDate,
      'calendar_id': calendarId,
      'Active': active,
      'Client': client,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProjectsRecordDocumentEquality implements Equality<ProjectsRecord> {
  const ProjectsRecordDocumentEquality();

  @override
  bool equals(ProjectsRecord? e1, ProjectsRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.name == e2?.name &&
        e1?.color == e2?.color &&
        e1?.createdBy == e2?.createdBy &&
        e1?.createdDate == e2?.createdDate &&
        e1?.calendarId == e2?.calendarId &&
        e1?.active == e2?.active &&
        e1?.client == e2?.client;
  }

  @override
  int hash(ProjectsRecord? e) => const ListEquality().hash([
        e?.id,
        e?.name,
        e?.color,
        e?.createdBy,
        e?.createdDate,
        e?.calendarId,
        e?.active,
        e?.client
      ]);

  @override
  bool isValidKey(Object? o) => o is ProjectsRecord;
}
