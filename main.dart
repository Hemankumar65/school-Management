import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCRpLH8U1kJRFnPPxL3Bvv_XuMTsBX71LY",
          appId: "1:952886385376:android:9ac1e4de7b632f31b10e85",
          storageBucket: "concrete-bloom-417421.appspot.com",
          projectId: "concrete-bloom-417421",
          messagingSenderId: ''));
  runApp(const App());
}
