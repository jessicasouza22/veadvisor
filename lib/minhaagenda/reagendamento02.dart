//1.8 Reagendamento
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

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
import 'package:vetadvisor/minhaagenda/resumoDoReagendamento.dart';
import 'package:vetadvisor/recursos/Constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../fluxoprontuariodigital/novaConsulta.dart';
import 'atendimento.dart';

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

List<String> periodo = ['Matutino', 'Vespertino', 'Noturno'];

List<String> status = ['Ativo', 'Inativo'];

List<String> situacao = ['Agendada', 'Cancelada', 'Realizou', 'Faltou'];

List<String> local = ['Vitally', 'CliniCor', 'Life'];

List<String> config = ['alterar', 'excluir'];
final meses = [
  'Janeiro',
  'Fevereiro',
  'Marco',
  'Abril',
  'Maio',
  'Junho',
  'Julho',
  'Agosto',
  'Setembro',
  'Outubro',
  'Novembro',
  'Dezembro'
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

  ScrollController _scrollController = ScrollController();
  String _nomeUsuarioLogado = "";
  String? selecioneMes;
  String? selecioneStatus;
  String? selectedConfig;
  bool programada = false;
  String? selecionePeriodo;
  String? selecioneLocal;
  String? selecioneSituacao;


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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Dr. Laurenzo ",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),),

                          Padding(padding: EdgeInsets.only(left: 85)),
                          Icon(Icons.star,
                              size: 10,
                              color: Color(0xffFFC817)),

                          Text("7 avaliacoes",
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xFF82888A),

                              )),

                          Icon(MdiIcons.chevronRight,
                              size: 30,
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Dr. Laurenzo ",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),),

                          Padding(padding: EdgeInsets.only(left: 85)),
                          Icon(Icons.star,
                              size: 10,
                              color: Color(0xffFFC817)),

                          Text("7 avaliacoes",
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xFF82888A),

                              )),

                          Icon(MdiIcons.chevronRight,
                              size: 30,
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Dr. Laurenzo ",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),),

                          Padding(padding: EdgeInsets.only(left: 85)),
                          Icon(Icons.star,
                              size: 10,
                              color: Color(0xffFFC817)),

                          Text("7 avaliacoes",
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xFF82888A),

                              )),

                          Icon(MdiIcons.chevronRight,
                              size: 30,
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Dr. Laurenzo ",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),),

                          Padding(padding: EdgeInsets.only(left: 85)),
                          Icon(Icons.star,
                              size: 10,
                              color: Color(0xffFFC817)),

                          Text("7 avaliacoes",
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xFF82888A),

                              )),

                          Icon(MdiIcons.chevronRight,
                              size: 30,
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

            Padding(padding: EdgeInsets.all(10)),

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
              DropdownButton<String>(
                borderRadius: BorderRadius.circular(10),
                value: selecioneMes,
                underline: Container(
                  height: 0,
                  color: Colors.transparent,
                ),
                hint:
                Row(
                    children: [

                      Text('Junho',
                        style: TextStyle(
                            color: Color(0xff4116B4),
                            fontWeight: FontWeight.bold
                        ),),
                      Container(
                        //padding: EdgeInsets.only(1),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xff12EC1A)
                        ),
                        child: Icon(
                          MdiIcons.check,
                          color: Colors.white,
                          size: 2,
                        ) ,
                      )

                    ]),


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
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children:[
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: [

                                  Text(value,
                                    style: TextStyle(
                                        color: Color(0xffBFC9CA),
                                        fontSize: 12


                                    ),),

                                  Padding(padding: EdgeInsets.only(left: 10)),

                                  Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Color(0xff12EC1A)
                                      ),
                                      child: Icon(MdiIcons.check,
                                        size: 12,
                                        color: Colors.white,)
                                  )


                                ]),


                            Divider(

                              color: Color(0xff979797),
                              thickness: 0.6,
                              endIndent: 0,
                              indent: 0,

                            )

                          ]),
                    );
                  },
                ).toList(),
              ),

              DropdownButton<String>(
                borderRadius: BorderRadius.circular(10),
                value: selecionePeriodo,
                underline: Container(
                  height: 0,
                  color: Colors.transparent,
                ),
                hint: const Text('Periodo',
                  style: TextStyle(
                    color: Color(0xff4116B4),
                    fontWeight: FontWeight.bold,
                  ),),
                onChanged: (value) {
                  setState(() {
                    selecionePeriodo;
                  });
                },
                icon: Icon(
                  Icons.arrow_drop_down, // Ícone padrão da seta para baixo
                  color: Color(0xff4116B4), // Cor personalizada da seta
                ),
                items: periodo.map<DropdownMenuItem<String>>(
                      (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children:[
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: [

                                  Text(value,
                                    style: TextStyle(
                                        color: Color(0xffBFC9CA),
                                        fontSize: 12


                                    ),),

                                  Padding(padding: EdgeInsets.only(left: 10)),

                                  Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Color(0xff12EC1A)
                                      ),
                                      child: Icon(MdiIcons.check,
                                        size: 12,
                                        color: Colors.white,)
                                  )


                                ]),


                            Divider(

                              color: Color(0xff979797),
                              thickness: 0.6,
                              endIndent: 0,
                              indent: 0,

                            )

                          ]),
                    );
                  },
                ).toList(),
              ),

              Padding(padding: EdgeInsets.all(5)),
              // SizedBox(height: 16),
            ]),


            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        _scrollController.animateTo(
                          _scrollController.offset - 100,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                      icon: Icon(MdiIcons.chevronLeft,
                          color: Color(0xFF3C10BB)),
                    ),
                    IconButton(
                      onPressed: () {
                        _scrollController.animateTo(
                          _scrollController.offset + 100,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                      icon: Icon(MdiIcons.chevronRight,
                          color: Color(0xFF3C10BB)),
                    ),
                  ],
                ),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: _scrollController,
                  child: Row(
                    children:
                    List.generate(
                      30,
                          (index) => Container(
                        width: 46,
                        height: 65,
                        margin: EdgeInsets.all(4),
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Color(0xFF3C10BB),
                            boxShadow: [BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            )]
                        ),
                        child: Column(

                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("12",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),)
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Transform.rotate(
                                    angle: 30 * (3.1415926535897932 / 180), // Converter 10 graus para radianos
                                    child:
                                    Icon(MdiIcons.slashForward,
                                      size: 20,
                                      color: Colors.white,
                                    )),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Seg",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),

                  ),
                ),
              ],
            ),

            const Divider(
              color: Color(0xFF979797),
              thickness: 0.8,
              endIndent: 0,
              indent: 0,
            ),



            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Período da manhã",
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
                      color: Color(0xFF4116B4),
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
                        color: Colors.white,
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
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),

                    ),
                    child: Text("10:10 am",
                      style: TextStyle(
                        color: Colors.transparent,
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
                    _showAlertDialog(context);
                  },
                  child: const Text(
                    'Reaendar',
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



  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        // title: const Text('Atenção'),
        content:
          Column(children: [

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
                              const ResumoDoAgendamento()),
                        );
                      },
                      child: const Text(
                        'Veja o resumo da consulta',
                        style: TextStyle(color: Color(0xFF3C10BB)),
                      ),),
                  ),
                ]),
            //  Text('Atenção'),



          ]),
        actions: <CupertinoDialogAction>[

        ],
      ),
    );
  }

}

