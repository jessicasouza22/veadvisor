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

List<String> agendadas = ['hoje', 'amanha'];

List<String> situacao = ['atual', 'atrasada', 'agendada'];

List<String> config = ['alterar', 'excluir'];

List<int> daysOfMonth = List<int>.generate(30, (index) => index + 1);
int visibleDays = 6;

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
  String _getCurrentDate() {
    var now = DateTime.now();
    var formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(now);
  }

  DateTime data = DateTime.now();

  String? selectedEstado;
  String? selectedAgendadas;
  String? selectedSituacao;
  String? selectedConfig;
  bool programada = false;

  //String? torna a variiavel atrasada
  void initState() {
    super.initState();
    mostrarAlerta();
    print("oi");
  }

  void mostrarAlerta() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context)
        {
          return Container(
              padding: EdgeInsets.only(left: 10, top: 10),
              margin: EdgeInsets.only(left: 30, right: 30, top: 200,bottom: 300),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      Icon(
                        MdiIcons.close,
                        color: Color(0xff59616E),
                        size: 20,
                      ),
                      Icon(
                        MdiIcons.close,
                        color: Colors.transparent,
                        size: 20,
                      )

                    ]),
                //  Text('Atenção'),

                Column(
                  children: [
                    Icon(
                      MdiIcons.alertCircleOutline,
                      size: 40,
                      color: Colors.pink,
                    ),
                    Padding(padding: EdgeInsets.only(left: 11,top: 5)),
                    Align(
                        alignment: Alignment.center,
                        child:
                        Text("Agora com sua agenda inteligente você pode enviar\nenviar mensagem via whatsApp, ligar para o cliente\nou ainda reagendar caso alguem cancele ou tenha\nhorário de atendimento disponível.",
                          style: TextStyle(color: Color(0xff59616E), fontSize: 10, decoration: TextDecoration.none),
                        )),

                    Padding(padding: EdgeInsets.all(10)),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Container(
                            padding: EdgeInsets.all(12),
                            margin:  EdgeInsets.only(left: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: const Color(0xff7DC168),),
                            child:
                            Icon(MdiIcons.whatsapp,
                              size: 30,
                              color: Colors.white,
                            )),

                        Container(
                            padding: const EdgeInsets.all(12),
                            //  margin: const EdgeInsets.only(top: 10),decoration: BoxDecoration(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: const Color(0xFF3C10BB),),
                            child:
                            Icon(MdiIcons.phone,
                              size: 30,
                              color: Colors.white,
                            )),

                        Container(
                            padding: const EdgeInsets.all(12),
                            margin:  EdgeInsets.only(right: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: const Color(0xFF3C10BB),),
                            child:
                            Icon(MdiIcons.calendarMonthOutline,
                              size: 30,
                              color: Colors.white,
                            )),
                      ],
                    ),

                    Padding(padding: EdgeInsets.all(5)),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Container(
                              padding: EdgeInsets.all(5),
                              margin:  EdgeInsets.only(left: 25),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xFF3C10BB),),
                              child:
                              Align(
                                alignment: Alignment.center,
                                child:Text(
                                    "WhatsApp",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        decoration: TextDecoration.none
                                    )),
                              )),

                          Container(
                              padding: EdgeInsets.all(5),
                              // margin:  EdgeInsets.only(left: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xFF3C10BB),),
                              child:
                              Center(
                                child:Text(
                                    "Ligar",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        decoration: TextDecoration.none
                                    )),
                              )),

                          Container(
                              padding: EdgeInsets.all(5),
                              margin:  EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xFF3C10BB),),
                              child:
                              Center(
                                child:Text(
                                    "Reagendar",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        decoration: TextDecoration.none
                                    )),
                              )),
                        ]),





                  ],
                ),

              ]));
        },
      );
    });
  }

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

                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Expanded(
                        child: DropdownButton<String>(
                          value: selectedEstado,
                          underline: Container(
                            height: 0,
                            color: Colors.transparent,
                          ),
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
                        )),

                    Padding(padding: EdgeInsets.all(5)),

                    Expanded(
                        child: DropdownButton<String>(
                          value: selectedAgendadas,
                          underline: Container(
                            height: 0,
                            color: Colors.transparent,
                          ),
                          hint: const Text('Agendadas'),
                          onChanged: (value) {
                            setState(() {
                              selectedAgendadas;
                            });
                          },
                          items: agendadas.map<DropdownMenuItem<String>>(
                                (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            },
                          ).toList(),
                        )),

                    Padding(padding: EdgeInsets.all(5)),

                    Expanded(
                        child: DropdownButton<String>(
                          value: selectedSituacao,
                          underline: Container(
                            height: 0,
                            color: Colors.transparent,
                          ),
                          hint: const Text('Situacao'),
                          onChanged: (value) {
                            setState(() {
                              selectedSituacao;
                            });
                          },
                          items: agendadas.map<DropdownMenuItem<String>>(
                                (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            },
                          ).toList(),
                        )),

                    Padding(padding: EdgeInsets.all(5)),

                    Expanded(
                        child: DropdownButton<String>(
                          value: selectedConfig,
                          underline: Container(
                            height: 0,
                            color: Colors.transparent,
                          ),
                          hint: const Icon(MdiIcons.cog),
                          onChanged: (value) {
                            setState(() {
                              selectedConfig;
                            });
                          },
                          items: config.map<DropdownMenuItem<String>>(
                                (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            },
                          ).toList(),
                          icon: Icon(null),
                        )),

                    Padding(padding: EdgeInsets.all(5)),

                    // SizedBox(height: 16),
                  ]),

                  Padding(padding: EdgeInsets.all(10)),

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
                    children: [
                      Text("Status desta consulta:"),
                      Switch(
                        value: programada,
                        onChanged: (bool newValue) {
                          setState(() {
                            programada = newValue;
                          });
                        },
                        activeColor: Colors.green,
                        inactiveThumbColor: Colors.grey,
                      )

                    ],
                  ),


                  CarouselSlider(
                    items: List.generate(30, (index) {
                      return Container(
                        width: 40,
                        //height: 10,
                        decoration: BoxDecoration(
                            color: Color(0xFF3C10BB),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(padding: EdgeInsets.all(2)),
                                Text(
                                    (index + 1).toString(),
                                    style: TextStyle(fontSize: 14, color: Colors.white)),

                                Icon(MdiIcons.slashForward, size: 26,color: Colors.white),

                                Text("Terca", style: TextStyle(fontSize: 8, color: Colors.white)),

                                Padding(padding: EdgeInsets.all(2))

                              ]),
                        ),
                      );
                    }),
                    options: CarouselOptions(
                      aspectRatio: 4.0,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      initialPage: 0,
                      viewportFraction: 5/30,
                      //itemCount: 30,
                    ),
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(MdiIcons.circle,
                        color: Color(0xFF4116B4),
                        size: 12,
                      ),

                      Text(" Agendado",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF4116B4)
                        ),),

                      Padding(padding: EdgeInsets.only(left: 20)),

                      Icon(MdiIcons.circle,
                        color: Color(0xFFEC1212),
                        size: 12,
                      ),

                      Text(" Cancelado",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF4116B4)
                        ),),

                      Padding(padding: EdgeInsets.only(left: 20)),

                      Icon(MdiIcons.circle,
                        color: Color(0xFF12EC1A),
                        size: 12,
                      ),

                      Text(" Concluidas",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF4116B4)
                        ),),


                    ],
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
            ])));
  }
}
