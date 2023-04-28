// 2.12 Consulta Atendimento Paciente

import 'dart:io';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:vetadvisor/fluxoprontuariodigital/consultaPossiveisDiagnosticos.dart';

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
  State<ConsultaAtendimentoPacientePage> createState() =>
      _ConsultaAtendimentoPacienteState();
}

class _ConsultaAtendimentoPacienteState
    extends State<ConsultaAtendimentoPacientePage> {
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
                                        context) => const ConsultaPossiveisDiagnosticos()),
                              );

                              //print("clicado na seta");
                            },
                            icon: const Icon(Icons.arrow_back))),
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
                  fontWeight: FontWeight.bold
              ),),


            Container(
              // color: Colors.blue,

              margin: const EdgeInsets.only(left: 80, right: 80, top: 20),
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
                                  File('${Constants
                                      .diretorioVetAdvisor}/avatar.png')
                                      .existsSync()
                                      ? Image.file(
                                    File(
                                        '${Constants
                                            .diretorioVetAdvisor}/avatar.png'),
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
                padding: const EdgeInsets.all(4),
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
                margin: EdgeInsets.only(top: 100),
                padding: const EdgeInsets.all(40),
                //  margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xFF12EC1A),


                ),
                child: const Icon(
                  MdiIcons.check,
                  color: const Color(0xFFF5F5F5),
                )),
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            Text("Atendimento finalizado\n com sucesso",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: const Color(0xFF4116B4),
                fontWeight: FontWeight.bold,

              ),),
            const Divider(
              color: Color(0xFF12EC1A),
              thickness: 0.2,
              endIndent: 30,
              indent: 30,),

          ]),
        ),
        const Padding(
          padding: EdgeInsets.all(1),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text("Deixe aqui o seu link  ",
              style: TextStyle(
                color: Color(0xFF12EC1A),
              ),),
            Icon(MdiIcons.thumbUp,
              color: Color(0xFFC7C9D9),),

            Icon(MdiIcons.thumbUpOutline,
              color: Color(0xFFC7C9D9),),
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(1),

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
              child: Column(children: [
                  TabBar(
                  indicatorColor: Colors.transparent,
                  tabs: [
                    Tab(
                      icon: Icon(MdiIcons.home, color: Colors.grey, size: 30,),
                    ),
                    Tab(
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (
                                      context) => const ConsultaPossiveisDiagnosticos()),
                            );
                          },
                          icon: Icon(MdiIcons.stethoscope,
                            color: Colors.grey, size: 30,
                          ),
                        ),
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
    );
  }
}
