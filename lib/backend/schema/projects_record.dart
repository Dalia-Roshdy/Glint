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

  // "client_id" field.
  DocumentReference? _clientId;
  DocumentReference? get clientId => _clientId;
  bool hasClientId() => _clientId != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _color = snapshotData['color'] as String?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _createdDate = snapshotData['created_date'] as DateTime?;
    _calendarId = snapshotData['calendar_id'] as DocumentReference?;
    _active = snapshotData['Active'] as bool?;
    _clientId = snapshotData['client_id'] as DocumentReference?;
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
  String? name,
  String? color,
  DocumentReference? createdBy,
  DateTime? createdDate,
  DocumentReference? calendarId,
  bool? active,
  DocumentReference? clientId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'color': color,
      'created_by': createdBy,
      'created_date': createdDate,
      'calendar_id': calendarId,
      'Active': active,
      'client_id': clientId,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProjectsRecordDocumentEquality implements Equality<ProjectsRecord> {
  const ProjectsRecordDocumentEquality();

  @override
  bool equals(ProjectsRecord? e1, ProjectsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.color == e2?.color &&
        e1?.createdBy == e2?.createdBy &&
        e1?.createdDate == e2?.createdDate &&
        e1?.calendarId == e2?.calendarId &&
        e1?.active == e2?.active &&
        e1?.clientId == e2?.clientId;
  }

  @override
  int hash(ProjectsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.color,
        e?.createdBy,
        e?.createdDate,
        e?.calendarId,
        e?.active,
        e?.clientId
      ]);

  @override
  bool isValidKey(Object? o) => o is ProjectsRecord;
}
