//1.7 Proxima Consulta Call


import 'package:intl/intl.dart';
import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:vetadvisor/fluxopesquisarapida/detalheDaPesquisaDermatiteAtopica.dart';
import 'package:vetadvisor/fluxoprontuariodigital/cadastreOPet.dart';
import 'package:vetadvisor/fluxoprontuariodigital/perfilPaciente.dart';
import 'package:vetadvisor/inicio.dart';
import 'package:vetadvisor/minhaagenda/reagendamento.dart';
import 'package:vetadvisor/recursos/Constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'atendimento.dart';


class ProximaConsultaCall extends StatelessWidget {
  const ProximaConsultaCall({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProximaConsultaCallPage();
  }
}

class ProximaConsultaCallPage extends StatefulWidget {
  const ProximaConsultaCallPage({Key? key}) : super(key: key);

  @override
  State<ProximaConsultaCallPage> createState() => _ProximaConsultaCallState();
}

class _ProximaConsultaCallState extends State<ProximaConsultaCallPage> {


  String _nomeUsuarioLogado = "";


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
        body:

        Container(
        decoration: const BoxDecoration(
        image: DecorationImage(
        image: AssetImage('imagens/homeGeral.png'),
        fit: BoxFit.fitWidth,
        //colorFilter: new ColorFilter.mode(Cores.azulSafe.withOpacity(1), BlendMode.dstATop))
                             ),
                             ),
        child: SingleChildScrollView(
        child: Column(children: [

          Padding(padding: EdgeInsets.all(20)),


          Text("Incoming Call...",
          style: TextStyle(
            color: Colors.white,
            fontSize: 10
          ),),

          Padding(padding: EdgeInsets.all(50)),

          Container(

              margin: EdgeInsets.only(left: 150, right: 150),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Color(0xFFD8E0E3),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                  child:
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.pink,

                    child: ClipOval(

                      child:
                      Image.asset("imagens/uhtred.jpeg"),

                    ),
                  ))),

          Text(
            "$_nomeUsuarioLogado\n\n$_nomeUsuarioLogado Joao",
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),



          Padding(padding: EdgeInsets.all(20)),


          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(left: 50,right: 50),
              decoration: BoxDecoration(
              color: Colors.transparent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(30),
              ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Container(
                    padding: EdgeInsets.all(15),
                    // margin:  EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xFFEE9393),),
                    child:
                    Icon(MdiIcons.phoneHangup,
                    color: Colors.white,
                    size: 30,
                    ),),

                Padding(padding: EdgeInsets.only(left: 10)),

                Container(
                  padding: EdgeInsets.all(15),
                  // margin:  EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xFF34A853),),
                  child:
                  Icon(MdiIcons.phone,
                    color: Colors.white,
                    size: 30,
                  ),),

                Padding(padding: EdgeInsets.only(left: 10)),

                Container(
                  padding: EdgeInsets.all(15),
                  // margin:  EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white),
                  child:

                  Builder(
                    builder: (context) => IconButton(
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: Colors.green),
                        onPressed: () {

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const Reagendamento()),
                          );
                          print("Foi");
                        },
                        icon:  Icon(MdiIcons.messageReplyTextOutline,
                          color: Color(0xff4116B4),
                          size: 30,
                        ),)),
                  ),



              ],
            ),
          ),







          Padding(padding: EdgeInsets.all(20)),



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
    ));
  }
}

