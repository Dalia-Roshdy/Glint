import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProjectColorRecord extends FirestoreRecord {
  ProjectColorRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "color" field.
  String? _color;
  String get color => _color ?? '';
  bool hasColor() => _color != null;

  // "main" field.
  String? _main;
  String get main => _main ?? '';
  bool hasMain() => _main != null;

  // "complementary" field.
  String? _complementary;
  String get complementary => _complementary ?? '';
  bool hasComplementary() => _complementary != null;

  void _initializeFields() {
    _color = snapshotData['color'] as String?;
    _main = snapshotData['main'] as String?;
    _complementary = snapshotData['complementary'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('project_color');

  static Stream<ProjectColorRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProjectColorRecord.fromSnapshot(s));

  static Future<ProjectColorRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProjectColorRecord.fromSnapshot(s));

  static ProjectColorRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProjectColorRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProjectColorRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProjectColorRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProjectColorRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProjectColorRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProjectColorRecordData({
  String? color,
  String? main,
  String? complementary,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'color': color,
      'main': main,
      'complementary': complementary,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProjectColorRecordDocumentEquality
    implements Equality<ProjectColorRecord> {
  const ProjectColorRecordDocumentEquality();

  @override
  bool equals(ProjectColorRecord? e1, ProjectColorRecord? e2) {
    return e1?.color == e2?.color &&
        e1?.main == e2?.main &&
        e1?.complementary == e2?.complementary;
  }

  @override
  int hash(ProjectColorRecord? e) =>
      const ListEquality().hash([e?.color, e?.main, e?.complementary]);

  @override
  bool isValidKey(Object? o) => o is ProjectColorRecord;
}
