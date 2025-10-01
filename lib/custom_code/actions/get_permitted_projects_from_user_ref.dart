// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/backend.dart'; // Needed for ProjectsRecord

Future<List<ProjectsRecord>> getPermittedProjectsFromUserRef(
  DocumentReference userRef,
) async {
  final db = FirebaseFirestore.instance;

  try {
    // Step 1: Get permissions where user_id matches userRef
    final permissionSnapshot = await db
        .collection('permissions')
        .where('user_id', isEqualTo: userRef)
        .get();

    // Step 2: Extract project references (DocumentReference)
    final List<DocumentReference> projectRefs = permissionSnapshot.docs
        .map((doc) => doc.data()['project_id'] as DocumentReference?)
        .where((ref) => ref != null)
        .cast<DocumentReference>()
        .toList();

    if (projectRefs.isEmpty) return [];

    // Step 3: Fetch each project by reference
    List<ProjectsRecord> projects = [];

    for (final ref in projectRefs) {
      final doc = await ref.get();
      if (doc.exists) {
        projects.add(ProjectsRecord.fromSnapshot(doc));
      }
    }

    return projects;
  } catch (e) {
    print('Error in getPermittedProjectsFromUserRef: $e');
    return [];
  }
}
