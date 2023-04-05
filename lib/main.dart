import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vetadvisor/prelogin/criarConta.dart';
import 'package:vetadvisor/fluxoprontuariodigital/perfil.dart';
import 'package:vetadvisor/prelogin/logado.dart';
import 'package:vetadvisor/prelogin/login.dart';

import 'firebase_options.dart';

late final FirebaseApp app;
late final FirebaseAuth auth;

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();

  // We store the app and auth to make testing with a named instance easier.
  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  auth = FirebaseAuth.instanceFor(app: app);

  FirebaseAuth.instance
      .authStateChanges()
      .listen((User? user) {
    if (user == null) {
      runApp(const Login());
      //print('User is currently signed out!');
    } else {
      runApp(const Logado());
      //print('User is signed in!');
    }
  });


}


