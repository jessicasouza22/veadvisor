//1.1 e 1.3

import 'package:auto_size_text/auto_size_text.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vetadvisor/fluxodehistoricodepesquisadesejavel/homeHistoricoPesquisaDesejavel.dart';

import 'package:vetadvisor/fluxopesquisarapida/home.dart';

import 'package:vetadvisor/fluxoprontuariodigital/consultaPaciente.dart';
import 'package:vetadvisor/fluxoprontuariodigital/novaConsulta.dart';
import 'package:vetadvisor/inicio.dart';
import 'package:vetadvisor/minhaagenda/homeMinhaAgenda.dart';
import 'package:vetadvisor/prelogin/slideVideo.dart';
import 'package:vetadvisor/prelogin/slide_tile.dart';
import 'package:video_player/video_player.dart';
import 'package:vetadvisor/recursos/Constants.dart';
import 'package:rolling_switch/rolling_switch.dart';
import '../firebase_options.dart';
import '../recursos/dialogUtils.dart';

import 'package:vetadvisor/fluxoprontuariodigital/cadastreOPet.dart';

class MenuIniciar extends StatelessWidget {
  const MenuIniciar({super.key});

  @override
  Widget build(BuildContext context) {
    return const MenuIniciarPage();
  }
}

class MenuIniciarPage extends StatefulWidget {
  const MenuIniciarPage({Key? key}) : super(key: key);

  @override
  State<MenuIniciarPage> createState() => _MenuIniciarPageState();
}

class _MenuIniciarPageState extends State<MenuIniciarPage> {



  @override
  Widget build(BuildContext context) {

    return  Scaffold(

        body: CustomScrollView(slivers: [
          SliverAppBar(
              backgroundColor: Colors.transparent,
              toolbarHeight: 80,
              elevation: 30,
              pinned: true,
              expandedHeight: 50,
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
                        padding: const EdgeInsets.only(left: 0),
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
                                                context) => const ConsultaPaciente()),
                                      );

                                      //print("clicado na seta");
                                    }, icon: const Icon(Icons.arrow_back))),
                            AutoSizeText(
                              "Detalhe da pesquisa ",
                              //textAlign: TextAlign.center,
                            ),
                            IconButton(
                                onPressed: () {
                                  print("clicado no notificacao");
                                },
                                icon: Icon(MdiIcons.bellBadgeOutline)),
                          ],
                        )))
              ]),
          SliverFillRemaining(
              hasScrollBody: true,
              child: Container(
                color: Color(0xFFF5F5F5),
                child: SingleChildScrollView(
                    child: Column(children:
                    [
                      Padding(padding:EdgeInsets.all(20)),

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
                                  'Prontuario Paciente',
                                  style: TextStyle(color: Color(0xFF3C10BB)),
                                ),),
                            ),
                          ]),

                      Padding(padding:EdgeInsets.all(20)),

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
                                        const Home()),
                                  );
                                },
                                child: const Text(
                                  'Fluxo de Pesquisa Rapida',
                                  style: TextStyle(color: Color(0xFF3C10BB)),
                                ),),
                            ),
                          ]),

                      Padding(padding:EdgeInsets.all(20)),

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
                                        const HomeMinhaAgenda()),
                                  );
                                },
                                child: const Text(
                                  'Minha Agenda',
                                  style: TextStyle(color: Color(0xFF3C10BB)),
                                ),),
                            ),
                          ]),

                      Padding(padding:EdgeInsets.all(20)),

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
                                        const HomeHistoricoPesquisaDesejavel()),
                                  );
                                },
                                child: const Text(
                                  'Historico de Pesquisa Desejavel',
                                  style: TextStyle(color: Color(0xFF3C10BB)),
                                ),),
                            ),
                          ])




                    ])),
              )
          )]));
  }
}
