//1.7 HOME HISTORICO PESQUISA DESEJAVEL
import 'package:auto_size_text/auto_size_text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vetadvisor/fluxodehistoricodepesquisadesejavel/historicoDePesquisaDesejavel01.dart';
import 'package:vetadvisor/fluxodehistoricodepesquisadesejavel/homeHistoricoPesquisaDesejavel.dart';
import 'package:vetadvisor/fluxopesquisarapida/detalheDaPesquisa.dart';
import 'package:vetadvisor/fluxopesquisarapida/servicos.dart';
import 'package:vetadvisor/fluxoprontuariodigital/consultaPaciente.dart';
import 'package:vetadvisor/fluxoprontuariodigital/perfilPaciente.dart';
import 'package:vetadvisor/prelogin/logado.dart';

import '../fluxopesquisarapida/home.dart';

enum SingingCharacterAreaMedica {
  Oftalmicos,
  Infecciosos,
  Dermatologicos,
  MusculoEsqueletico,
  Neurologicos,
  MetabolicosEndocrinos,
  Oncologicos,
  Cardiologicos,
  NefrologicosUrologicos,
  Hematologicos,
  Respiratorios,
  Odontologicos,
  Toxocologicos,
  Teriogenologicos
}

class HistoricoDePesquisaDesejavel extends StatelessWidget {
  const HistoricoDePesquisaDesejavel({super.key});

  @override
  Widget build(BuildContext context) {
    return const HistoricoDePesquisaDesejavelPage();
  }
}

class HistoricoDePesquisaDesejavelPage extends StatefulWidget {
  const HistoricoDePesquisaDesejavelPage({Key? key}) : super(key: key);

  @override
  State<HistoricoDePesquisaDesejavelPage> createState() =>
      _HistoricoDePesquisaDesejavelState();
}

class _HistoricoDePesquisaDesejavelState
    extends State<HistoricoDePesquisaDesejavelPage> {
  final _formKey = GlobalKey<FormState>();
  final _nome = TextEditingController();
  final _repeticoes = TextEditingController();
  final _sequencia = TextEditingController();
  final _series = TextEditingController();
  final _treino = TextEditingController();
  final _descanso = TextEditingController();
  final _grupo = TextEditingController();
  final _video = TextEditingController();
  final _capa = TextEditingController();
  final _observacoes = TextEditingController();

  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // Chame o método para exibir o AlertDialog aqui
      _showAlertDialog(context);
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
                            "Ver histórico de pesquisa",
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
        body: CustomScrollView(slivers: [
          SliverFillRemaining(
              hasScrollBody: true,
              child: Container(
                color: Colors.white,
                child: SingleChildScrollView(
                    child: Column(children: [
                  const Padding(padding: EdgeInsets.only(top: 15)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Builder(
                          builder: (context) => IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HistoricoDePesquisaDesejavel01()),
                                );

                                //print("clicado na seta");
                              },
                              icon: const Icon(MdiIcons.calendarBlankOutline,
                                  color: Color(0xFF3C10BB)))),
                      Padding(padding: EdgeInsets.only(left: 10)),
                      Text("Último histórico de pesquisa",
                          style: TextStyle(
                              color: Color(0xFF3C10BB), fontSize: 14)),
                    ],
                  ),
                  Row(children: [
                    Container(
                      margin: const EdgeInsets.only(
                          left: 20, right: 10, top: 10, bottom: 1),
                      child: Text(
                        "Hoje",
                        style: TextStyle(
                          color: Color(0xFF3C10BB),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ]),
                  Divider(
                    color: Color(0xff979797),
                    thickness: 0.6,
                    endIndent: 20,
                    indent: 20,
                  ),



                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            left: 20, right: 10, top: 10, bottom: 1),
                        child: Text("Resultado da pesquisa",
                            style: TextStyle(
                              color: Color(0xFF3C10BB),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            )),
                      ),
                    ],
                  ),


                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    margin: EdgeInsets.only(left: 10, right: 10, top: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(children: [


                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child:
                        Column(
                        children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 1,
                              height: 1,
                              child: Checkbox(
                                  checkColor: Colors.white,
                                  activeColor: Colors.green,
                                  //fillColor: MaterialStateProperty.resolveWith(getColor),
                                  value: false,
                                  shape: CircleBorder(),
                                  onChanged: (value) {}),
                            ),
                            Padding(padding: EdgeInsets.all(10)),
                            Text("Resultado da pesquisa",
                                style: TextStyle(
                                  color: Color(0xFF3C10BB),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                )),
                          ],
                        ),

                        Row(
                          children: const [
                            Divider(
                              color: Color(0xff12EC1A),
                              thickness: 2.0,
                              endIndent: 50,
                              indent: 50,
                            ),
                          ],
                        ),

                        Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              //margin: EdgeInsets.only(left: 5, right: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Hipersensibilidade alimentar",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                  Padding(padding: EdgeInsets.all(2)),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Alérgia comum em cães da raça shih tzu",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 10),
                                      ),
                                    ],
                                  )
                                ],
                              )),

                        Padding(padding: EdgeInsets.all(2)),

                        Container(
                              padding: const EdgeInsets.all(2),
                              //  margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color(0xFF4116B4),
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 12,
                              )),

                        Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              //margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Hipersensibilidade alimentar",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                  Padding(padding: EdgeInsets.all(2)),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Alérgia comum em cães da raça shih tzu",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 10),
                                      ),
                                    ],
                                  )
                                ],
                              )),

                        Padding(padding: EdgeInsets.all(2)),

                        Container(
                              padding: const EdgeInsets.all(2),
                              //  margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color(0xFF4116B4),
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 12,
                              )),
                                               ])
                             ),

                    ]),
                  ),

                  Row(children: [
                    Container(
                      margin: const EdgeInsets.only(
                          left: 20, right: 10, top: 10, bottom: 1),
                      child: Text(
                        "11 de abril de 2023",
                        style: TextStyle(
                          color: Color(0xFF3C10BB),
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ]),

                  Divider(
                    color: Color(0xff979797),
                    thickness: 0.6,
                    endIndent: 20,
                    indent: 20,
                  ),

                  Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        margin: EdgeInsets.only(left: 10, right: 10, top: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Column(children: [


                          Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(10))),
                              child:
                              Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 1,
                                          height: 1,
                                          child: Checkbox(
                                              checkColor: Colors.white,
                                              activeColor: Colors.green,
                                              //fillColor: MaterialStateProperty.resolveWith(getColor),
                                              value: false,
                                              shape: CircleBorder(),
                                              onChanged: (value) {}),
                                        ),
                                        Padding(padding: EdgeInsets.all(10)),
                                        Text("Resultado da pesquisa",
                                            style: TextStyle(
                                              color: Color(0xFF3C10BB),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            )),
                                      ],
                                    ),

                                    Row(
                                      children: const [
                                        Divider(
                                          color: Color(0xff12EC1A),
                                          thickness: 2.0,
                                          endIndent: 50,
                                          indent: 50,
                                        ),
                                      ],
                                    ),

                                    Container(
                                        padding: EdgeInsets.only(left: 10, right: 10),
                                        //margin: EdgeInsets.only(left: 5, right: 5),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(10))),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  "Hipersensibilidade alimentar",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 10),
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                  size: 12,
                                                ),
                                              ],
                                            ),
                                            Padding(padding: EdgeInsets.all(2)),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  "Alérgia comum em cães da raça shih tzu",
                                                  style: TextStyle(
                                                      color: Colors.black, fontSize: 10),
                                                ),
                                              ],
                                            )
                                          ],
                                        )),

                                    Padding(padding: EdgeInsets.all(2)),

                                    Container(
                                        padding: const EdgeInsets.all(2),
                                        //  margin: const EdgeInsets.only(top: 10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Color(0xFF4116B4),
                                        ),
                                        child: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 12,
                                        )),

                                    Container(
                                        padding: EdgeInsets.only(left: 10, right: 10),
                                        //margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(10))),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  "Hipersensibilidade alimentar",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 10),
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                  size: 12,
                                                ),
                                              ],
                                            ),
                                            Padding(padding: EdgeInsets.all(2)),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  "Alérgia comum em cães da raça shih tzu",
                                                  style: TextStyle(
                                                      color: Colors.black, fontSize: 10),
                                                ),
                                              ],
                                            )
                                          ],
                                        )),

                                    Padding(padding: EdgeInsets.all(2)),

                                    Container(
                                        padding: const EdgeInsets.all(2),
                                        //  margin: const EdgeInsets.only(top: 10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Color(0xFF4116B4),
                                        ),
                                        child: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 12,
                                        )),
                                  ])
                          ),

                        ]),
                      ),
                ])),
              ))
        ]));
  }

  Future<void> _dialogAddExercicio() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setStateForDialog) {
            return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                backgroundColor: Colors.white.withOpacity(0.9),
                contentPadding: EdgeInsets.zero,
                title: Text(
                  "Pesquise por sistema (s) ou em\n todo banco de dados'",
                  style: TextStyle(color: Color(0xFF4116B4), fontSize: 18),
                ),
                content: SingleChildScrollView(
                  child: Row(children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Radio<SingingCharacterAreaMedica>(
                          value: SingingCharacterAreaMedica.Oftalmicos,
                          onChanged: (SingingCharacterAreaMedica? value) {
                            setState(() {});
                          },
                          groupValue: null,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.grey),
                        ),
                        Radio<SingingCharacterAreaMedica>(
                          value: SingingCharacterAreaMedica.Dermatologicos,
                          onChanged: (SingingCharacterAreaMedica? value) {
                            setState(() {});
                          },
                          groupValue: null,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.grey),
                        ),
                        Radio<SingingCharacterAreaMedica>(
                          value:
                              SingingCharacterAreaMedica.NefrologicosUrologicos,
                          onChanged: (SingingCharacterAreaMedica? value) {
                            setState(() {});
                          },
                          groupValue: null,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.grey),
                        ),
                        Radio<SingingCharacterAreaMedica>(
                          value: SingingCharacterAreaMedica.Oncologicos,
                          onChanged: (SingingCharacterAreaMedica? value) {
                            setState(() {});
                          },
                          groupValue: null,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.grey),
                        ),
                        Radio<SingingCharacterAreaMedica>(
                          value:
                              SingingCharacterAreaMedica.NefrologicosUrologicos,
                          onChanged: (SingingCharacterAreaMedica? value) {
                            setState(() {});
                          },
                          groupValue: null,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.grey),
                        ),
                        Radio<SingingCharacterAreaMedica>(
                          value: SingingCharacterAreaMedica.Respiratorios,
                          onChanged: (SingingCharacterAreaMedica? value) {
                            setState(() {});
                          },
                          groupValue: null,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.grey),
                        ),
                        Radio<SingingCharacterAreaMedica>(
                          value: SingingCharacterAreaMedica.Toxocologicos,
                          onChanged: (SingingCharacterAreaMedica? value) {
                            setState(() {});
                          },
                          groupValue: null,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.grey),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Text("Oftálmícos",
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xFF4116B4))),
                        ]),
                        Padding(padding: EdgeInsets.only(bottom: 40)),
                        Row(children: [
                          Text("Dermatológicos",
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xFF4116B4))),
                        ]),
                        Padding(padding: EdgeInsets.only(bottom: 40)),
                        Row(children: [
                          Text("Neurológicos",
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xFF4116B4))),
                        ]),
                        Padding(padding: EdgeInsets.only(bottom: 40)),
                        Row(children: [
                          Text("Oncológicos",
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xFF4116B4))),
                        ]),
                        Padding(padding: EdgeInsets.only(bottom: 50)),
                        Row(children: [
                          Text("Nefrológicos e\n urológicos",
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xFF4116B4))),
                        ]),
                        Padding(padding: EdgeInsets.only(bottom: 40)),
                        Row(children: [
                          Text("Toxocológicos",
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xFF4116B4))),
                        ]),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Radio<SingingCharacterAreaMedica>(
                          value: SingingCharacterAreaMedica.Oftalmicos,
                          onChanged: (SingingCharacterAreaMedica? value) {
                            setState(() {});
                          },
                          groupValue: null,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.grey),
                        ),
                        Radio<SingingCharacterAreaMedica>(
                          value: SingingCharacterAreaMedica.Dermatologicos,
                          onChanged: (SingingCharacterAreaMedica? value) {
                            setState(() {});
                          },
                          groupValue: null,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.grey),
                        ),
                        Radio<SingingCharacterAreaMedica>(
                          value:
                              SingingCharacterAreaMedica.NefrologicosUrologicos,
                          onChanged: (SingingCharacterAreaMedica? value) {
                            setState(() {});
                          },
                          groupValue: null,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.grey),
                        ),
                        Radio<SingingCharacterAreaMedica>(
                          value: SingingCharacterAreaMedica.Oncologicos,
                          onChanged: (SingingCharacterAreaMedica? value) {
                            setState(() {});
                          },
                          groupValue: null,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.grey),
                        ),
                        Radio<SingingCharacterAreaMedica>(
                          value:
                              SingingCharacterAreaMedica.NefrologicosUrologicos,
                          onChanged: (SingingCharacterAreaMedica? value) {
                            setState(() {});
                          },
                          groupValue: null,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.grey),
                        ),
                        Radio<SingingCharacterAreaMedica>(
                          value: SingingCharacterAreaMedica.Respiratorios,
                          onChanged: (SingingCharacterAreaMedica? value) {
                            setState(() {});
                          },
                          groupValue: null,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.grey),
                        ),
                        Radio<SingingCharacterAreaMedica>(
                          value: SingingCharacterAreaMedica.Toxocologicos,
                          onChanged: (SingingCharacterAreaMedica? value) {
                            setState(() {});
                          },
                          groupValue: null,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.grey),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Text("Oftálmícos",
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xFF4116B4))),
                        ]),
                        Padding(padding: EdgeInsets.only(bottom: 40)),
                        Row(children: [
                          Text("Dermatológicos",
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xFF4116B4))),
                        ]),
                        Padding(padding: EdgeInsets.only(bottom: 40)),
                        Row(children: [
                          Text("Neurológicos",
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xFF4116B4))),
                        ]),
                        Padding(padding: EdgeInsets.only(bottom: 40)),
                        Row(children: [
                          Text("Oncológicos",
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xFF4116B4))),
                        ]),
                        Padding(padding: EdgeInsets.only(bottom: 50)),
                        Row(children: [
                          Text("Nefrológicos e\n urológicos",
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xFF4116B4))),
                        ]),
                        Padding(padding: EdgeInsets.only(bottom: 40)),
                        Row(children: [
                          Text("Toxocológicos",
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xFF4116B4))),
                        ]),
                      ],
                    ),
                  ]),
                ),
                actions: <Widget>[
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Builder(
                            builder: (context) => ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const DetalheDaPesquisa()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: const StadiumBorder(),
                                    backgroundColor: Color(0XFF4116B4)),
                                child: const Text(
                                  'Pesquisar apenas nos sistemas selecionados',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                )),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Builder(
                            builder: (context) => ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const DetalheDaPesquisa()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: const StadiumBorder(),
                                    backgroundColor: Color(0XFF4116B4)),
                                child: const Text(
                                  'Pesquisar em todo banco de dados',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                )),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Builder(
                            builder: (context) => ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Home()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: const StadiumBorder(),
                                    backgroundColor: Color(0XFF4116B4)),
                                child: const Text(
                                  'Cancelar',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                )),
                          ),
                        ],
                      ),
                    ],
                  )
                ]);
          });

          Navigator.of(context).pop();
        });
  }

  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        // title: const Text('Atenção'),
        content: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
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

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("imagens/alertaHHPD.png"),
            ],
          ),
          Padding(padding: EdgeInsets.all(5)),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(MdiIcons.clipboardText, color: Color(0xFF4116B4), size: 30)
            ],
          ),

          Divider(
            color: Color(0xff979797),
            thickness: 0.6,
            endIndent: 0,
            indent: 0,
          ),
          //  Text('Atenção'),

          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Center(
                child: Text(
              "Sua pesquisa gero\num histórico automático. ",
              style: TextStyle(
                color: Color(0xFF4116B4),
                fontWeight: FontWeight.bold,
                fontSize: 14,
                decoration: TextDecoration.none,
              ),
            )),
          ]),

          Padding(padding: EdgeInsets.all(20)),

          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                  'Ok! Obrigado (a)',
                  style: TextStyle(color: Color(0xFFBDBECB)),
                ),
              ),
            ),
          ])
        ]),
        actions: <CupertinoDialogAction>[],
      ),
    );
  }
}
