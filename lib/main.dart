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
import 'fluxopesquisarapida/home.dart';

late final FirebaseApp app;
late final FirebaseAuth auth;

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();

  // We store the app and auth to make testing with a named instance easier.
  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  auth = FirebaseAuth.instanceFor(app: app);

  final _nome = TextEditingController();
  final _email = TextEditingController();
  final _crmv = TextEditingController();
  final _celular = TextEditingController();
  bool _aceito = false;

  var db = FirebaseFirestore.instance;

  FirebaseAuth.instance
      .authStateChanges()
      .listen((User? user) {




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

                _nome.text = docSnapshot.data()["nome"] ?? "";
                _email.text = docSnapshot.data()["email"] ?? "";
                _crmv.text = docSnapshot.data()["crmv"] ?? "";
                _celular.text = docSnapshot.data()["celular"] ?? "";
                _aceito = docSnapshot.data()["termos"] ?? false;

                if(_aceito) {
                  if(_nome.text!= "" && _email.text != "" && _crmv.text != "" && _celular.text != "") {
                    runApp( Phoenix(
                        child: const MaterialApp(
                            debugShowCheckedModeBanner: false,
                            home: Home()
                        )
                    ));
                  } else {
                    runApp( Phoenix(
                        child: const MaterialApp(
                            debugShowCheckedModeBanner: false,
                            home: Perfil()
                        )
                    ));
                  }

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


