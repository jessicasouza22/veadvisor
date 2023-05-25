// 1.4 Detalhe Da Pesquisa Realizar Nova Pesquisa

import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:vetadvisor/fluxopesquisarapida/detalheDaPesquisaDermatiteAtopica.dart';
import 'package:vetadvisor/fluxoprontuariodigital/cadastreOPet.dart';
import 'package:vetadvisor/fluxoprontuariodigital/perfilPaciente.dart';
import 'package:vetadvisor/inicio.dart';
import 'package:vetadvisor/recursos/Constants.dart';


class DetalheDaPesquisaRealizarNovaPesquisa extends StatelessWidget {
  const DetalheDaPesquisaRealizarNovaPesquisa ({super.key});

  @override
  Widget build(BuildContext context) {
    return const DetalheDaPesquisaRealizarNovaPesquisaPage();
  }
}

class DetalheDaPesquisaRealizarNovaPesquisaPage extends StatefulWidget {
  const DetalheDaPesquisaRealizarNovaPesquisaPage({Key? key}) : super(key: key);

  @override
  State<DetalheDaPesquisaRealizarNovaPesquisaPage> createState() => _DetalheDaPesquisaRealizarNovaPesquisaState();
}

class _DetalheDaPesquisaRealizarNovaPesquisaState extends State<DetalheDaPesquisaRealizarNovaPesquisaPage> {



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
                          Builder(
                              builder: (context) => IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (
                                              context) => const PerfilPaciente()),
                                    );

                                    //print("clicado na seta");
                                  },
                                  icon: const Icon(Icons.arrow_back))),
                          Text(
                            "Detalhe da pesquisa",
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
              margin: EdgeInsets.only(left: 10,right: 10, top: 30, bottom: 10),
              padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
              decoration: BoxDecoration(
                  color: Colors.white
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Dieta de eliminação",
                          style: TextStyle(
                            //color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: const Color(0xFF4116B4),
                          )
                      ),

                      Builder(
                          builder: (context) => IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (
                                          context) => const DetalheDaPesquisaDermatiteAtopica()),
                                );

                                //print("clicado na seta");
                              },
                              icon:  Icon(MdiIcons.closeCircleOutline,
                                  color: Colors.red, size: 25))),


                    ],
                  ),

                  Padding(padding: EdgeInsets.all(10)),

                  Row(
                    children: [
                      Flexible(
                          child: AutoSizeText(
                            'Fornecer ao animal uma dieta hipoalergênica por oito semanas, como ensaio de eliminação. \nNenhum outro alimento ou substância aromatizada deve ser oferecido durante o período como por exemplo: guloseimas, suplementos vitamínicos com sabor, medicamentos mastigáveis ​​com sabor, suplementos de ácidos graxos, mesmo que em pouca quantidade. E brinquedos para mastigar devem ser eliminados. \nDepois que o animal estiver no mínimo a 8 semanas com a dieta e mostrando alguma resposta positiva, a dieta deve ser trocada novamente para dar início ao teste provoativo.',
                            style: TextStyle(
                              color: Color(0xFF4116B4),
                              fontSize: 10,
                              //fontWeight: FontWeight.bold,
                            ),
                            maxLines: 18,
                            textAlign: TextAlign.justify,
                          )),
                    ],
                  ),

                  Padding(padding: EdgeInsets.only(top: 10, bottom: 50)),

                  Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Esta informação foi útil para você? ",
                        style: TextStyle(
                          color: Color(0xFF12EC1A),
                          fontSize: 12,
                        ),
                      ),

                      Icon(
                        MdiIcons.thumbUp,
                        color: Colors.transparent,
                        size: 14,
                      ),

                      Icon(
                        MdiIcons.thumbUp,
                        color: Color(0xFFC7C9D9),
                        size: 16,
                      ),

                      Icon(
                        MdiIcons.thumbUp,
                        color: Colors.transparent,
                        size: 14,
                      ),

                      Icon(
                        MdiIcons.thumbUpOutline,
                        color: Color(0xFFC7C9D9),
                        size: 16,
                      ),
                    ],
                  ),


                ],
              ),
            ),


            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              padding: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFF5F5F5),
                //color: Colors.orange,
              ),
              child: DefaultTabController(
                  initialIndex: 1,
                  //optional, starts from 0, select the tab by default
                  length: 5,
                  child: Column(children: const [
                    TabBar(indicatorColor: Colors.transparent, tabs: [
                      Tab(
                        icon: Icon(
                          MdiIcons.home,
                          color: Colors.grey,
                          size: 30,
                        ),
                      ),
                      Tab(
                        icon: Icon(MdiIcons.stethoscope,
                            color: Colors.grey, size: 30),
                      ),
                      Tab(
                        icon: Icon(MdiIcons.googleCirclesCommunities,
                            color: Colors.grey, size: 30),
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
        ));
  }
}
