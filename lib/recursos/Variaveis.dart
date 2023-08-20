import 'package:firebase_auth/firebase_auth.dart';

import '../objetos/doenca.dart';
import '../objetos/paciente.dart';

class Variaveis{



  static List<Doenca> doencas = [];
  static List<Paciente> pacientes = [];
  static List<String> sintomaBuscado = [];
  static List<String> disturbiosSelecionados = [];
  static Paciente pacienteEmEdicao = Paciente();
  static Paciente pacienteEmConsulta = Paciente();
  static String especieSelecionada = "Cães";
  static bool buscaCompleta = true;
  static List<String> racasSelecionadas = [];
}