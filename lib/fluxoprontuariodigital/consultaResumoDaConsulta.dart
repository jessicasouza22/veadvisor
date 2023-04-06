// 2.11 Resumo da nova consulta


import 'dart:io';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'package:vetadvisor/recursos/Constants.dart';

class ConsultaAtendimentoPaciente extends StatelessWidget {
  const ConsultaAtendimentoPaciente({super.key});

  @override
  Widget build(BuildContext context) {
    return const ConsultaAtendimentoPacientePage();
  }
}

class ConsultaAtendimentoPacientePage extends StatefulWidget {
  const ConsultaAtendimentoPacientePage({Key? key}) : super(key: key);

  @override
  State<ConsultaAtendimentoPacientePage> createState() => _ConsultaAtendimentoPacienteState();
}

class _ConsultaAtendimentoPacienteState extends State<ConsultaAtendimentoPacientePage> {
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
                        const Text(
                          "Fechar e voltar ao perfil",
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
      body: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
          //padding: const EdgeInsets.only(bottom: 400),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xFFF5F5F5),
            //color: Colors.orange,
          ),
          child: Column(children: [


            const Text("Atendimento paciente",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF4116B4),
              ),),









          ]),
        ),
        const Padding(
          padding: EdgeInsets.all(8),
        ),

        Container(
          margin: const EdgeInsets.only(left: 10, right: 10, top: 185),
          padding: const EdgeInsets.only(bottom: 10),
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
    );
  }
}
