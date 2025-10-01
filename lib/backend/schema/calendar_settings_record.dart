import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CalendarSettingsRecord extends FirestoreRecord {
  CalendarSettingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "type" field.
  CalendarType? _type;
  CalendarType? get type => _type;
  bool hasType() => _type != null;

  // "project_id" field.
  DocumentReference? _projectId;
  DocumentReference? get projectId => _projectId;
  bool hasProjectId() => _projectId != null;

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "working_pattern" field.
  List<WorkingDayHourStruct>? _workingPattern;
  List<WorkingDayHourStruct> get workingPattern => _workingPattern ?? const [];
  bool hasWorkingPattern() => _workingPattern != null;

  // "holidays" field.
  List<DateTime>? _holidays;
  List<DateTime> get holidays => _holidays ?? const [];
  bool hasHolidays() => _holidays != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "updated_date" field.
  DateTime? _updatedDate;
  DateTime? get updatedDate => _updatedDate;
  bool hasUpdatedDate() => _updatedDate != null;

  // "parent_calendar" field.
  DocumentReference? _parentCalendar;
  DocumentReference? get parentCalendar => _parentCalendar;
  bool hasParentCalendar() => _parentCalendar != null;

  void _initializeFields() {
    _type = snapshotData['type'] is CalendarType
        ? snapshotData['type']
        : deserializeEnum<CalendarType>(snapshotData['type']);
    _projectId = snapshotData['project_id'] as DocumentReference?;
    _userId = snapshotData['user_id'] as DocumentReference?;
    _workingPattern = getStructList(
      snapshotData['working_pattern'],
      WorkingDayHourStruct.fromMap,
    );
    _holidays = getDataList(snapshotData['holidays']);
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _updatedDate = snapshotData['updated_date'] as DateTime?;
    _parentCalendar = snapshotData['parent_calendar'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('calendar_settings');

  static Stream<CalendarSettingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CalendarSettingsRecord.fromSnapshot(s));

  static Future<CalendarSettingsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CalendarSettingsRecord.fromSnapshot(s));

  static CalendarSettingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CalendarSettingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CalendarSettingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CalendarSettingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CalendarSettingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CalendarSettingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCalendarSettingsRecordData({
  CalendarType? type,
  DocumentReference? projectId,
  DocumentReference? userId,
  DocumentReference? createdBy,
  DateTime? updatedDate,
  DocumentReference? parentCalendar,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'project_id': projectId,
      'user_id': userId,
      'created_by': createdBy,
      'updated_date': updatedDate,
      'parent_calendar': parentCalendar,
    }.withoutNulls,
  );

  return firestoreData;
}

class CalendarSettingsRecordDocumentEquality
    implements Equality<CalendarSettingsRecord> {
  const CalendarSettingsRecordDocumentEquality();

  @override
  bool equals(CalendarSettingsRecord? e1, CalendarSettingsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.type == e2?.type &&
        e1?.projectId == e2?.projectId &&
        e1?.userId == e2?.userId &&
        listEquality.equals(e1?.workingPattern, e2?.workingPattern) &&
        listEquality.equals(e1?.holidays, e2?.holidays) &&
        e1?.createdBy == e2?.createdBy &&
        e1?.updatedDate == e2?.updatedDate &&
        e1?.parentCalendar == e2?.parentCalendar;
  }

  @override
  int hash(CalendarSettingsRecord? e) => const ListEquality().hash([
        e?.type,
        e?.projectId,
        e?.userId,
        e?.workingPattern,
        e?.holidays,
        e?.createdBy,
        e?.updatedDate,
        e?.parentCalendar
      ]);

  @override
  bool isValidKey(Object? o) => o is CalendarSettingsRecord;
}
