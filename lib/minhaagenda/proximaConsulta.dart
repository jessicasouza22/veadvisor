// 1.3 Proxima Consulta

import 'package:intl/intl.dart';
import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:vetadvisor/fluxopesquisarapida/detalheDaPesquisaDermatiteAtopica.dart';
import 'package:vetadvisor/fluxoprontuariodigital/cadastreOPet.dart';
import 'package:vetadvisor/fluxoprontuariodigital/perfilPaciente.dart';
import 'package:vetadvisor/inicio.dart';
import 'package:vetadvisor/recursos/Constants.dart';
import 'package:carousel_slider/carousel_slider.dart';



class ProximaConsulta extends StatelessWidget {
  const ProximaConsulta({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProximaConsultaPage();
  }
}

class ProximaConsultaPage extends StatefulWidget {
  const ProximaConsultaPage({Key? key}) : super(key: key);

  @override
  State<ProximaConsultaPage> createState() => _ProximaConsultaState();
}

class _ProximaConsultaState extends State<ProximaConsultaPage> {




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
                                          builder: (context) =>
                                          const PerfilPaciente()),
                                    );

                                    //print("clicado na seta");
                                  },
                                  icon: const Icon(Icons.arrow_back))),
                          Text(
                            "Próximas consultas",
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
                margin: EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 10),
                padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                decoration: BoxDecoration(color: Colors.white),
                child: Column(children: [

                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          " |  Próximas consultas ",
                          style: TextStyle(
                              color: Color(0xFF3C10BB),
                              fontSize: 14,
                              decoration: TextDecoration.none),
                        ),

                        ElevatedButton(
                          style: TextButton.styleFrom(
                            // padding: const EdgeInsets.only(top: 4, right: 10, left: 10, bottom: 4),

                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            // Background Color
                          ),
                          onPressed: () {}, child:

                        Text("Ver todas",
                          style: TextStyle(
                            color: Color(0xFF8F90A6),
                            fontSize: 12,
                          ),),),]),



                  Container(
                      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                      // padding: const EdgeInsets.only(bottom: 240),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        //color: Colors.orange,
                      ),

                      child:
                      Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Paciente",
                                    style: TextStyle(
                                        color: Color(0xFF3C10BB),
                                        fontSize: 14,
                                        decoration: TextDecoration.none),
                                  ),

                                  ElevatedButton(
                                      style: TextButton.styleFrom(
                                        // padding: const EdgeInsets.only(top: 4, right: 10, left: 10, bottom: 4),

                                        backgroundColor: Color(0xFF3C10BB),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20)),
                                        // Background Color
                                      ),
                                      onPressed: () {}, child:

                                  Text("Ver Perfil",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                    ),)),]),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Container(
                                    margin: EdgeInsets.only(top: 10, bottom: 10),
                                    height: 110,
                                    width: 250,
                                    decoration:
                                    BoxDecoration(
                                      image: const
                                      DecorationImage(
                                          image:
                                          AssetImage(
                                              "imagens/telaInicioPropaganda01.png"
                                          )
                                      ),
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(15),

                                    ),

                                  )
                                ]
                            ),
                          ])),



                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          " |  Próximas consultas ",
                          style: TextStyle(
                              color: Color(0xFF3C10BB),
                              fontSize: 14,
                              decoration: TextDecoration.none),
                        ),]),

                  Padding(padding: EdgeInsets.all(10)),



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
              )
            ])));
  }
}
