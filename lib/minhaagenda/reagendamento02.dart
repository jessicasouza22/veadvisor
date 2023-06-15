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

class Reagendamento02 extends StatelessWidget {
  const Reagendamento02({super.key});

  @override
  Widget build(BuildContext context) {
    return const Reagendamento02Page();
  }
}

class Reagendamento02Page extends StatefulWidget {
  const Reagendamento02Page({Key? key}) : super(key: key);

  @override
  State<Reagendamento02Page> createState() => _Reagendamento02State();
}

class _Reagendamento02State extends State<Reagendamento02Page> {


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
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF12EC1A)
                    ),
                    child: Icon(
                      MdiIcons.circleOutline,
                      size: 18,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Text("Reagendar com outro especialista",
                    style: TextStyle(
                        color: Color(0xff4116B4),
                        fontSize: 16
                    ),)
                ],
              ),
            ),

            Padding(padding: EdgeInsets.all(10)),


            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 60,
                        width: 350,
                        child: TextFormField(
                          //para senha: obscureText: true,

                          textAlign: TextAlign.center,

                          style: const TextStyle(
                            fontSize: 12,
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none, // tira a borda do TextField
                              //  fillColor: const Color(0xFF12EC1A),

                              // contentPadding: EdgeInsets.fromLTRB(20, 0, 12, 0),
                              suffixIcon: Builder(
                                  builder: (context) => IconButton(
                                      onPressed: () {},
                                      icon: const
                                      Icon(
                                        Icons.search,
                                        size: 20,
                                        color: Color(0xFF979797),
                                      ))),
                              hintText: "Filtre por especialidade médica.\nEx: Clínico geral",

                            ),
                        ),
                      ),
                    ]),
              ]),
            ),


            Row(
              children: [
            Padding(padding: EdgeInsets.only(left: 20)),
            Builder(
              builder: (context) => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: Color(0xffDDE5E9)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const ProximaConsultaCall()),
                    );
                  },
                  child:
                  Row(
                    children: [

                  Icon(MdiIcons.filterVariantMinus,
                  color: Color(0xff000000)),

                      Padding(padding: EdgeInsets.only(left: 10)),

                  Text(
                    'Filtro',
                    style: TextStyle(color: Color(0xff000000)),
                  ),]),
            ),),]),


            Padding(padding: EdgeInsets.all(20)),

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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Dr. Laurenzo ",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),),
                          Icon(Icons.star,
                              size: 10,
                              color: Color(0xffFFC817)),

                          Text("7 avaliacoes",
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xFF82888A),

                              )),

                          Icon(MdiIcons.chevronRight,
                              size: 20,
                              color: Color(0xff979797)),



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

                            ),),
                          Icon(MdiIcons.mapMarkerOutline),
                          Text("3 km de você",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF82888A),

                            ),),








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


                        ],
                      ),

                      Padding(padding: EdgeInsets.all(2)),

                      SizedBox(
                        height: 15,
                        width: 120,
                        child:
                      Builder(
                        builder: (context) => ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                backgroundColor: Color(0xff12EC1A)),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const ProximaConsultaCall()),
                              );
                            },
                            child: const Text(
                              'Agendar consulta',
                              style: TextStyle(color: Color(0xff1A3D8E), fontSize: 10),
                            )),
                      ),),


                    ]),
              ],
            ),

            Container(
              margin: EdgeInsets.only(top: 5),
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white
                    ),
                    child: Icon(
                      MdiIcons.circleOutline,
                      size: 18,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Text("Reagendar com outro especialista",
                    style: TextStyle(
                        color: Color(0xff4116B4),
                        fontSize: 16
                    ),)
                ],
              ),
            ),

            Text("Qual procedimento você\nquer reagendar?",
                textAlign: TextAlign.center),

            Container(
              margin: EdgeInsets.only(top: 5),
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF12EC1A)
                    ),
                    child: Icon(
                      MdiIcons.circleOutline,
                      size: 14,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Text("Consultas",
                    style: TextStyle(
                        color: Color(0xff59616E),
                        fontSize: 16
                    ),)
                ],
              ),
            ),

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                  child: DropdownButton<String>(
                    value: selecioneMes,
                    underline: Container(
                      height: 0,
                      color: Colors.transparent,
                    ),
                    hint: const Text('Mes',
                      style: TextStyle(
                        color: Color(0xff4116B4),
                      ),),
                    onChanged: (value) {
                      setState(() {
                        selecioneMes;
                      });
                    },
                    icon: Icon(
                      Icons.arrow_drop_down, // Ícone padrão da seta para baixo
                      color: Color(0xff4116B4), // Cor personalizada da seta
                    ),
                    items: meses.map<DropdownMenuItem<String>>(
                          (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                  )),

              Expanded(
                  child: DropdownButton<String>(
                    value: selecioneMes,
                    underline: Container(
                      height: 0,
                      color: Colors.transparent,
                    ),
                    hint: const Text('Mes',
                      style: TextStyle(
                        color: Color(0xff4116B4),
                      ),),
                    onChanged: (value) {
                      setState(() {
                        selecioneMes;
                      });
                    },
                    icon: Icon(
                      Icons.arrow_drop_down, // Ícone padrão da seta para baixo
                      color: Color(0xff4116B4), // Cor personalizada da seta
                    ),
                    items: meses.map<DropdownMenuItem<String>>(
                          (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                  )),

              Padding(padding: EdgeInsets.all(5)),
              // SizedBox(height: 16),
            ]),

            Padding(padding: EdgeInsets.all(20)),


            const Divider(
              color: Color(0xFF979797),
              thickness: 0.8,
              endIndent: 0,
              indent: 0,
            ),

            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Período manha",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF4116B4)
                    ),),]),

            Padding(padding: EdgeInsets.all(5)),

            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Container(
                    height: 50,
                    width: 90,
                    padding: EdgeInsets.only(left: 12, top: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3), // Define a posição da sombra em relação ao container
                        ),
                      ],
                    ),
                    child: Text("10:10 am",
                      style: TextStyle(
                        color: Color(0xFF4116B4),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Container(
                    height: 50,
                    width: 90,
                    padding: EdgeInsets.only(left: 12, top: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3), // Define a posição da sombra em relação ao container
                        ),
                      ],
                    ),
                    child: Text("10:10 am",
                      style: TextStyle(
                        color: Color(0xFF4116B4),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Container(
                    height: 50,
                    width: 90,
                    padding: EdgeInsets.only(left: 12, top: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3), // Define a posição da sombra em relação ao container
                        ),
                      ],
                    ),
                    child: Text("10:10 am",
                      style: TextStyle(
                        color: Color(0xFF4116B4),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ]),

            const Divider(
              color: Color(0xFF979797),
              thickness: 0.8,
              endIndent: 0,
              indent: 0,
            ),

            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Período da tarde",
                    style: TextStyle(
                        fontSize: 20,

                        color: Color(0xFF4116B4)
                    ),),]),

            Padding(padding: EdgeInsets.all(5)),

            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Container(
                    height: 50,
                    width: 90,
                    padding: EdgeInsets.only(left: 12, top: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3), // Define a posição da sombra em relação ao container
                        ),
                      ],
                    ),
                    child: Text("10:10 am",
                      style: TextStyle(
                        color: Color(0xFF4116B4),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Container(
                    height: 50,
                    width: 90,
                    padding: EdgeInsets.only(left: 12, top: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3), // Define a posição da sombra em relação ao container
                        ),
                      ],
                    ),
                    child: Text("10:10 am",
                      style: TextStyle(
                        color: Color(0xFF4116B4),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Container(
                    height: 50,
                    width: 90,
                    padding: EdgeInsets.only(left: 12, top: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3), // Define a posição da sombra em relação ao container
                        ),
                      ],
                    ),
                    child: Text("10:10 am",
                      style: TextStyle(
                        color: Color(0xFF4116B4),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ]),

            Padding(padding: EdgeInsets.all(5)),

            const Divider(
              color: Color(0xFF979797),
              thickness: 0.8,
              endIndent: 0,
              indent: 0,
            ),

            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Período noturno",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF4116B4)
                    ),),]),

            Padding(padding: EdgeInsets.all(5)),

            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Container(
                    height: 50,
                    width: 90,
                    padding: EdgeInsets.only(left: 12, top: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3), // Define a posição da sombra em relação ao container
                        ),
                      ],
                    ),
                    child: Text("10:10 am",
                      style: TextStyle(
                        color: Color(0xFF4116B4),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Container(
                    height: 50,
                    width: 90,
                    padding: EdgeInsets.only(left: 12, top: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3), // Define a posição da sombra em relação ao container
                        ),
                      ],
                    ),
                    child: Text("10:10 am",
                      style: TextStyle(
                        color: Color(0xFF4116B4),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Container(
                    height: 50,
                    width: 90,
                    padding: EdgeInsets.only(left: 12, top: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3), // Define a posição da sombra em relação ao container
                        ),
                      ],
                    ),
                    child: Text("10:10 am",
                      style: TextStyle(
                        color: Color(0xFF4116B4),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ]),

            Padding(padding: EdgeInsets.all(5)),

            Builder(
              builder: (context) => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: Color(0xff12EC1A)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const ProximaConsultaCall()),
                    );
                  },
                  child: const Text(
                    'Iniciar Conversa',
                    style: TextStyle(color: Color(0xff1A3D8E)),
                  )),
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



}

