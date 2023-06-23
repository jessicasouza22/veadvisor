// 1.0 e 1.2 homeMinhaAgenda

import 'package:intl/intl.dart';
import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:vetadvisor/fluxopesquisarapida/detalheDaPesquisaDermatiteAtopica.dart';
import 'package:vetadvisor/fluxoprontuariodigital/cadastreOPet.dart';
import 'package:vetadvisor/fluxoprontuariodigital/perfilPaciente.dart';
import 'package:vetadvisor/inicio.dart';
import 'package:vetadvisor/minhaagenda/proximaConsulta.dart';
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

List<String> periodo = ['Matutino', 'Vespertino', 'Noturno'];

List<String> agendadas = ['hoje', 'amanha'];

List<String> situacao = ['atual', 'atrasada', 'agendada'];

List<String> local = ['Vitally', 'CliniCor', 'Life'];

List<String> config = ['alterar', 'excluir'];

List<int> daysOfMonth = List<int>.generate(30, (index) => index + 1);
int visibleDays = 6;

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
  String? selectedAgendadas;
  String? selectedSituacao;
  String? selectedConfig;
  bool programada = false;
  String? selecioneMes;
  String? selecionePeriodo;
  String? selecioneLocal;

  ScrollController _scrollController = ScrollController();

  //String? torna a variiavel atrasada
  void initState() {
    super.initState();
    mostrarAlerta();
    print("oi");
  }

  void dispose() {
    _scrollController.dispose();
    super.dispose();
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

                    Center(
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
                Container(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: Colors.white,
                      border: Border.all(
                        color: Color(0xffDFE1E6),  // Defina a cor desejada aqui
                        width: 2.0,  // Defina a largura da borda
                      )

                  ),
                child: DropdownButton<String>(
                      borderRadius: BorderRadius.circular(10),


                  value: selecioneLocal,
                  underline: Container(
                    height: 0,
                    color: Colors.transparent,
                  ),
                  hint: Text('Local',
                  style: TextStyle(
                    color: Color(0xff253858),
                      fontSize: 12

                  ),),

                  onChanged: (value) {
                    setState(() {
                      selecioneLocal;
                    });
                  },
                  items:
                  local.map<DropdownMenuItem<String>>(

                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child:
                        Column(
                            children:[
                              Row(
                                  children: [
                                    Text(value,
                                      style: TextStyle(
                                        color: Color(0xffBFC9CA),
                                        fontSize: 12


                                      ),),]),
                                    Row(
                                        children:[
                                          Divider(
                                            color: Colors.cyan,
                                            thickness: 0.8,
                                            endIndent: 0,
                                            indent: 0,
                                          )
                                        ]
                                    )

                                  ]),

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
                  hint:  Text('Agendadas',
                      style: TextStyle(
                        color: Color(0xff253858),
                          fontSize: 12

                      )),
                  onChanged: (value) {
                    setState(() {
                      selectedAgendadas;
                    });
                  },
                  items: agendadas.map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child:
                        Column(
                            children:[
                              Row(
                                  children: [
                                    Text(value,
                                      style: TextStyle(
                                          color: Color(0xffBFC9CA),
                                          fontSize: 12


                                      ),),]),
                              Row(
                                  children:[
                                    Divider(
                                      color: Colors.cyan,
                                      thickness: 0.8,
                                      endIndent: 0,
                                      indent: 0,
                                    )
                                  ]
                              )

                            ]),
                      );
                    },
                  ).toList(),
                )),

                Padding(padding: EdgeInsets.all(6)),

                Expanded(
                    child: DropdownButton<String>(
                  value: selectedSituacao,
                  underline: Container(
                    height: 0,
                    color: Colors.transparent,
                  ),
                  hint: const Text('Situacao',
                      style: TextStyle(
                          color: Color(0xff253858),
                          fontSize: 12

                      )),
                  onChanged: (value) {
                    setState(() {
                      selectedSituacao;
                    });
                  },
                  items: agendadas.map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Column(
                            children:[
                              Row(
                                  children: [
                                    Text(value,
                                      style: TextStyle(
                                          color: Color(0xffBFC9CA),
                                          fontSize: 12


                                      ),),]),
                              Row(
                                  children:[
                                    Divider(
                                      color: Colors.cyan,
                                      thickness: 0.8,
                                      endIndent: 0,
                                      indent: 0,
                                    )
                                  ]
                              )

                            ]),
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

                    Builder(
                      builder: (context) => ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProximaConsulta()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              backgroundColor: Colors.white),
                          child: const Text("Ver todas",
                            style: TextStyle(
                              color: Color(0xFF8F90A6),
                              fontSize: 12,
                            ),),
                          ))]),



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
                  Padding(padding: EdgeInsets.only(left: 55)),
                  Text("Programada"),
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

              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Expanded(
                    child: DropdownButton<String>(
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
                            child: Text(value),
                          );
                        },
                      ).toList(),
                    )),

                Expanded(
                    child: DropdownButton<String>(
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
                            child: Text(value),
                          );
                        },
                      ).toList(),
                    )),

                Padding(padding: EdgeInsets.all(5)),
                // SizedBox(height: 16),
              ]),


              /*CarouselSlider(
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
              ),*/

              /*Liew(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                      width: 10,
                      //height: 10,
                      decoration: BoxDecoration(
                          color: Color(0xFF3C10BB),
                          borderRadius: BorderRadius.circular(20)
                      ),
                  child: Text("oi")),
                ],
              ),*/

                 /* Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_upward),
                        onPressed: scrollToTop,
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_downward),
                        onPressed: scrollToBottom,
                      ),
                    ],
                  ),*/

        

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

  void scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
