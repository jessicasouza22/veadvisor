// 1.2 e 1.3 MsgDetalheDaPesquisaAgendamento
import 'package:d_chart/commons/data_model.dart';
import 'package:d_chart/d_chart.dart';
import 'package:d_chart/numeric/line.dart';
import 'package:d_chart/ordinal/bar.dart';
import 'package:d_chart/time/bar.dart';
import 'package:d_chart/time/line.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vetadvisor/fluxodeagendamentodeconsulta/detalheDaPesquisaAgendamentoDeConsulta.dart';
import 'package:vetadvisor/fluxopesquisarapida/detalheDaPesquisa.dart';
import 'package:vetadvisor/fluxopesquisarapida/detalheDaPesquisaDermatiteAtopica.dart';
import 'package:vetadvisor/fluxopesquisarapida/servicos.dart';
import 'package:vetadvisor/fluxoprontuariodigital/consultaPaciente.dart';
import 'package:vetadvisor/fluxoprontuariodigital/novaConsulta.dart';
import 'package:vetadvisor/fluxoprontuariodigital/perfilPaciente.dart';
import 'package:vetadvisor/minhaagenda/homeMinhaAgenda.dart';
import 'package:vetadvisor/minhaagenda/reagendamento02.dart';
import 'package:vetadvisor/prelogin/logado.dart';
import 'package:vetadvisor/recursos/dialogUtils.dart';
import 'dart:developer' as logDev;

import '../firebase/doenca_service.dart';
import '../fluxodehistoricodepesquisadesejavel/homeHistoricoPesquisaDesejavel.dart';
import '../fluxopesquisarapida/detalheDaPesquisaRealizarNovaPesquisa.dart';
import '../minhaagenda/proximaConsultaCall.dart';
import '../objetos/doenca.dart';
import '../recursos/Variaveis.dart';
import 'marcarConsultaAgendamentoDeConsulta.dart';

enum SingingCharacterAreaMedica{ Oftalmicos, Infecciosos, Dermatologicos, MusculoEsqueletico, Neurologicos, MetabolicosEndocrinos, Oncologicos, Cardiologicos, NefrologicosUrologicos, Hematologicos, Respiratorios, Odontologicos, Toxocologicos, Teriogenologicos}

List<NumericData> numericDataList = [

  NumericData(domain: 1, measure: 3),

  NumericData(domain: 2, measure: 5),

  NumericData(domain: 3, measure: 9),

  NumericData(domain: 4, measure: 6.5),

];



class MsgDetalheDaPesquisaAgendamento extends StatelessWidget {
  const MsgDetalheDaPesquisaAgendamento({super.key});

  @override
  Widget build(BuildContext context) {
    return const MsgDetalheDaPesquisaAgendamentoPage();
  }
}

class MsgDetalheDaPesquisaAgendamentoPage extends StatefulWidget {
  const MsgDetalheDaPesquisaAgendamentoPage({Key? key}) : super(key: key);

  @override
  State<MsgDetalheDaPesquisaAgendamentoPage> createState() => _MsgDetalheDaPesquisaAgendamentoPageState();
}

class _MsgDetalheDaPesquisaAgendamentoPageState extends State<MsgDetalheDaPesquisaAgendamentoPage> {

  double valorDoGrafico = 0.0; //estado para armazenar

  bool _buscandoSintomaNoBancoDeDados = false;

  final _formKey = GlobalKey<FormState>();

  final _busca = TextEditingController();


  final numericGroupList = [

    NumericGroup(

      id: '5',

      data: numericDataList,

    ),

  ];


  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // Chame o método para exibir o AlertDialog aqui
      _showAlertDialog(context);
    });
  }



  Map<String, bool> _disturbios = {

    "Distúrbios cardiológicos" : false,
    "Distúrbios dermatológicos" : false,
    "Distúrbios oftalmológicos" : false,
    "Distúrbios oncológicos" : false,
    "Distúrbios gastrointestinais" : false,
    "Distúrbios hematológicos" : false,
    "Distúrbios infecciosos" : false,
    "Distúrbios metabólicos e endócrinos" : false,
    "Distúrbios musculoesqueléticos" : false,
    "Distúrbios nefrológicos e urológicos" : false,
    "Distúrbios neurológicos" : false,
    "Distúrbios odontológicos" : false,
    "Distúrbios respiratórios" : false,
    "Distúrbios teriogenológicos" : false,
    "Distúrbios toxicológicos" : false,
  };

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        drawer: Drawer(
          child: Container(



              child: ListView(
                //padding: EdgeInsets.zero,
                  children: const [
                    DrawerHeader(

                        child: Image(
                          image: AssetImage("imagens/user.png"),
                        )
                    ),

                    Column(

                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            /*
                            Padding(padding: EdgeInsets.only(top:15, bottom: 15)),
                            Text("Ainda não existem check-ups\ndinâmicos cadastrados", style: TextStyle(color: Colors.white)),
                            Padding(padding: EdgeInsets.only(top:15, bottom: 15)),
                            Text("Aguarde...", style: TextStyle(color: Colors.white)),
                            Padding(padding: EdgeInsets.only(top:15, bottom: 15)),
                            Text("Equipe SAFE®", style: TextStyle(color: Colors.white)),

                             */
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(padding: EdgeInsets.only(top:15, bottom: 15)),
                            //Text("v.0.${_packageInfo.version}.2023", style: TextStyle(color: Colors.white)),

                          ],
                        )

                      ],
                    ),



                  ]
              )
          ),
        ),
        appBar: AppBar(
            backgroundColor: const Color(0xff4116B4),
            toolbarHeight: 80,
            elevation: 30,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF4116B4),
                    Color(0xff4116B4),
                    Color(0xff7347EF),
                    Color(0xffE3EDF7),
                  ],
                ),
              ),
            ),

            actions: <Widget>[
              PopupMenuButton<String>(
                icon: const Icon(MdiIcons.bellBadgeOutline),
                onSelected: opcoesDoMenu,
                itemBuilder: (context) => [
                  PopupMenuItem<String>(value: "4", child: Text("Não existem mensagens")),
                  PopupMenuItem<String>(value: "4", child: Text("Sair"))
                ],
              ),





            ]
        ),
        body: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                  hasScrollBody: true,
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    //color:  Color(0xFF3C10BB),
                    child: SingleChildScrollView(
                        child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              const Padding(padding: EdgeInsets.only(top: 15)),

                              const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Selecione uma forma de\natendimento?",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color(0xFF3C10BB),

                                            fontSize: 20)
                                    )
                                  ]
                              ),

                              const Padding(padding: EdgeInsets.only(top: 15)),

                              const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Faça a triagem do seu paciente",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,

                                        )
                                    )
                                  ]
                              ),

                              ButtonBar(
                                alignment: MainAxisAlignment.spaceAround,
                                children: [

                                  Row(
                                      children: [
                                        Radio(
                                          value: "Cães",
                                          groupValue: Variaveis.especieSelecionada,
                                          onChanged: (value) {
                                            setState(() {
                                              Variaveis.especieSelecionada = "Cães";

                                            });
                                          },

                                          fillColor:
                                          MaterialStateColor.resolveWith((states) => Colors.green),
                                        ),

                                        const Text("Presencial",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Color(0xFF3C10BB))
                                        )
                                      ]
                                  ),

                                  Row(
                                    children: [
                                      Radio(
                                          value: "Gatos",
                                          groupValue: Variaveis.especieSelecionada,
                                          fillColor:
                                          MaterialStateColor.resolveWith((states) => Colors.green),
                                          onChanged: (value) {
                                            setState(() {
                                              Variaveis.especieSelecionada = "Gatos";

                                            });
                                          }
                                      ),
                                      const Text("Domicilio",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Color(0xFF3C10BB)
                                          )
                                      )
                                    ],
                                  ),

                                  Row(
                                      children: [
                                        Radio(
                                            value: "Pets exóticos",
                                            groupValue: Variaveis.especieSelecionada,
                                            fillColor:
                                            MaterialStateColor.resolveWith((states) => Colors.green),
                                            onChanged: (value) {
                                              setState(() {
                                                Variaveis.especieSelecionada = "Pets exóticos";
                                              });

                                            }
                                        ),
                                        const Text("Online",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Color(0xFF3C10BB)
                                            )
                                        )
                                      ]
                                  )
                                ],
                              ),


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
                                          height: 30,
                                          width: 300,
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
                                                const DetalheDaPesquisaRealizarNovaPesquisa()),
                                          );
                                        },
                                        child:
                                        Row(
                                            children: [


                                              IconButton(
                                                icon: Icon(MdiIcons.filterVariantMinus,
                                            color: Color(0xff000000)),
                                                onPressed: () {
                                                  _FiltroShowAlertDialog(context); // Chama a função _showDialog quando o botão é pressionado.
                                                },
                                              ),

                                              Padding(padding: EdgeInsets.only(left: 10)),

                                              Text(
                                                'Filtro',
                                                style: TextStyle(color: Color(0xff000000)),
                                              ),]),
                                      ),),]),

                              Padding(padding: EdgeInsets.all(15)),


                              Container(


                                margin: EdgeInsets.only(left: 15, right: 15),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white, // Cor de fundo do Container
                                  borderRadius: BorderRadius.circular(10), // Define o raio do arredondamento das bordas
                                ),


                                child:

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                  children: [
                                    Column(
                                        children: [
                                          Container(
                                              decoration: BoxDecoration(
                                                color: Colors.lightGreenAccent,
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                              child: Center(
                                                  child:
                                                  CircleAvatar(
                                                    radius: 20,
                                                    backgroundColor: Color(0xFF3C10BB),

                                                    child: ClipOval(

                                                      child:
                                                      Image.asset("imagens/uhtred.jpeg"),

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
                                              Text("João Clovis",
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
                                              Text("Dermatologista",
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

                                              Text("150,00 a consulta",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xFF82888A),

                                                ),)
                                            ],
                                          ),

                                          Row(
                                            children: [
                                              Container(
                                                width: 100,
                                                height: 20,
                                                child:
                                                Builder(
                                                  builder: (context) => ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                        shape: const StadiumBorder(),
                                                        backgroundColor: Color(0xff12EC1A),
                                                        // minimumSize: MaterialStateProperty.all(Size(50, 100))
                                                      ),
                                                      onPressed: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                              const MarcarConsultaAgendamento()),
                                                        );
                                                      },
                                                      child: const Text(
                                                        'Agendar Consulta',
                                                        style: TextStyle(color: Color(0xff1A3D8E), fontSize: 8),
                                                      )),
                                                ),),
                                            ],
                                          )
                                        ]),

                                    Padding(padding: EdgeInsets.only(left: 10)),

                                    Column(

                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [


                                            Icon(Icons.star,
                                              color: Color(0xFFFBB509),
                                              size: 18,),

                                            Text("(17 avaliações)",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF82888A),

                                              ),),
                                            Icon(MdiIcons.chevronRight,
                                              color: Color(0xFF979797),
                                              size: 12,),
                                          ],
                                        ),

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text("ocupar espaço",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.transparent,

                                              ),)
                                          ],
                                        ),

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [


                                            Icon(MdiIcons.mapMarkerOutline,
                                              color: Color(0xFF979797),
                                              size: 18,),

                                            Text("3 km de você",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF82888A),

                                              ),),

                                          ],
                                        ),

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text("Recomendado",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFFFBB509),

                                              ),)
                                          ],
                                        ),

                                      ],
                                    )
                                  ],
                                ),
                              ),

                              Padding(padding: EdgeInsets.all(50)),










                            ]
                        )
                    ),
                  )
              )
            ]
        ),
        bottomNavigationBar: BottomNavigationBar(

          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                label: "Início",
                icon: Icon(MdiIcons.home,color: Colors.grey)
            ),

            BottomNavigationBarItem(
                label: "Consulta",
                icon: Icon(MdiIcons.stethoscope,color: Colors.grey)
            ),

            BottomNavigationBarItem(
                label: "Comunidade",
                icon: Icon(MdiIcons.googleCirclesCommunities,color: Colors.grey)
            ),

            BottomNavigationBarItem(
                label: "Calendário",
                icon: Icon(MdiIcons.calendar,color: Colors.grey)
            ),

            BottomNavigationBarItem(
                label: "Mais",
                icon: Icon(MdiIcons.dotsSquare,color: Colors.grey)
            )

          ],

          currentIndex: _selectedIndex,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.green,
          onTap: _onItemTapped,
        )
    );
  }

  Future<void> _dialogAddExercicio() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (context, setStateForDialog) {
                return AlertDialog(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))
                    ),

                    backgroundColor: Colors.white.withOpacity(0.9),
                    contentPadding: EdgeInsets.zero,
                    title:  const Text("Pesquise por sistema (s) ou em todo banco de dados",
                        style: TextStyle(color: Color(0xFF4116B4), fontSize: 18)
                    ),

                    content: SingleChildScrollView(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Row(
                                    children: [
                                      Checkbox(
                                        value: _disturbios["Distúrbios oftalmológicos"],
                                        onChanged: (value) {
                                          setStateForDialog(() {

                                            if(!_disturbios["Distúrbios oftalmológicos"]!) {
                                              if(!Variaveis.disturbiosSelecionados.contains("Distúrbios oftalmológicos")) {
                                                if(Variaveis.disturbiosSelecionados.length < 10) {
                                                  Variaveis.disturbiosSelecionados.add("Distúrbios oftalmológicos");
                                                  _disturbios["Distúrbios oftalmológicos"] = !_disturbios["Distúrbios oftalmológicos"]!;
                                                } else {
                                                  _dialogNumeroMaximoDeDisturbios();
                                                }

                                              }
                                            } else {
                                              Variaveis.disturbiosSelecionados.remove("Distúrbios oftalmológicos");
                                              _disturbios["Distúrbios oftalmológicos"] = !_disturbios["Distúrbios oftalmológicos"]!;
                                            }





                                            print(Variaveis.disturbiosSelecionados.toString());
                                          });
                                        },
                                      ),
                                      Expanded(
                                        child: Text("Oftálmológicos"),
                                      )


                                    ],
                                  ),


                                  Row(
                                    children: [
                                      Checkbox(
                                        value: _disturbios["Distúrbios dermatológicos"],
                                        onChanged: (value) {
                                          setStateForDialog(() {
                                            if (!_disturbios["Distúrbios dermatológicos"]!) {
                                              if (!Variaveis.disturbiosSelecionados.contains("Distúrbios dermatológicos")) {
                                                if (Variaveis.disturbiosSelecionados.length < 10) {
                                                  Variaveis.disturbiosSelecionados.add("Distúrbios dermatológicos");
                                                  _disturbios["Distúrbios dermatológicos"] = !_disturbios["Distúrbios dermatológicos"]!;
                                                } else {
                                                  _dialogNumeroMaximoDeDisturbios();
                                                }
                                              }
                                            } else {
                                              Variaveis.disturbiosSelecionados.remove("Distúrbios dermatológicos");
                                              _disturbios["Distúrbios dermatológicos"] = !_disturbios["Distúrbios dermatológicos"]!;
                                            }

                                          });
                                        },
                                      ),
                                      Expanded(
                                        child: Text("Dermatológicos"),
                                      )


                                    ],
                                  ),

                                  Row(
                                    children: [
                                      Checkbox(
                                        value: _disturbios["Distúrbios neurológicos"],
                                        onChanged: (value) {
                                          setStateForDialog(() {
                                            if (!_disturbios["Distúrbios neurológicos"]!) {
                                              if (!Variaveis.disturbiosSelecionados.contains("Distúrbios neurológicos")) {
                                                if (Variaveis.disturbiosSelecionados.length < 10) {
                                                  Variaveis.disturbiosSelecionados.add("Distúrbios neurológicos");
                                                  _disturbios["Distúrbios neurológicos"] = !_disturbios["Distúrbios neurológicos"]!;
                                                } else {
                                                  _dialogNumeroMaximoDeDisturbios();
                                                }
                                              }
                                            } else {
                                              Variaveis.disturbiosSelecionados.remove("Distúrbios neurológicos");
                                              _disturbios["Distúrbios neurológicos"] = !_disturbios["Distúrbios neurológicos"]!;
                                            }


                                          });
                                        },
                                      ),
                                      Expanded(
                                        child: Text("Neurológicos"),
                                      )


                                    ],
                                  ),

                                  Row(
                                    children: [
                                      Checkbox(
                                        value: _disturbios["Distúrbios oncológicos"],
                                        onChanged: (value) {
                                          setStateForDialog(() {
                                            if (!_disturbios["Distúrbios oncológicos"]!) {
                                              if (!Variaveis.disturbiosSelecionados.contains("Distúrbios oncológicos")) {
                                                if (Variaveis.disturbiosSelecionados.length < 10) {
                                                  Variaveis.disturbiosSelecionados.add("Distúrbios oncológicos");
                                                  _disturbios["Distúrbios oncológicos"] = !_disturbios["Distúrbios oncológicos"]!;
                                                } else {
                                                  _dialogNumeroMaximoDeDisturbios();
                                                }
                                              }
                                            } else {
                                              Variaveis.disturbiosSelecionados.remove("Distúrbios oncológicos");
                                              _disturbios["Distúrbios oncológicos"] = !_disturbios["Distúrbios oncológicos"]!;
                                            }

                                          });
                                        },
                                      ),
                                      Expanded(
                                        child: Text("Oncológicos"),
                                      )


                                    ],
                                  ),

                                  Row(
                                    children: [
                                      Checkbox(
                                        value: _disturbios["Distúrbios nefrológicos e urológicos"],
                                        onChanged: (value) {
                                          setStateForDialog(() {
                                            if (!_disturbios["Distúrbios nefrológicos e urológicos"]!) {
                                              if (!Variaveis.disturbiosSelecionados.contains("Distúrbios nefrológicos e urológicos")) {
                                                if (Variaveis.disturbiosSelecionados.length < 10) {
                                                  Variaveis.disturbiosSelecionados.add("Distúrbios nefrológicos e urológicos");
                                                  _disturbios["Distúrbios nefrológicos e urológicos"] = !_disturbios["Distúrbios nefrológicos e urológicos"]!;
                                                } else {
                                                  _dialogNumeroMaximoDeDisturbios();
                                                }
                                              }
                                            } else {
                                              Variaveis.disturbiosSelecionados.remove("Distúrbios nefrológicos e urológicos");
                                              _disturbios["Distúrbios nefrológicos e urológicos"] = !_disturbios["Distúrbios nefrológicos e urológicos"]!;
                                            }

                                          });
                                        },
                                      ),
                                      Expanded(
                                        child: Text("Nefrológicos e urológicos"),
                                      )


                                    ],
                                  ),

                                  Row(
                                    children: [
                                      Checkbox(
                                        value: _disturbios["Distúrbios respiratórios"],
                                        onChanged: (value) {
                                          setStateForDialog(() {
                                            if (!_disturbios["Distúrbios respiratórios"]!) {
                                              if (!Variaveis.disturbiosSelecionados.contains("Distúrbios respiratórios")) {
                                                if (Variaveis.disturbiosSelecionados.length < 10) {
                                                  Variaveis.disturbiosSelecionados.add("Distúrbios respiratórios");
                                                  _disturbios["Distúrbios respiratórios"] = !_disturbios["Distúrbios respiratórios"]!;
                                                } else {
                                                  _dialogNumeroMaximoDeDisturbios();
                                                }
                                              }
                                            } else {
                                              Variaveis.disturbiosSelecionados.remove("Distúrbios respiratórios");
                                              _disturbios["Distúrbios respiratórios"] = !_disturbios["Distúrbios respiratórios"]!;
                                            }

                                          });
                                        },
                                      ),
                                      Expanded(
                                        child: Text("Respiratórios"),
                                      )


                                    ],
                                  ),

                                  Row(
                                    children: [
                                      Checkbox(
                                        value: _disturbios["Distúrbios toxicológicos"],
                                        onChanged: (value) {
                                          setStateForDialog(() {
                                            if (!_disturbios["Distúrbios toxicológicos"]!) {
                                              if (!Variaveis.disturbiosSelecionados.contains("Distúrbios toxicológicos")) {
                                                if (Variaveis.disturbiosSelecionados.length < 10) {
                                                  Variaveis.disturbiosSelecionados.add("Distúrbios toxicológicos");
                                                  _disturbios["Distúrbios toxicológicos"] = !_disturbios["Distúrbios toxicológicos"]!;
                                                } else {
                                                  _dialogNumeroMaximoDeDisturbios();
                                                }
                                              }
                                            } else {
                                              Variaveis.disturbiosSelecionados.remove("Distúrbios toxicológicos");
                                              _disturbios["Distúrbios toxicológicos"] = !_disturbios["Distúrbios toxicológicos"]!;
                                            }

                                          });
                                        },
                                      ),
                                      Expanded(
                                        child: Text("Toxicológicos"),
                                      )


                                    ],
                                  ),




                                ],
                              ),
                            ),

                            Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [


                                    Row(
                                      children: [
                                        Checkbox(
                                          value: _disturbios["Distúrbios infecciosos"],
                                          onChanged: (value) {
                                            setStateForDialog(() {
                                              if (!_disturbios["Distúrbios infecciosos"]!) {
                                                if (!Variaveis.disturbiosSelecionados.contains("Distúrbios infecciosos")) {
                                                  if (Variaveis.disturbiosSelecionados.length < 10) {
                                                    Variaveis.disturbiosSelecionados.add("Distúrbios infecciosos");
                                                    _disturbios["Distúrbios infecciosos"] = !_disturbios["Distúrbios infecciosos"]!;
                                                  } else {
                                                    _dialogNumeroMaximoDeDisturbios();
                                                  }
                                                }
                                              } else {
                                                Variaveis.disturbiosSelecionados.remove("Distúrbios infecciosos");
                                                _disturbios["Distúrbios infecciosos"] = !_disturbios["Distúrbios infecciosos"]!;
                                              }

                                            });
                                          },
                                        ),
                                        Expanded(
                                          child: Text("Infecciosos"),
                                        )


                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Checkbox(
                                          value: _disturbios["Distúrbios musculoesqueléticos"],
                                          onChanged: (value) {
                                            setStateForDialog(() {
                                              if (!_disturbios["Distúrbios musculoesqueléticos"]!) {
                                                if (!Variaveis.disturbiosSelecionados.contains("Distúrbios musculoesqueléticos")) {
                                                  if (Variaveis.disturbiosSelecionados.length < 10) {
                                                    Variaveis.disturbiosSelecionados.add("Distúrbios musculoesqueléticos");
                                                    _disturbios["Distúrbios musculoesqueléticos"] = !_disturbios["Distúrbios musculoesqueléticos"]!;
                                                  } else {
                                                    _dialogNumeroMaximoDeDisturbios();
                                                  }
                                                }
                                              } else {
                                                Variaveis.disturbiosSelecionados.remove("Distúrbios musculoesqueléticos");
                                                _disturbios["Distúrbios musculoesqueléticos"] = !_disturbios["Distúrbios musculoesqueléticos"]!;
                                              }

                                            });
                                          },
                                        ),
                                        Expanded(
                                          child: Text("Músculo esqueléticos"),
                                        )


                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Checkbox(
                                          value: _disturbios["Distúrbios metabólicos e endócrinos"],
                                          onChanged: (value) {
                                            setStateForDialog(() {
                                              if (!_disturbios["Distúrbios metabólicos e endócrinos"]!) {
                                                if (!Variaveis.disturbiosSelecionados.contains("Distúrbios metabólicos e endócrinos")) {
                                                  if (Variaveis.disturbiosSelecionados.length < 10) {
                                                    Variaveis.disturbiosSelecionados.add("Distúrbios metabólicos e endócrinos");
                                                    _disturbios["Distúrbios metabólicos e endócrinos"] = !_disturbios["Distúrbios metabólicos e endócrinos"]!;
                                                  } else {
                                                    _dialogNumeroMaximoDeDisturbios();
                                                  }
                                                }
                                              } else {
                                                Variaveis.disturbiosSelecionados.remove("Distúrbios metabólicos e endócrinos");
                                                _disturbios["Distúrbios metabólicos e endócrinos"] = !_disturbios["Distúrbios metabólicos e endócrinos"]!;
                                              }
                                            });
                                          },
                                        ),
                                        Expanded(
                                          child: Text("Metabólicos e endócrinos"),
                                        )


                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Checkbox(
                                          value: _disturbios["Distúrbios cardiológicos"],
                                          onChanged: (value) {
                                            setStateForDialog(() {
                                              if (!_disturbios["Distúrbios cardiológicos"]!) {
                                                if (!Variaveis.disturbiosSelecionados.contains("Distúrbios cardiológicos")) {
                                                  if (Variaveis.disturbiosSelecionados.length < 10) {
                                                    Variaveis.disturbiosSelecionados.add("Distúrbios cardiológicos");
                                                    _disturbios["Distúrbios cardiológicos"] = !_disturbios["Distúrbios cardiológicos"]!;
                                                  } else {
                                                    _dialogNumeroMaximoDeDisturbios();
                                                  }
                                                }
                                              } else {
                                                Variaveis.disturbiosSelecionados.remove("Distúrbios cardiológicos");
                                                _disturbios["Distúrbios cardiológicos"] = !_disturbios["Distúrbios cardiológicos"]!;
                                              }
                                            });
                                          },
                                        ),
                                        Expanded(
                                          child: Text("Cardiológicos"),
                                        )


                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Checkbox(
                                          value: _disturbios["Distúrbios hematológicos"],
                                          onChanged: (value) {
                                            setStateForDialog(() {
                                              if (!_disturbios["Distúrbios hematológicos"]!) {
                                                if (!Variaveis.disturbiosSelecionados.contains("Distúrbios hematológicos")) {
                                                  if (Variaveis.disturbiosSelecionados.length < 10) {
                                                    Variaveis.disturbiosSelecionados.add("Distúrbios hematológicos");
                                                    _disturbios["Distúrbios hematológicos"] = !_disturbios["Distúrbios hematológicos"]!;
                                                  } else {
                                                    _dialogNumeroMaximoDeDisturbios();
                                                  }
                                                }
                                              } else {
                                                Variaveis.disturbiosSelecionados.remove("Distúrbios hematológicos");
                                                _disturbios["Distúrbios hematológicos"] = !_disturbios["Distúrbios hematológicos"]!;
                                              }
                                            });
                                          },
                                        ),
                                        Expanded(
                                          child: Text("Hematológicos"),
                                        )


                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Checkbox(
                                          value: _disturbios["Distúrbios odontológicos"],
                                          onChanged: (value) {
                                            setStateForDialog(() {
                                              if (!_disturbios["Distúrbios odontológicos"]!) {
                                                if (!Variaveis.disturbiosSelecionados.contains("Distúrbios odontológicos")) {
                                                  if (Variaveis.disturbiosSelecionados.length < 10) {
                                                    Variaveis.disturbiosSelecionados.add("Distúrbios odontológicos");
                                                    _disturbios["Distúrbios odontológicos"] = !_disturbios["Distúrbios odontológicos"]!;
                                                  } else {
                                                    _dialogNumeroMaximoDeDisturbios();
                                                  }
                                                }
                                              } else {
                                                Variaveis.disturbiosSelecionados.remove("Distúrbios odontológicos");
                                                _disturbios["Distúrbios odontológicos"] = !_disturbios["Distúrbios odontológicos"]!;
                                              }
                                            });
                                          },
                                        ),
                                        Expanded(
                                          child: Text("Odontológicos"),
                                        )


                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Checkbox(
                                          value: _disturbios["Distúrbios teriogenológicos"],
                                          onChanged: (value) {
                                            setStateForDialog(() {
                                              if (!_disturbios["Distúrbios teriogenológicos"]!) {
                                                if (!Variaveis.disturbiosSelecionados.contains("Distúrbios teriogenológicos")) {
                                                  if (Variaveis.disturbiosSelecionados.length < 10) {
                                                    Variaveis.disturbiosSelecionados.add("Distúrbios teriogenológicos");
                                                    _disturbios["Distúrbios teriogenológicos"] = !_disturbios["Distúrbios teriogenológicos"]!;
                                                  } else {
                                                    _dialogNumeroMaximoDeDisturbios();
                                                  }
                                                }
                                              } else {
                                                Variaveis.disturbiosSelecionados.remove("Distúrbios teriogenológicos");
                                                _disturbios["Distúrbios teriogenológicos"] = !_disturbios["Distúrbios teriogenológicos"]!;
                                              }
                                            });
                                          },
                                        ),
                                        Expanded(
                                          child: Text("Teriogenológicos"),
                                        )


                                      ],
                                    ),





                                  ],
                                ))



                          ],
                        )


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
                                      //_buscaDoencas(false);
                                      if(Variaveis.disturbiosSelecionados.length > 0) {
                                        //_searchDoencas(_busca.text, _especiePaciente, false);


                                        DialogUtils.dialogBuscandoNoBanco(context);

                                        setState(() {
                                          _buscandoSintomaNoBancoDeDados = true;
                                        });

                                        Variaveis.buscaCompleta = false;
                                        buscarDoencas(_busca.text, Variaveis.especieSelecionada, Variaveis.buscaCompleta);

                                        final currentFocus = FocusScope.of(context);
                                        currentFocus.unfocus();

                                      }

                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: const StadiumBorder(),
                                        backgroundColor: Variaveis.disturbiosSelecionados.length > 0 ? Color(0XFF4116B4) : Colors.grey),
                                    child: const Text(
                                      'Pesquisar apenas nos sistemas selecionados',
                                      style: TextStyle(color: Colors.white, fontSize: 12),
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

                                      //_searchDoencas(_busca.text, _especiePaciente, true);


                                      DialogUtils.dialogBuscandoNoBanco(context);

                                      setState(() {
                                        _buscandoSintomaNoBancoDeDados = true;
                                      });

                                      // Para limpar o campo de busca. Desabilitado temporariamente para facilitar os testes
                                      //_busca.text = "";

                                      Variaveis.buscaCompleta = true;
                                      buscarDoencas(_busca.text, Variaveis.especieSelecionada, Variaveis.buscaCompleta);

                                      final currentFocus = FocusScope.of(context);
                                      currentFocus.unfocus();

                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: const StadiumBorder(),
                                        backgroundColor: Color(0XFF4116B4)),
                                    child: const Text(
                                      'Pesquisar em todo banco de dados',
                                      style: TextStyle(color: Colors.white, fontSize: 12),
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
                                      Navigator.of(context).pop();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: const StadiumBorder(),
                                        backgroundColor: Color(0XFF4116B4)),
                                    child: const Text(
                                      'Cancelar',
                                      style: TextStyle(color: Colors.white, fontSize: 12),
                                    )),
                              ),
                            ],
                          ),

                        ],
                      )]);

              }
          );


          Navigator.of(context).pop();


        });
  }

  Future<void> _dialogNumeroMaximoDeDisturbios() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (context, setStateForDialog) {
                return AlertDialog(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))
                    ),

                    backgroundColor: Colors.white.withOpacity(0.9),
                    contentPadding: EdgeInsets.zero,
                    title:  const Text("Numero máximo de sintomas selecionados. Remova algum ou faça a busca em todo o banco",
                        style: TextStyle(color: Color(0xFF4116B4), fontSize: 18)
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
                                      Navigator.of(context).pop();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: const StadiumBorder(),
                                        backgroundColor: Color(0XFF4116B4)),
                                    child: const Text(
                                      'OK',
                                      style: TextStyle(color: Colors.white, fontSize: 12),
                                    )),
                              ),
                            ],
                          ),

                        ],
                      )]);

              }
          );


          Navigator.of(context).pop();


        });
  }


  Future<void> buscarDoencas(sinal, especie, buscaCompleta) async {

    List<Doenca> _doencasEncontradas = [];

    try{
      _doencasEncontradas = await DoencaService.buscaDoencas(sinal, especie, buscaCompleta);

    } catch (Exception){

    }

    Variaveis.sintomaBuscado.clear();

    Variaveis.doencas = _doencasEncontradas;
    Variaveis.sintomaBuscado.add(sinal);


    setState(() {
      _buscandoSintomaNoBancoDeDados = false;
    });

    // Necessário repetir para fechar o dialog de busca e o de carregamento
    Navigator.of(context).pop();
    Navigator.of(context).pop();

    if(_doencasEncontradas.length > 0) {

      _busca.clear();

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DetalheDaPesquisa()),
      );
    } else {




      final snackBar = SnackBar(
        content: const Text('Não existem resultados para os parâmetros informados'),
        action: SnackBarAction(
          label: 'Fechar',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);


    }


  }


  // FUncao para renomear atributos sem perder seus dados
  /*
  void renameAttributesInDoencaCollection() async {
    // Referência à coleção "doenca"
    var collectionRef = FirebaseFirestore.instance.collection('doencas');

    // Consulta para obter todos os documentos da coleção
    var querySnapshot = await collectionRef.get();

    // Loop através de cada documento
    for (var document in querySnapshot.docs) {
      // Verificar se o atributo "novosSinais" está presente no documento
      if (document.data().containsKey("novosSinais")) {
        var novosSinais = document.data()["novosSinais"];

        // Atualizar o documento com o novo nome do atributo "sinais"
        document.reference.update({"sinais": novosSinais});

        // Deletar o atributo "novosSinais" do documento
        document.reference.update({"novosSinais": FieldValue.delete()});
      }

      // Verificar se o atributo "novasEspecies" está presente no documento
      if (document.data().containsKey("novasEspecies")) {
        var novasEspecies = document.data()["novasEspecies"];

        // Atualizar o documento com o novo nome do atributo "especie"
        document.reference.update({"especie": novasEspecies});

        // Deletar o atributo "novasEspecies" do documento
        document.reference.update({"novasEspecies": FieldValue.delete()});
      }
    }
  }


   */

  // Funcao que migra os campos de String separadas por ; para array de String
  /*
  void migrateAttributesToArrays(List<String> atributos) async {
    // Referência à coleção "doenças"
    var collectionRef = FirebaseFirestore.instance.collection('doencas');

    // Consulta para obter todos os documentos da coleção
    var querySnapshot = await collectionRef.get();

    // Loop através de cada documento
    for (var document in querySnapshot.docs) {
      var dadosAtualizados = document.data(); // Sem necessidade de "!"

      for (var atributo in atributos) {
        // Verificar se o atributo existe no documento e se é do tipo String
        if (dadosAtualizados.containsKey(atributo) &&
            dadosAtualizados[atributo] is String) {
          var valorAtributo = dadosAtualizados[atributo].toString();

          // Separar os valores do atributo usando o caractere ";"
          var listaDeValores = valorAtributo.split(";");

          // Adicionar cada valor do atributo à lista de valores
          dadosAtualizados[atributo] = listaDeValores;
        } else {
          print("Atributo $atributo não é uma string no documento ${document.id}. Ignorando...");
        }
      }

      // Atualizar o documento com os novos valores dos atributos
      document.reference.update(dadosAtualizados);

      print("Migração concluída com sucesso para o documento ${document.id}.");
    }
  }

   */





  Future<void> opcoesDoMenu(String escolha) async {
    switch (escolha){
      case "0":


      //_dialogAlterarSenha();

        break;

      case "1":



        break;

      case "2":

      //_dialogExcluirUsuario();

        break;

      case "3":

      /*
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => const MeusDados()),
        );

         */

        break;

      case "4":
      //_showMyDialog();
        break;

      case "5":



    }
  }


  void _exibirAlertDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // Impedir que o diálogo seja fechado ao tocar fora dele
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text('Efetuando busca...'),
            content: Container(

              child: Center(child: CircularProgressIndicator()),
            )



        );
      },
    );
  }

  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        // title: const Text('Atenção'),
        content:
        Column(children: [

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

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Encontrou o \nespecialista que procurava?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFF3C10BB),
                      fontWeight: FontWeight.bold,

                      fontSize: 15)
              )


            ],
          ),
          Padding(padding:EdgeInsets.all(5)),



          Divider(

            color: Color(0xff979797),
            thickness: 0.6,
            endIndent: 0,
            indent: 0,

          ),
          //  Text('Atenção'),

          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 180,

                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),  // Cor da sombra
                        spreadRadius: 2,  // Raio da propagação da sombra
                        blurRadius: 7,  // Raio do desfoque da sombra
                        offset: Offset(0, 0),  // Deslocamento da sombra
                      ),
                    ],
                  ),
                  child: const CupertinoTextField(
                    placeholder: 'Deixe sua sugestão aqui!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,

                    ),
                  ),
                )
                ,]),

          Padding(padding:EdgeInsets.all(20)),

          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Builder(
                  builder: (context) => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: Color(0xFF4116B4)),
                    onPressed: () {

                      _AposEnviarShowAlertDialog(context);


                    },
                    child: const Text(
                      'Enviar',
                      style: TextStyle(color: Colors.white),
                    ),),
                ),
              ])



        ]),
        actions: <CupertinoDialogAction>[

        ],
      ),
    );
  }

  void _AposEnviarShowAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        // title: const Text('Atenção'),
        content:
        Column(children: [

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

          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  // margin:  EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xFF12EC1A),),
                  child:
                  Icon(MdiIcons.check,
                    color: Colors.white,
                    size: 30,
                  ),),
              ] ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              Text("Mensagem enviada\n com sucesso!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFF3C10BB),
                      fontWeight: FontWeight.bold,

                      fontSize: 15)
              )


            ],
          ),
          Padding(padding:EdgeInsets.all(5)),

          Divider(

            color: Color(0xff979797),
            thickness: 0.6,
            endIndent: 0,
            indent: 0,

          ),
          //  Text('Atenção'),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.asset("imagens/mao.png",
                  width: 45,
                  height: 40,
                  fit: BoxFit.contain // ajustar a imagem dentro do espaço
              ),

              Text("Obrigada por compartilhar\n sua sugestão!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFF3C10BB),
                      fontSize: 12)
              )


            ],
          ),

          Padding(padding:EdgeInsets.all(10)),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              Text("Neste momento seguirá para análise!\n Em breve ela poderá aparecer aqui em nossa página.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFF6C7589),
                      fontSize: 8)
              )


            ],
          ),

          Padding(padding:EdgeInsets.all(10)),

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
                            const DetalheDaPesquisaAgendamentoDaConsulta()),
                      );
                    },
                    child: const Text(
                      'Sair',
                      style: TextStyle(color: Color(0xFFBDBECB)),
                    ),),
                ),
              ])



        ]),
        actions: <CupertinoDialogAction>[

        ],
      ),
    );
  }


  void _FiltroShowAlertDialog(BuildContext context) {
    final double customWidth = 500.0; // Largura personalizada desejada
    final double customHeight = 800.0; // Altura personalizada desejada
    showCupertinoModalPopup<void>(
        context: context,


        builder: (BuildContext context) =>  CupertinoAlertDialog(


        content:
        Column(children: [

          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Icon(
                  MdiIcons.close,
                  color: Colors.transparent,
                  size: 20,
                ),

                Text('Filtros', textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF3C10BB),
                        fontWeight: FontWeight.bold,

                        fontSize: 18)
                ),

                Icon(
                  MdiIcons.close,
                  color: Color(0xff59616E),
                  size: 20,
                ),


              ]),

          Divider(

            color: Color(0xff979797),
            thickness: 0.6,
            endIndent: 0,
            indent: 0,

          ),

          Container(
           // margin: EdgeInsets.only(left: 20, right: 20, top: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 20,
                      width: 100,
                      child: TextFormField(
                        //para senha: obscureText: true,

                        textAlign: TextAlign.center,

                        style: const TextStyle(
                          fontSize: 8,
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
                                    size: 15,
                                    color: Color(0xFF979797),
                                  ))),
                          hintText: "Busque por especialidade",

                        ),
                      ),
                    ),
                  ]),
            ]),
          ),

          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Faixa de preço', textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF3C10BB),
                        fontWeight: FontWeight.bold,
                        fontSize: 12)
                ),

              ]),

          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('O preço médio por consulta é de 150,00', textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF3C10BB),
                        //fontWeight: FontWeight.bold,
                        fontSize: 11)
                ),

              ]),

          Padding(padding: EdgeInsets.all(10)),

          AspectRatio(

            aspectRatio: 16 / 9,

            child: DChartLineN(


              groupList: numericGroupList,



            ),

          ),

          Padding(padding: EdgeInsets.all(10)),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[

          Column(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white, // Cor de fundo branca
                  borderRadius: BorderRadius.circular(10.0), // Borda arredondada
                  border: Border.all(
                    color: Color(0xFFE0E2E3), // Cor cinza da borda
                    width: 1.0, // Largura da borda
                  ),
                ),
                child:  Column(
                  children: [

                  Row(
                    children: [
                    Text("Valor mínimo\nda consulta",
                    style: TextStyle(
                      fontSize: 12, // Tamanho da fonte
                      color: Color(0xFF59616E)
                      //fontWeight: FontWeight.bold, // Peso da fonte (negrito)
                    ),
                  ),
                  ]),

                  Row(
                      children: [
                    Text("R50,00",
                      style: TextStyle(
                        fontSize: 12, // Tamanho da fonte
                        fontWeight: FontWeight.bold, // Peso da fonte (negrito)
                      ),
                    ),
                  ]),
                ]),
                ),


            ],
          ),

          Column(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white, // Cor de fundo branca
                  borderRadius: BorderRadius.circular(10.0), // Borda arredondada
                  border: Border.all(
                    color: Color(0xFFE0E2E3), // Cor cinza da borda
                    width: 1.0, // Largura da borda
                  ),
                ),
                child:  Column(
                    children: [

                      Row(
                          children: [
                            Text("Valor mínimo\nda consulta",
                              style: TextStyle(
                                  fontSize: 12, // Tamanho da fonte
                                  color: Color(0xFF59616E)
                                //fontWeight: FontWeight.bold, // Peso da fonte (negrito)
                              ),
                            ),
                          ]),

                      Row(
                          children: [
                            Text("R50,00",
                              style: TextStyle(
                                fontSize: 12, // Tamanho da fonte
                                fontWeight: FontWeight.bold, // Peso da fonte (negrito)
                              ),
                            ),
                          ]),
                    ]),
              ),


            ],
          ),

          ]),

          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[

                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white, // Cor de fundo branca
                        borderRadius: BorderRadius.circular(10.0), // Borda arredondada
                        border: Border.all(
                          color: Color(0xFFE0E2E3), // Cor cinza da borda
                          width: 1.0, // Largura da borda
                        ),
                      ),
                      child:  Column(
                          children: [

                            Row(
                                children: [
                                  Text("Valor mínimo\nda consulta",
                                    style: TextStyle(
                                        fontSize: 12, // Tamanho da fonte
                                        color: Color(0xFF59616E)
                                      //fontWeight: FontWeight.bold, // Peso da fonte (negrito)
                                    ),
                                  ),
                                ]),

                            Row(
                                children: [
                                  Text("R50,00",
                                    style: TextStyle(
                                      fontSize: 12, // Tamanho da fonte
                                      fontWeight: FontWeight.bold, // Peso da fonte (negrito)
                                    ),
                                  ),
                                ]),
                          ]),
                    ),


                  ],
                ),

                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white, // Cor de fundo branca
                        borderRadius: BorderRadius.circular(10.0), // Borda arredondada
                        border: Border.all(
                          color: Color(0xFFE0E2E3), // Cor cinza da borda
                          width: 1.0, // Largura da borda
                        ),
                      ),
                      child:  Column(
                          children: [

                            Row(
                                children: [
                                  Text("Valor mínimo\nda consulta",
                                    style: TextStyle(
                                        fontSize: 12, // Tamanho da fonte
                                        color: Color(0xFF59616E)
                                      //fontWeight: FontWeight.bold, // Peso da fonte (negrito)
                                    ),
                                  ),
                                ]),

                            Row(
                                children: [
                                  Text("R50,00",
                                    style: TextStyle(
                                      fontSize: 12, // Tamanho da fonte
                                      fontWeight: FontWeight.bold, // Peso da fonte (negrito)
                                    ),
                                  ),
                                ]),
                          ]),
                    ),


                  ],
                ),

              ]),

          Divider(

            color: Color(0xff979797),
            thickness: 0.6,
            endIndent: 0,
            indent: 0,

          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Column(
                children: [
                  Text("Remover filtro",
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFF4116B4)
                  ),)

                ],
              ),

              Column(
                children: [
                  Builder(
                    builder: (context) => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: Color(0xFF4116B4)),
                      onPressed: () {

                       // _AposEnviarShowAlertDialog(context);


                      },
                      child: const Text(
                        'Enviar',
                        style: TextStyle(color: Colors.white),
                      ),),
                  ),

                ],
              )

            ],
          ),

          Padding(padding:EdgeInsets.all(10)),

         /* Row(
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
                            const DetalheDaPesquisaAgendamentoDaConsulta()),
                      );
                    },
                    child: const Text(
                      'Enviar',
                      style: TextStyle(color: Color(0xFFBDBECB)),
                    ),),
                ),
              ])*/



        ]),
        actions: const <CupertinoDialogAction>[

        ],
      ),
    );
  }

}


