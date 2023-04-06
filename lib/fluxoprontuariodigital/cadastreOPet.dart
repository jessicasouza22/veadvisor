// 2.2

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:vetadvisor/fluxoprontuariodigital/perfilPaciente.dart';


import '../recursos/Constants.dart';

enum SingingCharacterTipoDoPet { Cachorro, Gato, Animais }

enum SingingCharacterEstado { Casado, Divorciado, Outro }

enum SingingCharacterGenero { Masculino, Feminino, Especifique }

final meses = [
  'Janeiro',
  'Fevereiro',
  'Marco',
  'Abril',
  'Maio',
  'Junho',
  'Julho',
  'Agosto',
  'Setembro',
  'Outubro',
  'Novembro',
  'Dezembro'
];
final ano = [
  '2000',
  '2001',
  '2002',
  'Abril',
  'Maio',
  'Junho',
  'Julho',
  'Agosto',
  'Setembro',
  'Outubro',
  'Novembro',
  'Dezembro'
];

DropdownMenuItem<String> buildMenuItem(String meses) => DropdownMenuItem(
      value: meses,
      child: Text(
        meses,
        style: TextStyle(
          fontSize: 8,
        ),
      ),
    );

DropdownMenuItem<String> buildMenuAno(String ano) => DropdownMenuItem(
      value: ano,
      child: Text(
        ano,
        style: TextStyle(
          fontSize: 8,
        ),
      ),
    );

class CadastreOPet extends StatelessWidget {
  const CadastreOPet({super.key});

  @override
  Widget build(BuildContext context) {
    return const CadastreOPetPage();
  }
}

class CadastreOPetPage extends StatefulWidget {
  const CadastreOPetPage({Key? key}) : super(key: key);

  @override
  State<CadastreOPetPage> createState() => _CadastreOPetState();
}

class _CadastreOPetState extends State<CadastreOPetPage> {
  set value(String? value) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: const Icon(Icons.arrow_circle_left, color: Colors.white),

          backgroundColor: const Color(0xFF3C10BB),

          //  title: const Text("Cadastro do Pet"),
          centerTitle: true,
          actions: [
            Expanded(
                child: Padding(
                    padding: EdgeInsets.only(left: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        IconButton(
                            color: Colors.transparent,
                            onPressed: () {

                            },
                            icon: Icon(MdiIcons.bellBadgeOutline)),
                        Text(
                          "Cadastro do Pet ",
                          //textAlign: TextAlign.center,

                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              print("clicado no notificacao");
                            },
                            icon: Icon(MdiIcons.bellBadgeOutline)),
                      ],
                    )))
          ],
        ),
        body: Container(

          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('imagens/homeGeral.png'),
                fit: BoxFit.fitWidth
              //colorFilter: new ColorFilter.mode(Cores.azulSafe.withOpacity(1), BlendMode.dstATop))
            ),
          ),
          child:
          //backgroundColor: const Color(0xFF3C10BB),
          SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                      child: GestureDetector(
                        child:
                        File('${Constants.diretorioVetAdvisor}/avatar.png')
                            .existsSync()
                            ? Image.file(
                          File(
                              '${Constants.diretorioVetAdvisor}/avatar.png'),
                          // um condicional

                          //maxSizeBytes: 3000 * 1000,
                          fit: BoxFit.cover,
                          width: 60,
                          height: 60,
                        )
                            : Image.asset("imagens/user.png"),
                        onTap: () {},
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit_note_outlined,
                            color: Colors.white)),
                    const Text(
                      'Editar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('* Nome do Pet',
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.white)),
                      const Padding(padding: EdgeInsets.only(bottom: 5)),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.all(Radius.circular(17)),
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
                  padding: const EdgeInsets.only(
                      top: 20, left: 20, right: 20, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Tipo de Pet",
                          style: TextStyle(color: Colors.white)),
                      ButtonBar(
                        alignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Radio<SingingCharacterTipoDoPet>(
                                value: SingingCharacterTipoDoPet.Cachorro,
                                onChanged:
                                    (SingingCharacterTipoDoPet? value) {
                                  setState(() {});
                                },
                                groupValue: null,
                                fillColor: MaterialStateColor.resolveWith(
                                        (states) => Colors.white),
                              ),
                              const Text("Cachorro",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white)),
                            ],
                          ),
                          Row(
                            children: [
                              Radio<SingingCharacterTipoDoPet>(
                                  value: SingingCharacterTipoDoPet.Gato,
                                  groupValue: null,
                                  fillColor: MaterialStateColor.resolveWith(
                                          (states) => Colors.white),
                                  onChanged:
                                      (SingingCharacterTipoDoPet? value) {
                                    setState(() {});
                                  }),
                              const Text("Gato",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white))
                            ],
                          ),
                          Row(
                            children: [
                              Radio<SingingCharacterTipoDoPet>(
                                  value: SingingCharacterTipoDoPet.Animais,
                                  groupValue: null,
                                  fillColor: MaterialStateColor.resolveWith(
                                          (states) => Colors.white),
                                  onChanged:
                                      (SingingCharacterTipoDoPet? value) {
                                    setState(() {});
                                  }),
                              const Text("Animais Exóticos",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white))
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 20, right: 20, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Gênero",
                          style: TextStyle(color: Colors.white)),
                      ButtonBar(
                        alignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Radio<SingingCharacterGenero>(
                                value: SingingCharacterGenero.Feminino,
                                onChanged: (SingingCharacterGenero? value) {
                                  setState(() {});
                                },
                                groupValue: null,
                                fillColor: MaterialStateColor.resolveWith(
                                        (states) => Colors.white),
                              ),
                              const Text("Feminino",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white)),
                            ],
                          ),
                          Row(
                            children: [
                              Radio<SingingCharacterGenero>(
                                  value: SingingCharacterGenero.Masculino,
                                  groupValue: null,
                                  fillColor: MaterialStateColor.resolveWith(
                                          (states) => Colors.white),
                                  onChanged:
                                      (SingingCharacterGenero? value) {
                                    setState(() {});
                                  }),
                              const Text("Masculino",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white))
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Raça',
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.white)),
                      const Padding(padding: EdgeInsets.only(bottom: 5)),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.all(Radius.circular(17)),
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
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Peso',
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.white)),
                      const Padding(padding: EdgeInsets.only(bottom: 5)),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.all(Radius.circular(17)),
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
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('ID do Pet',
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.white)),
                      const Padding(padding: EdgeInsets.only(bottom: 5)),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.all(Radius.circular(17)),
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
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 1),
                        child: Text('Animal Castrado?',
                            //textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.white)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 120),
                        child: Switch(
                            value: false,
                            activeColor: Colors.white,
                            activeTrackColor: Colors.transparent,
                            onChanged: (value) {}),
                      ),
                    ]),
                Padding(
                  padding: EdgeInsets.only(bottom: 1),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropdownButton<String>(
                          items: meses.map(buildMenuItem).toList(),
                          onChanged: (value) =>
                              setState(() => this.value = value),
                        ),
                        DropdownButton<String>(
                          items: ano.map(buildMenuAno).toList(),
                          onChanged: (value) =>
                              setState(() => this.value = value),
                        )
                      ]),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 1),
                        child: Text('Animal Vacinado?',
                            //textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.white)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 120),

                        child: Switch(
                            value: false,
                            activeColor: Colors.white,
                            activeTrackColor: Colors.transparent,
                            onChanged: (value) {}),
                      ),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 1),
                        child: Text('Animal Vermifugado?',
                            //textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.white)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 120),
                        child: Switch(
                            value: false,
                            activeColor: Colors.white,
                            activeTrackColor: Colors.transparent,
                            onChanged: (value) {}),
                      ),
                    ]),
                Padding(
                    padding: EdgeInsets.only(),
                    child: Row(children: const [
                      Text(
                        "Cadastrar vacina",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      Icon(MdiIcons.chevronDoubleRight,
                          color: Colors.white),
                    ])),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Responsável Legal do Pet',
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.white)),
                      const Padding(padding: EdgeInsets.only(bottom: 5)),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.all(Radius.circular(17)),
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
                    padding: const EdgeInsets.only(),
                    child: Row(children: const [
                      Text(
                        "Cadastrar vermifogo",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      Icon(MdiIcons.chevronDoubleRight,
                          color: Colors.white),
                    ])),
                Builder(
                  builder: (context) => ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PerfilPaciente()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: Colors.white),
                      child: const Text(
                        'Próxima',
                        style: TextStyle(color: Color(0xFF3C10BB)),
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
