// 2.8.2 Consulta Tratamento Para Doenca Sugerido Previa

import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:vetadvisor/fluxoprontuariodigital/cadastreOPet.dart';
import 'package:vetadvisor/fluxoprontuariodigital/consultaAtendimentoPaciente.dart';
import 'package:vetadvisor/fluxoprontuariodigital/consultaMarcosTerapeuticos.dart';
import 'package:vetadvisor/fluxoprontuariodigital/consultaPossiveisDiagnosticos.dart';
import 'package:vetadvisor/fluxoprontuariodigital/consultaTratamentoSintomatologicoPosologiaAutomatico.dart';
import 'package:vetadvisor/recursos/Constants.dart';
import 'consultaMarcosTerapeuticos.dart';

class ConsultaTratamentoParaDoencaSugeridoPrevia extends StatelessWidget {
  const ConsultaTratamentoParaDoencaSugeridoPrevia ({super.key});

  @override
  Widget build(BuildContext context) {
    return const ConsultaTratamentoParaDoencaSugeridoPreviaPage();
  }
}

class ConsultaTratamentoParaDoencaSugeridoPreviaPage extends StatefulWidget {
  const ConsultaTratamentoParaDoencaSugeridoPreviaPage({Key? key}) : super(key: key);

  @override
  State<ConsultaTratamentoParaDoencaSugeridoPreviaPage> createState() => _ConsultaTratamentoParaDoencaSugeridoPreviaState();
}

class _ConsultaTratamentoParaDoencaSugeridoPreviaState extends State<ConsultaTratamentoParaDoencaSugeridoPreviaPage> {
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
                            "Consulta",
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

              Text(
                "Prévia da prescrição médica",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF4116B4), fontWeight: FontWeight.bold),
              ),
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
              Container(
                //padding: const EdgeInsets.all(2),
                //  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xFF4116B4),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  )),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                padding: const EdgeInsets.only(bottom: 240),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFF5F5F5),
                  //color: Colors.orange,
                ),

                child: Column(children: [
                  const Text(
                    "Via oral",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xFF59616E), fontWeight: FontWeight.bold),
                  ),

                  Container(
                    //margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child:
                            Column(
                              children: [
                              Row(
                                children: const [
                                  Text("1. Apoquel 10mg  1cx",
                                  style: TextStyle(
                                  color: Color(0xFF59616E)),
                                     ),
                                ],
                              ),
                                Row(
                                  children: [
                                   Flexible(child: AutoSizeText(
                                       'Tratamento sugerido ou selecione conforme acima conforme desejado.',
                                        maxLines: 2,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                        //fontSize: 12,
                                        //fontFamily: 'Inter Variable Font',
                                            color: Color(0xFF59616E),
    //   color: Color(0xFF59616E),
                                           ),),),
                                  ]),
]),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Container(
                    //margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child:
                    Column(
                        children: [
                          Row(
                            children: [
                              Text("XYZ",
                                style: TextStyle(
                                    color: Color(0xFF59616E)),
                              ),
                            ],
                          ),

                        ]),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Text(
                    "Via tópica",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xFF59616E), fontWeight: FontWeight.bold),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Container(
                    //margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child:
                    Column(
                        children: [
                          Row(
                            children: [
                              Text("2. Micodine 500ml 1fr",
                                style: TextStyle(
                                    color: Color(0xFF59616E)),
                              ),
                            ],
                          ),
                          Row(
                              children: [
                                Flexible(child: AutoSizeText(
                                  'Aplicar 5ml',
                                  maxLines: 2,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    //fontSize: 12,
                                    //fontFamily: 'Inter Variable Font',
                                    color: Color(0xFF59616E),
                                    //   color: Color(0xFF59616E),
                                  ),),),
                              ]),
                        ]),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Container(
                    //margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child:
                    Column(
                        children: [
                          Row(
                            children: [
                              Text("XYZ",
                                style: TextStyle(
                                    color: Color(0xFF59616E)),
                              ),
                            ],
                          ),

                        ]),
                  ),
                  Text(
                    "Injetável",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xFF59616E), fontWeight: FontWeight.bold),
                  ),
                  Container(
                    //margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child:
                    Column(
                        children: [
                          Row(
                            children: [
                              Text("2. Micodine 500ml 1fr",
                                style: TextStyle(
                                    color: Color(0xFF59616E)),
                              ),
                            ],
                          ),
                          Row(
                              children: const [
                                Flexible(child: AutoSizeText(
                                  'Aplicar 5ml',
                                  maxLines: 2,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    //fontSize: 12,
                                    //fontFamily: 'Inter Variable Font',
                                    color: Color(0xFF59616E),
                                    //   color: Color(0xFF59616E),
                                  ),),),
                              ]),
                        ]),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Container(
                    //margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child:
                    Column(
                        children: [
                          Row(
                            children: [
                              Text("XYZ",
                                style: TextStyle(
                                    color: Color(0xFF59616E)),
                              ),
                            ],
                          ),

                        ]),
                  ),



                  Divider(
                    color: Color(0xFF59616E),
                    thickness: 0.3,
                    endIndent:10,
                    indent: 10,),







                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                                    const ConsultaMarcosTerapeuticos()),
                              );
                            },
                            child: const Text(
                              'Proxima Etapa',
                              style: TextStyle(color: Color(0xFF3C10BB)),
                            ),),
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
