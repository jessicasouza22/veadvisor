// 2.2  Perfil

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vetadvisor/fluxopesquisarapida/home.dart';
import 'package:vetadvisor/fluxoprontuariodigital/cadastreOPet.dart';
import 'package:vetadvisor/fluxoprontuariodigital/perfilPaciente.dart';
import 'package:vetadvisor/prelogin/termos.dart';


import '../recursos/Constants.dart';
import 'consultaPaciente.dart';


enum SingingCharacterFormacao { Graduado, Pos, Mestre }
enum SingingCharacterEstado { Casado, Divorciado, Outro }
enum SingingCharacterGenero { Masculino, Feminino, Especifique }
class Perfil extends StatelessWidget {
  const Perfil({super.key});
  @override
  Widget build(BuildContext context) {


    return const PerfilPage();
  }
}





class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {


  final _formKey = GlobalKey<FormState>();
  final _nome = TextEditingController();
  final _email = TextEditingController();
  final _crmv = TextEditingController();
  final _celular = TextEditingController();
  final _cpf = TextEditingController();
  final _endereco = TextEditingController();
  final _complemento = TextEditingController();
  String _formacaoProfissional = "Graduado";
  String _estadoCivil = "Outro";
  String _genero = "Outros";
  bool _termos = false;
  bool _novidades = false;

  var db = FirebaseFirestore.instance;
  var idDocumentoFirebase = "";

  @override
  initState() {


    db.collection("usuarios").where("email", isEqualTo: "wallace_sjm@msn.com").get().then(
          (querySnapshot) {

        for (var docSnapshot in querySnapshot.docs) {

          idDocumentoFirebase = docSnapshot.id;

            setState(() {
              _nome.text = docSnapshot.data()["nome"] ?? "";
              _email.text = docSnapshot.data()["email"] ?? "";
              _crmv.text = docSnapshot.data()["crmv"] ?? "";
              _celular.text = docSnapshot.data()["celular"] ?? "";
              _cpf.text = docSnapshot.data()["cpf"];
              _endereco.text = docSnapshot.data()["endereco"];
              _complemento.text = docSnapshot.data()["complemento"];
              _formacaoProfissional = docSnapshot.data()["formacao"];
              _estadoCivil = docSnapshot.data()["estadoCivil"];
              _genero = docSnapshot.data()["genero"];
              _termos = docSnapshot.data()["termos"];
              _novidades = docSnapshot.data()["novidades"];
            });


          //_nome.text = docSnapshot.data().values[""];
        }
      },
      onError: (e) => print("Error completing: $e"),
    );


    super.initState();

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
          leading:  Builder(
              builder: (context) => IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    /*
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (
                              context) => const Termos()),
                    );

                     */


                    //print("clicado na seta");
                  },
                  icon: const Icon(Icons.arrow_back))),

          backgroundColor: const Color(0xFF3C10BB),

          title: const Text("Perfil"),
        centerTitle: true,


      ),
        backgroundColor: const Color(0xFF3C10BB),
        body: SingleChildScrollView(
          child: Column(
            children: [



              CircleAvatar(
                radius: 35,
                backgroundColor: Colors.white,
                child: ClipOval(
                    child: GestureDetector(
                      child: File('${Constants.diretorioVetAdvisor}/avatar.png').existsSync() ?
                      Image.file(File('${Constants.diretorioVetAdvisor}/avatar.png'),
                        // um condicional

                        //maxSizeBytes: 3000 * 1000,
                        fit: BoxFit.cover,
                        width: 60,
                        height: 60,
                      ) : Image.asset("imagens/avatar.png"),

                      onTap: (){

                      },
                    )

                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.edit_note_outlined,
                          color: Colors.white)
                  ),

                  const Text('Editar',
                    style: TextStyle(
                        color: Colors.white),
                  ),
                ],
              ),

              Form(
                key: _formKey,
                child: Column (
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('*Nome e Sobrenome', textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.white)
                          ),
                          const Padding(
                              padding: EdgeInsets.only(bottom: 5)),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(17)),
                            ),
                            child: TextFormField(
                              controller: _nome,
                              validator: (text){
                                if(text == null || text.isEmpty){
                                  return "Por favor, digite o seu nome completo.";
                                }
                              },
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: "Digite aqui o seu nome completo",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(17),
                                  borderSide: const BorderSide(
                                    color: Color(0xFF3C10BB),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('*E-mail', textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.white)
                          ),
                          const Padding(
                              padding: EdgeInsets.only(bottom: 5)),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(17)),
                            ),
                            child: TextFormField(
                              controller: _email,
                              validator: (text){
                                if(text == null || text.isEmpty){
                                  return "Por favor, digite o seu e-mail.";
                                }
                              },
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: "Digite aqui o seu e-mail",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(17),
                                  borderSide: const BorderSide(
                                    color: Color(0xFF3C10BB),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('*CRMV', textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.white)
                          ),
                          const Padding(
                              padding: EdgeInsets.only(bottom: 5)),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(17)),
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              controller: _crmv,
                              validator: (text){
                                if(text == null || text.isEmpty){
                                  return "Por favor, digite o seu CRMV.";
                                }
                              },
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: "Digite aqui o seu CRMV",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(17),
                                  borderSide: const BorderSide(
                                    color: Color(0xFF3C10BB),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('*Número de celular', textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.white)
                          ),
                          const Padding(
                              padding: EdgeInsets.only(bottom: 5)),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(17)),
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              controller: _celular,
                              validator: (text){
                                if(text == null || text.isEmpty){
                                  return "Por favor, digite o número do seu celular.";
                                }
                              },
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: "Digite aqui o seu celular",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(17),
                                  borderSide: const BorderSide(
                                    color: Color(0xFF3C10BB),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                  ],
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('CPF', textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.white)
                    ),
                    const Padding(
                        padding: EdgeInsets.only(bottom: 5)),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(17)),
                      ),
                      child: TextFormField(
                        controller: _cpf,

                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(17),
                            borderSide: const BorderSide(
                              color: Color(0xFF3C10BB),
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Endereço', textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.white)
                    ),
                    const Padding(
                        padding: EdgeInsets.only(bottom: 5)),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(17)),
                      ),
                      child: TextFormField(
                        controller: _endereco,

                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(17),
                            borderSide: const BorderSide(
                              color: Color(0xFF3C10BB),
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Complemento', textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.white)
                    ),
                    const Padding(
                        padding: EdgeInsets.only(bottom: 5)),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(17)),
                      ),
                      child: TextFormField(
                        controller: _complemento,

                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(17),
                            borderSide: const BorderSide(
                              color: Color(0xFF3C10BB),
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Formação profissional",
                        style: TextStyle(
                            color: Colors.white
                        )
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: "Graduado",
                              groupValue: _formacaoProfissional,

                              onChanged: (value) {
                                setState(() {
                                  _formacaoProfissional = value!;
                                });
                              },

                              fillColor:
                              MaterialStateColor.resolveWith((states) => Colors.white),
                            ),
                            const Text("Graduado",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white
                                )
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: "Pós-graduado",
                                groupValue: _formacaoProfissional,
                                fillColor:
                                MaterialStateColor.resolveWith((states) => Colors.white),
                                onChanged: (value) {
                                  setState(() {
                                    _formacaoProfissional = value!;
                                  });

                                }
                            ),
                            const Text("Pós-graduado",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white
                                )
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: "Mestre/Doutor",
                                groupValue: _formacaoProfissional,
                                fillColor:
                                MaterialStateColor.resolveWith((states) => Colors.white),
                                onChanged: (value) {
                                  setState(() {
                                    _formacaoProfissional = value!;
                                  });

                                }
                            ),
                            const Text("Mestre/Doutor",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white
                                )
                            )
                          ],
                        )

                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Estado civil",
                        style: TextStyle(
                            color: Colors.white
                        )
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: "Casado",
                              groupValue: _estadoCivil,

                              onChanged: (value) {

                                setState(() {
                                  _estadoCivil = value!;
                                });
                              },

                              fillColor:
                              MaterialStateColor.resolveWith((states) => Colors.white),
                            ),
                            const Text("Casado",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white
                                )
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: "Divorciado",
                                groupValue: _estadoCivil,
                                fillColor:
                                MaterialStateColor.resolveWith((states) => Colors.white),
                                onChanged: (value) {
                                  setState(() {
                                    _estadoCivil = value!;
                                  });

                                }
                            ),
                            const Text("Divorciado",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white
                                )
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: "Outro",
                                groupValue: _estadoCivil,
                                fillColor:
                                MaterialStateColor.resolveWith((states) => Colors.white),
                                onChanged: (value) {
                                  setState(() {
                                    _estadoCivil = value!;
                                  });

                                }
                            ),
                            const Text("Outro",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white
                                )
                            )
                          ],
                        )

                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Gênero",
                        style: TextStyle(
                            color: Colors.white
                        )
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: "Masculino",
                              groupValue: _genero,
                              onChanged: (value) {

                                setState(() {
                                  _genero = value!;
                                });
                              },
                              fillColor:
                              MaterialStateColor.resolveWith((states) => Colors.white),
                            ),
                            const Text("Masculino",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white
                                )
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: "Feminino",
                                groupValue: _genero,
                                fillColor:
                                MaterialStateColor.resolveWith((states) => Colors.white),
                                onChanged: (value) {
                                  setState(() {
                                    _genero = value!;
                                  });

                                }
                            ),
                            const Text("Feminino",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white
                                )
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: "Outros",
                                groupValue: _genero,
                                fillColor:
                                MaterialStateColor.resolveWith((states) => Colors.white),
                                onChanged: (value) {
                                  setState(() {
                                    _genero = value!;
                                  });

                                }
                            ),
                            const Text("Outros",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white
                                )
                            )
                          ],
                        )

                      ],
                    ),
                  ],
                ),
              ),

              Builder(
                builder: (context) => ElevatedButton(
                    onPressed: () {


                      if (_formKey.currentState!.validate()) {

                        final usuario = <String, dynamic>{
                          "nome": _nome.text,
                          "email": _email.text,
                          "crmv": _crmv.text,
                          "celular": _celular.text,
                          "cpf": _cpf.text,
                          "endereco": _endereco.text,
                          "complemento": _complemento.text,
                          "formacao": _formacaoProfissional,
                          "estadoCivil": _estadoCivil,
                          "genero" : _genero,
                          "termos" : _termos,
                          "novidades" : _novidades
                        };

                        atualizaCadastro(usuario);

                      }


                      /*
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PerfilPaciente()),
                      );

                       */


                    },
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: Colors.white),
                    child: const Text(
                      'Finalizar',
                      style: TextStyle(color: Color(0xFF3C10BB)),
                    )),
              ),
            ],

          ),
        ),
      );
  }

  void atualizaCadastro(usuario) {

    db.collection("usuarios")
        .doc(idDocumentoFirebase)
        .set(usuario).then((document) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const Home())
          );
    }).catchError((onError) {

    });



  }
}
