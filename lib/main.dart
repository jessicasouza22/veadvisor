import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:vetadvisor/fluxoprontuariodigital/novaConsulta.dart';
import 'package:vetadvisor/prelogin/criarConta.dart';
import 'package:vetadvisor/fluxoprontuariodigital/perfil.dart';
import 'package:vetadvisor/prelogin/logado.dart';
import 'package:vetadvisor/prelogin/login.dart';
import 'package:vetadvisor/prelogin/termos.dart';
import 'package:vetadvisor/recursos/menuIniciar.dart';

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
    runApp( Phoenix(
        child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: MenuIniciar()
        )
    )
    );
        /*
        if (user == null) {
          runApp( Phoenix(
              child: const MaterialApp(
                debugShowCheckedModeBanner: false,
                  home: Login()
              )
          )
          );
          //print('User is currently signed out!');
        } else {
          runApp( Phoenix(
            child: const MaterialApp(
                debugShowCheckedModeBanner: false,
                home: Termos()
            )
          )
          );
          //print('User is signed in!');
        }

         */


      });


}


