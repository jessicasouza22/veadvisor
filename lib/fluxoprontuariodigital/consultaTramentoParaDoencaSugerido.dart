// 2.8.1 Consulta Tratamento Para Doenca Sugerido


import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:vetadvisor/fluxoprontuariodigital/cadastreOPet.dart';
import 'package:vetadvisor/fluxoprontuariodigital/consultaAtendimentoPaciente.dart';
import 'package:vetadvisor/fluxoprontuariodigital/consultaPossiveisDiagnosticos.dart';
import 'package:vetadvisor/fluxoprontuariodigital/consultaTratamentoParaDoencaSugeridoPrevia.dart';
import 'package:vetadvisor/fluxoprontuariodigital/consultaTratamentoSintomatologicoPosologiaAutomatico.dart';
import 'package:vetadvisor/recursos/Constants.dart';

DropdownMenuItem<String> buildMenuItemQuantidade(String quantidade) => DropdownMenuItem(
  value: quantidade,
  child: Text(
    quantidade,
    style: TextStyle(
      fontSize: 5,
    ),
  ),
);

final quantidade = [
  '1',
  '2',
  '3',
  '4',
  '5'
];

final quantidadeDeDuracao = [
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',

];
DropdownMenuItem<String> buildMenuItemQuantidadeDeDuracao(String quantidadeDeDuracao) => DropdownMenuItem(
  value: quantidadeDeDuracao,
  child: Text(
    quantidadeDeDuracao,
    style: TextStyle(
      fontSize: 5,
    ),
  ),
);

final tipoDeDuracao = [
  'dia',
  'semana',
  'mes',
  'ano'

];

DropdownMenuItem<String> buildMenuItemTipoDeDuracao(String tipoDeDuracao) => DropdownMenuItem(
  value: tipoDeDuracao,
  child: Text(
    tipoDeDuracao,
    style: TextStyle(
      fontSize: 5,
    ),
  ),
);

DropdownMenuItem<String> buildMenuItemfrequencia(String frequencia) => DropdownMenuItem(
  value: frequencia,
  child: Text(
    frequencia,
    style: TextStyle(
      fontSize: 5,
    ),
  ),
);
final frequencia = [
  'a cada 8h',
  'a cada 6h',
  'a cada 12h',
];

DropdownMenuItem<String> buildMenuItemvia(String via) => DropdownMenuItem(
  value: via,
  child: Text(
    via,
    style: TextStyle(
      fontSize: 5,
    ),
  ),
);

final via = [
  'oral',
  'nasal',
  'outros',
];
final apresentacao = [
  'item1',
  'item2',
  'item3',
];

DropdownMenuItem<String> buildMenuItemquantidadeDeDose(String quantidadeDeDose) => DropdownMenuItem(
  value: quantidadeDeDose,
  child: Text(
    quantidadeDeDose,
    style: TextStyle(
      fontSize: 5,
    ),
  ),
);

final quantidadeDeDose = [
  '1',
  '2',
  '3',
  '4',
  '5'
];
DropdownMenuItem<String> buildMenuItemtipoDeDose(String tipoDeDose) => DropdownMenuItem(
  value: tipoDeDose,
  child: Text(
    tipoDeDose,
    style: TextStyle(
      fontSize: 5,
    ),
  ),
);
final tipoDeDose = [
  'comp',
  'gota',
  'ml',
  'lt',
  'ots'
];

DropdownMenuItem<String> buildMenuItem(String apresentecao) => DropdownMenuItem(
  value: apresentecao,
  child: Text(
    apresentecao,
    style: TextStyle(
      fontSize: 5,
    ),
  ),
);


final quantidade02 = [
  '10',
  '20',
  '30',
];

DropdownMenuItem<String> buildMenuItemQuantidade02(String quantidade02) => DropdownMenuItem(
  value: quantidade02,
  child: Text(
    quantidade02,
    style: TextStyle(
      fontSize: 5,
    ),
  ),
);

final unidadeDeMedida = [
  'mg',
  'gm',
  'kg',
];

DropdownMenuItem<String> buildMenuItemUnidadeDeMedida(String unidadeDeMedida) => DropdownMenuItem(
  value: unidadeDeMedida,
  child: Text(
    unidadeDeMedida,
    style: TextStyle(
      fontSize: 5,
    ),
  ),
);

class ConsultaTratamentoParaDoencaSugerido extends StatelessWidget {
  const ConsultaTratamentoParaDoencaSugerido({super.key});

  @override
  Widget build(BuildContext context) {
    return const ConsultaTratamentoParaDoencaSugeridoPage();
  }
}

class ConsultaTratamentoParaDoencaSugeridoPage extends StatefulWidget {
  const ConsultaTratamentoParaDoencaSugeridoPage({Key? key}) : super(key: key);

  @override
  State<ConsultaTratamentoParaDoencaSugeridoPage> createState() => _ConsultaTratamentoParaDoencaSugeridoState();
}

class _ConsultaTratamentoParaDoencaSugeridoState extends State<ConsultaTratamentoParaDoencaSugeridoPage> {
  set value(String? value) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            toolbarHeight: 80,
            elevation: 30,
            //inned: true,
            //expandedHeight: 50,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(45),
                    bottomLeft: Radius.circular(10),
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                // LinearGradient
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  // colors for gradient
                  colors: [
                    Color(0xFF4116B4),
                    Color(0xff4116B4),
                    Color(0xff7347EF),
                    Color(0xffE3EDF7),
                  ],
                ),
              ),
            ),
            // title of appbar

            actions: [
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                //print("clicado na seta");
                              },
                              icon: const Icon(Icons.arrow_back)),
                          Text(
                            "Perfil",
                            //textAlign: TextAlign.center,

                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),

                          IconButton(
                              onPressed: () {
                                //print("clicado no notificacao");
                              },
                              icon: const Icon(MdiIcons.bellBadgeOutline)),

                        ],
                      )))
            ]),
        body: SingleChildScrollView(
            child: Column(children: [
              Container(
                margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                padding: const EdgeInsets.only(bottom: 240),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFF5F5F5),
                  //color: Colors.orange,
                ),

                child: Column(children: [
                  Text(
                    "Tratamento sugerido: Dermatite atópica",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF4116B4), fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text("Prurido",
                        style: TextStyle(
                          fontSize:12,
                        ),),
                      Text("Incluir",
                        style: TextStyle(
                          fontSize:12,
                        ),),
                      Checkbox(
                        checkColor: Colors.white,
                        activeColor: Colors.green,
                        //fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: true,
                        shape: CircleBorder(),
                        onChanged: (value) {},
                      ),
                    ]
                  ),
                  Row(
                    children: [
                      Flexible(child: AutoSizeText(
                          'Tratamento sugerido ou selecione conforme acima conforme desejado.',
                          maxLines: 2,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Inter Variable Font',
                            //   color: Color(0xFF59616E),
                          )
                      ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        //margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("Apresentação",
                                    style: TextStyle(
                                      fontSize:12,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                DropdownButton<String>(
                                  items: apresentacao.map(buildMenuItem).toList(),
                                  onChanged: (value) =>
                                      setState(() => this.value = value),
                                ),
                              ],
                            ),

                          ],
                        ),

                      ),
                      Container(
                        //margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("Concentração",
                                    style: TextStyle(
                                      fontSize:12,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                DropdownButton<String>(
                                  items: quantidade.map(buildMenuItemQuantidade).toList(),
                                  onChanged: (value) =>
                                      setState(() => this.value = value),
                                ),
                                DropdownButton<String>(
                                  items: unidadeDeMedida.map(buildMenuItemUnidadeDeMedida).toList(),
                                  onChanged: (value) =>
                                      setState(() => this.value = value),
                                ),
                              ],
                            ),

                          ],
                        ),

                      ),
                      Container(
                        //margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.transparent,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("Calcular dose",
                                    style: TextStyle(
                                      fontSize:12,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  //margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                                  // padding: const EdgeInsets.only(left: 15, right: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xFFF8DACC),
                                  ),
                                  child: Text("Calcular",
                                    style: TextStyle(
                                      color: Color(0xFFF55F44),
                                      fontSize: 12,
                                    ),),
                                ),
                                Container(
                                  //padding: const EdgeInsets.all(1),
                                  //  margin: const EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Color(0xFFF55F44),
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 20,
                                    )),
                              ],
                            ),

                          ],
                        ),

                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        //margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("Dose",
                                    style: TextStyle(
                                      fontSize:12,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                DropdownButton<String>(
                                  items: quantidadeDeDose.map(buildMenuItemquantidadeDeDose).toList(),
                                  onChanged: (value) =>
                                      setState(() => this.value = value),
                                ),
                                DropdownButton<String>(
                                  items: tipoDeDose.map(buildMenuItemtipoDeDose).toList(),
                                  onChanged: (value) =>
                                      setState(() => this.value = value),
                                ),
                              ],
                            )

                          ],
                        ),

                      ),
                      Container(
                        //margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("Frequencia",
                                    style: TextStyle(
                                      fontSize:12,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                DropdownButton<String>(
                                  items: frequencia.map(buildMenuItemfrequencia).toList(),
                                  onChanged: (value) =>
                                      setState(() => this.value = value),
                                ),
                              ],
                            )
                          ],
                        ),

                      ),
                      Container(
                        //margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("Via",
                                    style: TextStyle(
                                      fontSize:12,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                DropdownButton<String>(
                                  items: via.map(buildMenuItemvia).toList(),
                                  onChanged: (value) =>
                                      setState(() => this.value = value),
                                ),
                              ],
                            )

                          ],
                        ),

                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Container(
                        //margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("Duracao",
                                    style: TextStyle(
                                      fontSize:12,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                DropdownButton<String>(
                                  items: quantidadeDeDuracao.map(buildMenuItemQuantidadeDeDuracao).toList(),
                                  onChanged: (value) =>
                                      setState(() => this.value = value),
                                ),
                                DropdownButton<String>(
                                  items: tipoDeDuracao.map(buildMenuItemTipoDeDuracao).toList(),
                                  onChanged: (value) =>
                                      setState(() => this.value = value),
                                ),
                              ],
                            )

                          ],
                        ),

                      ),
                      Container(
                        //margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("Quantidade",
                                    style: TextStyle(
                                      fontSize:12,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                DropdownButton<String>(
                                  items: quantidade.map(buildMenuItemQuantidade).toList(),
                                  onChanged: (value) =>
                                      setState(() => this.value = value),
                                ),
                              ],
                            ),

                          ],
                        ),

                      ),

                    ],
                  ),

                  Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(2),
                          //  margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,

                          ),
                          child: const Icon(
                            Icons.add,
                            color: Color(0xFF4116B4),
                            size: 10,
                          )),
                      Padding(padding: EdgeInsets.all(10)),
                      Text("Adicionar novo tópico ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                          color: const Color(0xFF4116B4),
                          fontWeight: FontWeight.bold,

                        ),),
                    ],
                  ),

                  Divider(
                    color: Color(0xFF59616E),
                    thickness: 0.3,
                    endIndent:10,
                    indent: 10,),
                  Row(
                      children: [
                        Text("Infecções Bacteriana",
                          style: TextStyle(
                            fontSize:12,
                          ),),
                        Text("Incluir",
                          style: TextStyle(
                            fontSize:12,
                          ),),
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: Colors.green,
                          //fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: true,
                          shape: CircleBorder(),
                          onChanged: (value) {},
                        ),
                      ]
                  ),
                  Row(
                    children: [
                      Flexible(child: AutoSizeText(
                          'Tratamento sugerido ou selecione conforme acima conforme desejado.',
                          maxLines: 2,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Inter Variable Font',
                            //   color: Color(0xFF59616E),
                          )
                      ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        //margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("Apresentação",
                                    style: TextStyle(
                                      fontSize:12,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                DropdownButton<String>(
                                  items: apresentacao.map(buildMenuItem).toList(),
                                  onChanged: (value) =>
                                      setState(() => this.value = value),
                                ),
                              ],
                            ),

                          ],
                        ),

                      ),
                      Container(
                        //margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("Concentração",
                                    style: TextStyle(
                                      fontSize:12,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                DropdownButton<String>(
                                  items: quantidade.map(buildMenuItemQuantidade).toList(),
                                  onChanged: (value) =>
                                      setState(() => this.value = value),
                                ),
                                DropdownButton<String>(
                                  items: unidadeDeMedida.map(buildMenuItemUnidadeDeMedida).toList(),
                                  onChanged: (value) =>
                                      setState(() => this.value = value),
                                ),
                              ],
                            ),

                          ],
                        ),

                      ),
                      Container(
                        //margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.transparent,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("Calcular dose",
                                    style: TextStyle(
                                      fontSize:12,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  //margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                                  // padding: const EdgeInsets.only(left: 15, right: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xFFF8DACC),
                                  ),
                                  child: Text("Calcular",
                                    style: TextStyle(
                                      color: Color(0xFFF55F44),
                                      fontSize: 12,
                                    ),),
                                ),
                                Container(
                                  //padding: const EdgeInsets.all(1),
                                  //  margin: const EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Color(0xFFF55F44),
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 20,
                                    )),
                              ],
                            ),

                          ],
                        ),

                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        //margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("Dose",
                                    style: TextStyle(
                                      fontSize:12,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                DropdownButton<String>(
                                  items: quantidadeDeDose.map(buildMenuItemquantidadeDeDose).toList(),
                                  onChanged: (value) =>
                                      setState(() => this.value = value),
                                ),
                                DropdownButton<String>(
                                  items: tipoDeDose.map(buildMenuItemtipoDeDose).toList(),
                                  onChanged: (value) =>
                                      setState(() => this.value = value),
                                ),
                              ],
                            )

                          ],
                        ),

                      ),
                      Container(
                        //margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("Frequencia",
                                    style: TextStyle(
                                      fontSize:12,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                DropdownButton<String>(
                                  items: frequencia.map(buildMenuItemfrequencia).toList(),
                                  onChanged: (value) =>
                                      setState(() => this.value = value),
                                ),
                              ],
                            )
                          ],
                        ),

                      ),
                      Container(
                        //margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("Via",
                                    style: TextStyle(
                                      fontSize:12,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                DropdownButton<String>(
                                  items: via.map(buildMenuItemvia).toList(),
                                  onChanged: (value) =>
                                      setState(() => this.value = value),
                                ),
                              ],
                            )

                          ],
                        ),

                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Container(
                        //margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("Duracao",
                                    style: TextStyle(
                                      fontSize:12,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                DropdownButton<String>(
                                  items: quantidadeDeDuracao.map(buildMenuItemQuantidadeDeDuracao).toList(),
                                  onChanged: (value) =>
                                      setState(() => this.value = value),
                                ),
                                DropdownButton<String>(
                                  items: tipoDeDuracao.map(buildMenuItemTipoDeDuracao).toList(),
                                  onChanged: (value) =>
                                      setState(() => this.value = value),
                                ),
                              ],
                            )

                          ],
                        ),

                      ),
                      Container(
                        //margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("Quantidade",
                                    style: TextStyle(
                                      fontSize:12,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                DropdownButton<String>(
                                  items: quantidade.map(buildMenuItemQuantidade).toList(),
                                  onChanged: (value) =>
                                      setState(() => this.value = value),
                                ),
                              ],
                            ),

                          ],
                        ),

                      ),

                    ],
                  ),

                  Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(2),
                          //  margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,

                          ),
                          child: const Icon(
                            Icons.add,
                            color: Color(0xFF4116B4),
                            size: 10,
                          )),
                      Padding(padding: EdgeInsets.all(10)),
                      Text("Adicionar novo tópico ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                          color: const Color(0xFF4116B4),
                          fontWeight: FontWeight.bold,

                        ),),
                    ],
                  ),

                  Divider(
                    color: Color(0xFF59616E),
                    thickness: 0.3,
                    endIndent:10,
                    indent: 10,),

                  Row(
                      children: [
                        Text("Infecções Fúngicas",
                          style: TextStyle(
                            fontSize:12,
                          ),),
                        Text("Incluir",
                          style: TextStyle(
                            fontSize:12,
                          ),),
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: Colors.green,
                          //fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: true,
                          shape: CircleBorder(),
                          onChanged: (value) {},
                        ),
                      ]
                  ),
                  Row(
                    children: [
                      Flexible(child: AutoSizeText(
                          'Tratamento sugerido ou selecione conforme acima conforme desejado.',
                          maxLines: 2,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Inter Variable Font',
                            //   color: Color(0xFF59616E),
                          )
                      ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        //margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("Apresentação",
                                    style: TextStyle(
                                      fontSize:12,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                DropdownButton<String>(
                                  items: apresentacao.map(buildMenuItem).toList(),
                                  onChanged: (value) =>
                                      setState(() => this.value = value),
                                ),
                              ],
                            ),

                          ],
                        ),

                      ),
                      Container(
                        //margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("Concentração",
                                    style: TextStyle(
                                      fontSize:12,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                DropdownButton<String>(
                                  items: quantidade.map(buildMenuItemQuantidade).toList(),
                                  onChanged: (value) =>
                                      setState(() => this.value = value),
                                ),
                                DropdownButton<String>(
                                  items: unidadeDeMedida.map(buildMenuItemUnidadeDeMedida).toList(),
                                  onChanged: (value) =>
                                      setState(() => this.value = value),
                                ),
                              ],
                            ),

                          ],
                        ),

                      ),
                      Container(
                        //margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.transparent,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("Calcular dose",
                                    style: TextStyle(
                                      fontSize:12,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  //margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                                  // padding: const EdgeInsets.only(left: 15, right: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xFFF8DACC),
                                  ),
                                  child: Text("Calcular",
                                    style: TextStyle(
                                      color: Color(0xFFF55F44),
                                      fontSize: 12,
                                    ),),
                                ),
                                Container(
                                  //padding: const EdgeInsets.all(1),
                                  //  margin: const EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Color(0xFFF55F44),
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 20,
                                    )),
                              ],
                            ),

                          ],
                        ),

                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        //margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("Dose",
                                    style: TextStyle(
                                      fontSize:12,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                DropdownButton<String>(
                                  items: quantidadeDeDose.map(buildMenuItemquantidadeDeDose).toList(),
                                  onChanged: (value) =>
                                      setState(() => this.value = value),
                                ),
                                DropdownButton<String>(
                                  items: tipoDeDose.map(buildMenuItemtipoDeDose).toList(),
                                  onChanged: (value) =>
                                      setState(() => this.value = value),
                                ),
                              ],
                            )

                          ],
                        ),

                      ),
                      Container(
                        //margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("Frequencia",
                                    style: TextStyle(
                                      fontSize:12,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                DropdownButton<String>(
                                  items: frequencia.map(buildMenuItemfrequencia).toList(),
                                  onChanged: (value) =>
                                      setState(() => this.value = value),
                                ),
                              ],
                            )
                          ],
                        ),

                      ),
                      Container(
                        //margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("Via",
                                    style: TextStyle(
                                      fontSize:12,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                DropdownButton<String>(
                                  items: via.map(buildMenuItemvia).toList(),
                                  onChanged: (value) =>
                                      setState(() => this.value = value),
                                ),
                              ],
                            )

                          ],
                        ),

                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Container(
                        //margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("Duracao",
                                    style: TextStyle(
                                      fontSize:12,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                DropdownButton<String>(
                                  items: quantidadeDeDuracao.map(buildMenuItemQuantidadeDeDuracao).toList(),
                                  onChanged: (value) =>
                                      setState(() => this.value = value),
                                ),
                                DropdownButton<String>(
                                  items: tipoDeDuracao.map(buildMenuItemTipoDeDuracao).toList(),
                                  onChanged: (value) =>
                                      setState(() => this.value = value),
                                ),
                              ],
                            )

                          ],
                        ),

                      ),
                      Container(
                        //margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("Quantidade",
                                    style: TextStyle(
                                      fontSize:12,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                DropdownButton<String>(
                                  items: quantidade.map(buildMenuItemQuantidade).toList(),
                                  onChanged: (value) =>
                                      setState(() => this.value = value),
                                ),
                              ],
                            ),

                          ],
                        ),

                      ),

                    ],
                  ),

                  Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(2),
                          //  margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,

                          ),
                          child: const Icon(
                            Icons.add,
                            color: Color(0xFF4116B4),
                            size: 10,
                          )),
                      Padding(padding: EdgeInsets.all(10)),
                      Text("Adicionar novo tópico ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                          color: const Color(0xFF4116B4),
                          fontWeight: FontWeight.bold,

                        ),),
                    ],
                  ),

                  Divider(
                    color: Color(0xFF59616E),
                    thickness: 0.3,
                    endIndent:10,
                    indent: 10,),

                  Container(

                   // margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFF8DACC),
                    ),


                    child: Row(
                      children: [

                        Flexible(child: AutoSizeText(
                            'Adicionar nova medicação',
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Inter Variable Font',
                              color: Color(0xFFF55F44),
                            )
                        ),
                        ),
                        Container(
                            padding: const EdgeInsets.all(2),
                            //  margin: const EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color(0xFFF55F44),

                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 10,
                            )),


                      ],
                    ),
                  ),


                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Builder(
                          builder: (context) => ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor: Colors.white),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const ConsultaTratamentoParaDoencaSugeridoPrevia()),
                                );
                              },
                              child: const Text(
                                'Ver prévia ',
                                style: TextStyle(color: Color(0xFF3C10BB)),
                              )),
                        ),
                        Builder(
                          builder: (context) => ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor: Colors.white),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const ConsultaTratamentoSintomatologicoPosologiaAutomatico()),
                                );
                              },
                              child: const Text(
                                'Próxima etapa',
                                style: TextStyle(color: Color(0xFF3C10BB)),
                              )),
                        ),
                      ]),


                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    // padding: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,

                    ),
                    child: DefaultTabController(
                        initialIndex: 1,
                        //optional, starts from 0, select the tab by default
                        length: 5,
                        child: Column(children: const [
                          TabBar(
                              indicatorColor: Colors.transparent,
                              tabs: [
                                Tab(
                                  icon: Icon(MdiIcons.home, color: Colors.grey, size: 30,),
                                ),
                                Tab(
                                  icon: Icon(MdiIcons.stethoscope,
                                      color: Colors.grey, size: 30),
                                ),
                                Tab(
                                  icon: Icon(MdiIcons.googleCirclesCommunities, color: Colors.grey, size: 30),
                                ),
                                Tab(
                                  icon: Icon(MdiIcons.calendar,
                                      color: Colors.grey, size: 30),
                                ),
                                Tab(
                                  icon: Icon(MdiIcons.dotsSquare,
                                      color: Colors.grey, size: 30),
                                ),
                              ])
                        ])),
                  ),

                ]),
              )])));
  }
}
