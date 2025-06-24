import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBD2bQ0qe8NIK_ZSF7TQ3Rq0R_VsWiagNE",
            authDomain: "glint-firebase.firebaseapp.com",
            projectId: "glint-firebase",
            storageBucket: "glint-firebase.firebasestorage.app",
            messagingSenderId: "974567648171",
            appId: "1:974567648171:web:81df69d916a32f468e80ee"));
  } else {
    await Firebase.initializeApp();
  }
}
