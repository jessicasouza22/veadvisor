// 1.4 Detalhe Da Pesquisa Realizar Nova Pesquisa

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

List<String> estados = [
  'Acre',
  'Alagoas',
  'Amapá',
  'Amazonas',
  'Bahia',
  'Ceará',
  'Distrito Federal',
  'Espírito Santo',
  'Goiás',
  'Maranhão',
  'Mato Grosso',
  'Mato Grosso do Sul',
  'Minas Gerais',
  'Pará',
  'Paraíba',
  'Paraná',
  'Pernambuco',
  'Piauí',
  'Rio de Janeiro',
  'Rio Grande do Norte',
  'Rio Grande do Sul',
  'Rondônia',
  'Roraima',
  'Santa Catarina',
  'São Paulo',
  'Sergipe',
  'Tocantins'
];

class HomeMinhaAgenda extends StatelessWidget {
  const HomeMinhaAgenda({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeMinhaAgendaPage();
  }
}

class HomeMinhaAgendaPage extends StatefulWidget {
  const HomeMinhaAgendaPage({Key? key}) : super(key: key);

  @override
  State<HomeMinhaAgendaPage> createState() => _HomeMinhaAgendaState();
}

class _HomeMinhaAgendaState extends State<HomeMinhaAgendaPage> {
  String _getCurrentDate() {
    var now = DateTime.now();
    var formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(now);
  }

  DateTime data = DateTime.now();

  String? selectedEstado;

  //String? torna a variiavel atrasada

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
                            "Minha agenda",
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
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(MdiIcons.calendarClockOutline,
                        size: 26, color: Color(0xFF3C10BB)),
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xFF12EC1A),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        "Hoje",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF3C10BB),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Text(
                      '${_getCurrentDate()}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF3C10BB),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 70)),
                    Icon(MdiIcons.chevronLeft,
                        size: 26, color: Color(0xFF3C10BB)),
                    Icon(MdiIcons.chevronRight,
                        size: 26, color: Color(0xFF3C10BB)),
                  ]),
              Padding(padding: EdgeInsets.all(10)),

               Row(children: [

                   DropdownButton<String>(
                    value: selectedEstado,
                    hint: const Text('Local'),
                    onChanged: (value) {
                      setState(() {
                        selectedEstado;
                      });
                    },
                    items: estados.map<DropdownMenuItem<String>>(
                      (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                  ),

                   DropdownButton<String>(
                   value: selectedEstado,
                   hint: const Text('Local'),
                   onChanged: (value) {
                     setState(() {
                       selectedEstado;
                     });
                   },
                   items: estados.map<DropdownMenuItem<String>>(
                         (String value) {
                       return DropdownMenuItem<String>(
                         value: value,
                         child: Text(value),
                       );
                     },
                   ).toList(),
                 ),

                   DropdownButton<String>(
                   value: selectedEstado,
                   hint: const Text('Local'),
                   onChanged: (value) {
                     setState(() {
                       selectedEstado;
                     });
                   },
                   items: estados.map<DropdownMenuItem<String>>(
                         (String value) {
                       return DropdownMenuItem<String>(
                         value: value,
                         child: Text(value),
                       );
                     },
                   ).toList(),
                 ),
                  // SizedBox(height: 16),
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
        ])));
  }
}
