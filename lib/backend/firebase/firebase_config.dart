import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDIGMd34lBFfoZCBiqdbXRhXFq4o27i6js",
            authDomain: "restaurante-fluterflow.firebaseapp.com",
            projectId: "restaurante-fluterflow",
            storageBucket: "restaurante-fluterflow.firebasestorage.app",
            messagingSenderId: "635353379443",
            appId: "1:635353379443:web:cd2dcaa5ae1cb8ef36b006"));
  } else {
    await Firebase.initializeApp();
  }
}
