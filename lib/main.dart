import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:vetadvisor/fluxoprontuariodigital/novaConsulta.dart';
import 'package:vetadvisor/minhaagenda/atendimento.dart';
import 'package:vetadvisor/minhaagenda/homeMinhaAgenda.dart';
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

  bool _aceito = false;

  var db = FirebaseFirestore.instance;

  FirebaseAuth.instance
      .authStateChanges()
      .listen((User? user) {


        /*
    runApp( Phoenix(
        child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomeMinhaAgenda()
        )
    )
    );

         */




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

          db.collection("usuarios").where("email", isEqualTo: "wallace_sjm@msn.com").get().then(
                (querySnapshot) {

              for (var docSnapshot in querySnapshot.docs) {


                _aceito = docSnapshot.data()["termos"];

                if(_aceito) {
                  runApp( Phoenix(
                      child: const MaterialApp(
                          debugShowCheckedModeBanner: false,
                          home: Perfil()
                      )
                  ));
                } else {
                  runApp( Phoenix(
                      child: MaterialApp(
                          debugShowCheckedModeBanner: false,
                          home: Termos()
                      )
                  ));
                }
                //print('${docSnapshot.id} =noMain> ${docSnapshot.data()}');

              }
            },
            onError: (e) => print("Error completing: $e"),
          );



        }






      });




}


