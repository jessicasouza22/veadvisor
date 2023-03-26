import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vetadvisor/prelogin/criarConta.dart';
import 'package:vetadvisor/fluxoprontuariodigital/perfil.dart';
import 'package:vetadvisor/prelogin/login.dart';
import 'package:vetadvisor/recursos/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const CriarConta());
}


