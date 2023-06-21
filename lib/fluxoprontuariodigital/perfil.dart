// 2.2  Perfil

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:vetadvisor/fluxoprontuariodigital/cadastreOPet.dart';
import 'package:vetadvisor/fluxoprontuariodigital/perfilPaciente.dart';
import 'package:vetadvisor/prelogin/termos.dart';


import '../recursos/Constants.dart';
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
                              validator: (text){
                                if(text == null || text.isEmpty){
                                  return "Por favor, digite o seu nome completo.";
                                }
                              },
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
                              validator: (text){
                                if(text == null || text.isEmpty){
                                  return "Por favor, digite o seu e-mail.";
                                }
                              },
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
                              validator: (text){
                                if(text == null || text.isEmpty){
                                  return "Por favor, digite o seu CRMV.";
                                }
                              },
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
                              validator: (text){
                                if(text == null || text.isEmpty){
                                  return "Por favor, digite o número do seu celular.";
                                }
                              },
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
                        obscureText: true,
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
                            Radio<SingingCharacterFormacao>(
                              value: SingingCharacterFormacao.Graduado,

                              onChanged: (SingingCharacterFormacao? value) {

                                setState(() {

                                });
                              },
                              groupValue: null,
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
                            Radio<SingingCharacterFormacao>(
                                value: SingingCharacterFormacao.Pos,
                                groupValue: null,
                                fillColor:
                                MaterialStateColor.resolveWith((states) => Colors.white),
                                onChanged: (SingingCharacterFormacao? value) {
                                  setState(() {

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
                            Radio<SingingCharacterFormacao>(
                                value: SingingCharacterFormacao.Mestre,
                                groupValue: null,
                                fillColor:
                                MaterialStateColor.resolveWith((states) => Colors.white),
                                onChanged: (SingingCharacterFormacao? value) {
                                  setState(() {

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
                            Radio<SingingCharacterFormacao>(
                              value: SingingCharacterFormacao.Graduado,

                              onChanged: (SingingCharacterFormacao? value) {

                                setState(() {

                                });
                              },
                              groupValue: null,
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
                            Radio<SingingCharacterFormacao>(
                                value: SingingCharacterFormacao.Pos,
                                groupValue: null,
                                fillColor:
                                MaterialStateColor.resolveWith((states) => Colors.white),
                                onChanged: (SingingCharacterFormacao? value) {
                                  setState(() {

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
                            Radio<SingingCharacterFormacao>(
                                value: SingingCharacterFormacao.Mestre,
                                groupValue: null,
                                fillColor:
                                MaterialStateColor.resolveWith((states) => Colors.white),
                                onChanged: (SingingCharacterFormacao? value) {
                                  setState(() {

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
                            Radio<SingingCharacterFormacao>(
                              value: SingingCharacterFormacao.Graduado,

                              onChanged: (SingingCharacterFormacao? value) {

                                setState(() {

                                });
                              },
                              groupValue: null,
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
                            Radio<SingingCharacterFormacao>(
                                value: SingingCharacterFormacao.Pos,
                                groupValue: null,
                                fillColor:
                                MaterialStateColor.resolveWith((states) => Colors.white),
                                onChanged: (SingingCharacterFormacao? value) {
                                  setState(() {

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
                            Radio<SingingCharacterFormacao>(
                                value: SingingCharacterFormacao.Mestre,
                                groupValue: null,
                                fillColor:
                                MaterialStateColor.resolveWith((states) => Colors.white),
                                onChanged: (SingingCharacterFormacao? value) {
                                  setState(() {

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
                        _finalizaCadastro();
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

  void _finalizaCadastro() {
    print("Cadastrando");
  }
}
