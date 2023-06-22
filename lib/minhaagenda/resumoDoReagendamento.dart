
//1.8 Reagendamento


import 'package:intl/intl.dart';
import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:vetadvisor/fluxopesquisarapida/detalheDaPesquisaDermatiteAtopica.dart';
import 'package:vetadvisor/fluxoprontuariodigital/cadastreOPet.dart';
import 'package:vetadvisor/fluxoprontuariodigital/perfilPaciente.dart';
import 'package:vetadvisor/inicio.dart';
import 'package:vetadvisor/minhaagenda/proximaConsultaCall.dart';
import 'package:vetadvisor/recursos/Constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vetadvisor/recursos/menuIniciar.dart';

import '../fluxoprontuariodigital/novaConsulta.dart';
import 'atendimento.dart';

List<String> meses = [
  'Janeiro',
  'Fevereiro',
  'Março',
  'Abril',
  'Maio',
  'Junho',
  'Julho',
  'Agosto',
  'Setembro',
  'Outubro',
  'Novembro',
  'Dezembro',
];

class ResumoDoAgendamento extends StatelessWidget {
  const ResumoDoAgendamento({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResumoDoAgendamentoPage();
  }
}

class ResumoDoAgendamentoPage extends StatefulWidget {
  const ResumoDoAgendamentoPage({Key? key}) : super(key: key);

  @override
  State<ResumoDoAgendamentoPage> createState() => _ResumoDoAgendamentoState();
}

class _ResumoDoAgendamentoState extends State<ResumoDoAgendamentoPage> {


  String _nomeUsuarioLogado = "";
  String? selecioneMes;

  DateTime _selectedDate = DateTime.now();

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
                            "Reagendamento",
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
              margin: EdgeInsets.only(top: 5),
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Padding(padding: EdgeInsets.only(left: 10)),
                  Text("Resumo do reagendamento",
                    style: TextStyle(
                        color: Color(0xff4116B4),
                        fontSize: 16
                    ),)
                ],
              ),
            ),

            Padding(padding: EdgeInsets.all(10)),

            Row(


              children: [
                Column(
                    children: [

                      Container(

                          margin: EdgeInsets.only(left: 20),
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: Color(0xff4116B4),  // Cor rosa para a borda
                              width: 2,  // Espessura da borda
                            ),
                          ),
                          child: Center(
                              child:
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.transparent,

                                child: ClipOval(

                                  child:
                                  Image.asset("imagens/rask.jpeg"),

                                ),
                              ))),

                    ]),
                Padding(padding: EdgeInsets.only(left: 10)),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Dr. Laurenzo ",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),)
                        ],
                      ),

                      Padding(padding: EdgeInsets.all(2)),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Clínico Geral - CRM 00532 ",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF82888A),

                            ),)
                        ],
                      ),

                      Padding(padding: EdgeInsets.all(2)),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Text("150,00 da consulta",
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xFF82888A),

                            ),),

                          Icon(Icons.star,
                              size: 10,
                              color: Color(0xffFFC817)),


                          Text("(5.0)",
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xFF82888A),

                            ),),




                        ],
                      ),
                    ]),
              ],
            ),

            Padding(padding: EdgeInsets.all(10)),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(MdiIcons.calendarClockOutline),

                Text("04 de fevereiro 2023",
                style: TextStyle(
                  fontSize: 16               ),)
              ],
            ),

            Padding(padding: EdgeInsets.all(10)),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(MdiIcons.clockTimeFiveOutline),

                Text("08:30h",
                  style: TextStyle(
                      fontSize: 16               ),)
              ],
            ),

            Padding(padding: EdgeInsets.all(10)),

            Container(
              margin: EdgeInsets.only(top: 5),
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Padding(padding: EdgeInsets.only(left: 10)),
                  Text("Anote aí o endereço de nossa clínica:",
                    style: TextStyle(
                        color: Color(0xff4116B4),
                        fontSize: 14
                    ),)
                ],
              ),
            ),

            Padding(padding: EdgeInsets.all(10)),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(MdiIcons.mapMarkerOutline),

                Text("116 Bold Street, Liverpool, L1 4JA",
                  style: TextStyle(
                      fontSize: 16               ),)
              ],
            ),

            Padding(padding: EdgeInsets.all(20)),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(MdiIcons.messageTextFastOutline),

                Text("Fale diretamente com o médico veterinário\nda sua família",
                  style: TextStyle(
                      fontSize: 16               ),)
              ],
            ),

            Padding(padding: EdgeInsets.all(20)),

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
                              const MenuIniciar()),
                        );
                      },
                      child: const Text(
                        'Sair',
                        style: TextStyle(color: Color(0xFF3C10BB)),
                      ),),
                  ),
                ]),

















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
    );
  }

  int _getDaysInMonth(int year, int month) {
    if (month == 12) {
      return 31;
    } else {
      return DateTime(year, month + 1, 0).day;
    }
  }

  void mostrarAlerta() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context)
        {
          return Container(
            // padding: EdgeInsets.only(left: 10, top: 10),
              margin: EdgeInsets.only(left: 30, right: 30, top: 200,bottom: 300),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(children: [

                Padding(padding: EdgeInsets.all(10)),

                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      SizedBox(
                          height: 70,
                          width: 70,
                          child:
                          Image.asset("imagens/starreagendamento02.png")
                      ),

                    ]),
                Padding(padding: EdgeInsets.all(7)),

                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          padding: EdgeInsets.all(12),
                          // margin:  EdgeInsets.only(left: 30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: const Color(0xff7DC168),),
                          child:
                          Icon(MdiIcons.check,
                            size: 30,
                            color: Colors.white,
                          )),

                    ]),

                Padding(padding: EdgeInsets.all(7)),

                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Sua consulta foi\nreagendada com sucesso",
                        style: TextStyle(
                          color: Color(0xff4116B4),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          //textAlign: TextAlign.center,

                        ),)

                    ]),

                Padding(padding: EdgeInsets.all(7)),

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
                                  const NovaConsulta()),
                            );
                          },
                          child: const Text(
                            'Veja o resumo da consulta',
                            style: TextStyle(color: Color(0xFF3C10BB)),
                          ),),
                      ),
                    ]),
                //  Text('Atenção'),



              ]));
        },
      );
    });
  }

}

