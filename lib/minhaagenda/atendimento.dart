// 1.6 Atendimento

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



class Atendimento extends StatelessWidget {
  const Atendimento({super.key});

  @override
  Widget build(BuildContext context) {
    return const AtendimentoPage();
  }
}

class AtendimentoPage extends StatefulWidget {
  const AtendimentoPage({Key? key}) : super(key: key);

  @override
  State<AtendimentoPage> createState() => _AtendimentoState();
}

class _AtendimentoState extends State<AtendimentoPage> {




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


                  Container(
                    margin: EdgeInsets.only(top: 30, left: 15),
                    //padding: EdgeInsets.all(6),

                      child: CircleAvatar(
                        radius: 50, // raio do círculo
                        backgroundImage: AssetImage('imagens/icone.png'),
                        backgroundColor: Colors.blue, // cor de fundo do círculo
                      )


                            ),


                  Padding(padding: EdgeInsets.all(30)),

                  Text("Atendimento",
                  style: TextStyle(
                    fontSize:20,
                    //color: Color(0xff)
                  ),),


                  Padding(padding: EdgeInsets.all(30)),


                  Builder(
                    builder: (context) => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: Colors.green),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const Atendimento()),
                          );
                        },
                        child: const Text(
                          'Iniciar Conversa',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),

                  const Divider(
                    color: Color(0xFF979797),
                    thickness: 0.8,
                    endIndent: 0,
                    indent: 0,
                  ),

                  Padding(padding: EdgeInsets.all(20)),

                  Text("Ainda nao tem WhatsApp?",
                    style: TextStyle(
                      fontSize:20,
                      //color: Color(0xff)
                    ),),








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
