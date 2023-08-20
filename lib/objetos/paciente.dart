import 'package:cloud_firestore/cloud_firestore.dart';

class Paciente {
  String? nome;
  String? especie;
  String? sexo;
  String? raca;
  int? peso;
  Timestamp? nascimento;
  String? id;
  bool? castrado;
  bool? vacinado;
  bool? vermifugado;
  String? responsavel;
  String? email;



  Paciente({
    this.nome,
    this.especie,
    this.sexo,
    this.raca,
    this.peso,
    this.nascimento,
    this.id,
    this.castrado,
    this.vacinado,
    this.vermifugado,
    this.responsavel,
    this.email,


  });
}
