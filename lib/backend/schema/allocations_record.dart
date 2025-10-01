import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AllocationsRecord extends FirestoreRecord {
  AllocationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "project_id" field.
  DocumentReference? _projectId;
  DocumentReference? get projectId => _projectId;
  bool hasProjectId() => _projectId != null;

  // "start_date" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "no_of_hours" field.
  int? _noOfHours;
  int get noOfHours => _noOfHours ?? 0;
  bool hasNoOfHours() => _noOfHours != null;

  // "repeat_pattern" field.
  List<WorkingDayHourStruct>? _repeatPattern;
  List<WorkingDayHourStruct> get repeatPattern => _repeatPattern ?? const [];
  bool hasRepeatPattern() => _repeatPattern != null;

  // "repeat_untill" field.
  DateTime? _repeatUntill;
  DateTime? get repeatUntill => _repeatUntill;
  bool hasRepeatUntill() => _repeatUntill != null;

  // "assigned_by" field.
  DocumentReference? _assignedBy;
  DocumentReference? get assignedBy => _assignedBy;
  bool hasAssignedBy() => _assignedBy != null;

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  bool hasNotes() => _notes != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _userId = snapshotData['user_id'] as DocumentReference?;
    _projectId = snapshotData['project_id'] as DocumentReference?;
    _startDate = snapshotData['start_date'] as DateTime?;
    _noOfHours = castToType<int>(snapshotData['no_of_hours']);
    _repeatPattern = getStructList(
      snapshotData['repeat_pattern'],
      WorkingDayHourStruct.fromMap,
    );
    _repeatUntill = snapshotData['repeat_untill'] as DateTime?;
    _assignedBy = snapshotData['assigned_by'] as DocumentReference?;
    _createdDate = snapshotData['created_date'] as DateTime?;
    _notes = snapshotData['notes'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('allocations');

  static Stream<AllocationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AllocationsRecord.fromSnapshot(s));

  static Future<AllocationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AllocationsRecord.fromSnapshot(s));

  static AllocationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AllocationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AllocationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AllocationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AllocationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AllocationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAllocationsRecordData({
  String? id,
  DocumentReference? userId,
  DocumentReference? projectId,
  DateTime? startDate,
  int? noOfHours,
  DateTime? repeatUntill,
  DocumentReference? assignedBy,
  DateTime? createdDate,
  String? notes,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'user_id': userId,
      'project_id': projectId,
      'start_date': startDate,
      'no_of_hours': noOfHours,
      'repeat_untill': repeatUntill,
      'assigned_by': assignedBy,
      'created_date': createdDate,
      'notes': notes,
    }.withoutNulls,
  );

  return firestoreData;
}

class AllocationsRecordDocumentEquality implements Equality<AllocationsRecord> {
  const AllocationsRecordDocumentEquality();

  @override
  bool equals(AllocationsRecord? e1, AllocationsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.id == e2?.id &&
        e1?.userId == e2?.userId &&
        e1?.projectId == e2?.projectId &&
        e1?.startDate == e2?.startDate &&
        e1?.noOfHours == e2?.noOfHours &&
        listEquality.equals(e1?.repeatPattern, e2?.repeatPattern) &&
        e1?.repeatUntill == e2?.repeatUntill &&
        e1?.assignedBy == e2?.assignedBy &&
        e1?.createdDate == e2?.createdDate &&
        e1?.notes == e2?.notes;
  }

  @override
  int hash(AllocationsRecord? e) => const ListEquality().hash([
        e?.id,
        e?.userId,
        e?.projectId,
        e?.startDate,
        e?.noOfHours,
        e?.repeatPattern,
        e?.repeatUntill,
        e?.assignedBy,
        e?.createdDate,
        e?.notes
      ]);

  @override
  bool isValidKey(Object? o) => o is AllocationsRecord;
}
