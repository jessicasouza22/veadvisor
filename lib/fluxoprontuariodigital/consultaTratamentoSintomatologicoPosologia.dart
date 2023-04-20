// 2.7.1 Consulta Tratamento Sintomatologico Posologia

import 'dart:io';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:vetadvisor/fluxoprontuariodigital/cadastreOPet.dart';
import 'package:vetadvisor/fluxoprontuariodigital/consultaAtendimentoPaciente.dart';
import 'package:vetadvisor/fluxoprontuariodigital/consultaPossiveisDiagnosticos.dart';
import 'package:vetadvisor/recursos/Constants.dart';


final apresentacao = [
  'item1',
  'item2',
  'item3',
];

DropdownMenuItem<String> buildMenuItem(String apresentecao) => DropdownMenuItem(
  value: apresentecao,
  child: Text(
    apresentecao,
    style: TextStyle(
      fontSize: 8,
    ),
  ),
);


final quantidade = [
  '10',
  '20',
  '30',
];

DropdownMenuItem<String> buildMenuItemQuantidade(String quantidade) => DropdownMenuItem(
  value: quantidade,
  child: Text(
    quantidade,
    style: TextStyle(
      fontSize: 8,
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
      fontSize: 8,
    ),
  ),
);

class ConsultaTratamentoSintomatologicoPosologia extends StatelessWidget {
  const ConsultaTratamentoSintomatologicoPosologia({super.key});

  @override
  Widget build(BuildContext context) {
    return const ConsultaTratamentoSintomatologicoPosologiaPage();
  }
}

class ConsultaTratamentoSintomatologicoPosologiaPage extends StatefulWidget {
  const ConsultaTratamentoSintomatologicoPosologiaPage({Key? key}) : super(key: key);

  @override
  State<ConsultaTratamentoSintomatologicoPosologiaPage> createState() => _ConsultaTratamentoSintomatologicoPosologiaState();
}

class _ConsultaTratamentoSintomatologicoPosologiaState extends State<ConsultaTratamentoSintomatologicoPosologiaPage> {
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
                margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                padding: const EdgeInsets.only(bottom: 240),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFF5F5F5),
                  //color: Colors.orange,
                ),
                child: Column(children: [
                  Container(
                    // color: Colors.blue,

                    margin: const EdgeInsets.only(left: 80, right: 80, top: 10),
                    //padding: EdgeInsets.only(top: 15, bottom: 30),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 10,
                          blurRadius: 5,
                          offset:
                          const Offset(0, 0), // changes x,y position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                CircleAvatar(
                                  radius: 25,
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
                                          // width:5,
                                          //height: 5,
                                        )
                                            : Image.asset("imagens/user.png"),
                                        onTap: () {},
                                      )),
                                ),
                                const Text(
                                  " ID: 000000",
                                  style: TextStyle(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11),
                                ),
                              ]),
                          Column(
                            children: const [
                              Text(
                                "Raca:",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Idade:",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Tutor(a):",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        ]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xFFD3D3D3),
                          ),
                          child: const Icon(
                            MdiIcons.whatsapp,
                            color: Color(0xFF4116B4),
                          )),
                      Container(
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xFFD3D3D3),
                          ),
                          child: const Icon(
                            MdiIcons.videoOffOutline,
                            color: Color(0xFF4116B4),
                          )),
                      Container(
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.only(top: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xFFD3D3D3),
                          ),
                          child: const Icon(
                            MdiIcons.phone,
                            color: Color(0xFF4116B4),
                          ))
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(20)),
                  DefaultTabController(
                    initialIndex: 1,
                    //optional, starts from 0, select the tab by default
                    length: 4,

                    child: Column(children: [
                      const TabBar(
                        indicatorColor: Colors.green,
                        tabs: [
                          Tab(
                            icon:
                            Icon(MdiIcons.stethoscope, color: Color(0xFF4116B4)),
                            text: "Consultas",
                          ),
                          Tab(
                            icon: Icon(MdiIcons.medicationOutline,
                                color: Color(0xFF4116B4)),
                            text: "Tratamento",
                          ),
                          Tab(
                            icon: Icon(Icons.vaccines, color: Color(0xFF4116B4)),
                            text: "Vacinas e Outros",
                          ),
                          Tab(
                            icon: Icon(MdiIcons.bottleTonicPlusOutline,
                                color: Color(0xFF4116B4)),
                            text: "Procedimentos",
                          ),
                        ],
                      ),
                      /*TabBarView(
                    children:  [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text("Inicio"),
                          Text("Termino"),

                        ],
                      ),
                    ]
                )*/
                    ]),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Posologia",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF59616E),
                          fontWeight: FontWeight.bold,
                        ),),

                    ],
                  ),
         
                  Container(

                      margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFF3C10BB),
                      ),

                    child:
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
                                      const ConsultaTratamentoSintomatologicoPosologia()),
                                );
                              },
                              child: const Text(
                                'Automático',
                                style: TextStyle(color: Color(0xFF3C10BB)),
                              )),
                        ),

                          Builder(
                            builder: (context) => ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: const StadiumBorder(),
                                    backgroundColor: Color(0xFF3C10BB)),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const ConsultaTratamentoSintomatologicoPosologia()),
                                  );
                                },
                                child: const Text(
                                 'Texto Livre',
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),


                      ])
                  ),
                  
                  Container(

                    margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    
                    
                    child: Column(
                      children: [
                        Row(
                        children: [
                        Text("Dosagens"),
                        ]),
                        Row(
                            children: [
                              Text("Canino - 0.4 - 0.6 mg / kg"),
                            ]),
                        Row(
                            children: [
                              Text("Calculadora de doses"),
                            ]),

                        Row(
                            children: [
                              Text("Peso do animal (em kg):"),
                            ]),
                        Row(
                            children: [
                              Text("Dosagens para 51 kg"),
                            ]),
                        Row(
                            children: [
                              Text("20,4 - 30,6 mg"),
                            ]),
                      ],
                    ),
                  ),


                  Divider(
                    color: Color(0xFF59616E),
                    thickness: 0.3,
                    endIndent:10,
                    indent: 10,),

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
                                Text("Apresentação"),
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
                                Text("Concentração"),
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
                                Text("Calcular dose"),
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
                                Text("Dose"),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Apoquel"),
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
                                Text("Apresentação"),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Apoquel"),
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
                                Text("Apresentação"),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Apoquel"),
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
                                Text("Apresentação"),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Apoquel"),
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
                                Text("Apresentação"),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Apoquel"),
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
                                Text("Apresentação"),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Apoquel"),
                              ],
                            ),

                          ],
                        ),

                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Descrição final",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF59616E),
                          fontWeight: FontWeight.bold,
                        ),),

                    ],
                  ),

                  Container(

                    margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),


                    child: Column(
                      children: [
                        Row(
                            children: [
                              Text("Administrar 2 comprimido a cada 8 horas por 1 semana"),
                            ]),
                        Row(
                            children: [

                            ]),
                      ],
                    ),
                  ),

                  Container(

                    child: Row(
                      children: [

                      ],
                    )
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
                                const ConsultaTratamentoSintomatologicoPosologia()),
                          );
                        },
                        child: const Text(
                          'Adicionar prescrição e ver resumo',
                          style: TextStyle(color: Color(0xFF3C10BB)),
                        )),
                  ),





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
