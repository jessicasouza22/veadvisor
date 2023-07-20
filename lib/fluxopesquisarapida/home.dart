//1.O HOME FLUXO PESQUISA
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vetadvisor/fluxopesquisarapida/detalheDaPesquisa.dart';
import 'package:vetadvisor/fluxopesquisarapida/servicos.dart';
import 'package:vetadvisor/fluxoprontuariodigital/consultaPaciente.dart';
import 'package:vetadvisor/fluxoprontuariodigital/perfilPaciente.dart';
import 'package:vetadvisor/prelogin/logado.dart';
import 'dart:developer' as logDev;

enum SingingCharacterAreaMedica{ Oftalmicos, Infecciosos, Dermatologicos, MusculoEsqueletico, Neurologicos, MetabolicosEndocrinos, Oncologicos, Cardiologicos, NefrologicosUrologicos, Hematologicos, Respiratorios, Odontologicos, Toxocologicos, Teriogenologicos}


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _formKey = GlobalKey<FormState>();

  final _busca = TextEditingController();

  String _especiePaciente = "Cães";

  List<String> _disturbiosSelecionados = [];

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
                                          builder: (
                                              context) => const PerfilPaciente()));
                                    },
                                  icon: const Icon(MdiIcons.menu))),
                          const Text("Serviços",
                            style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                },
                              icon: const Icon(MdiIcons.bellBadgeOutline))
                        ]
                      )
                  )
              )
            ]
      ),
      body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
                hasScrollBody: true,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  color:  Color(0xFF3C10BB),
                  child: SingleChildScrollView(
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            const Padding(padding: EdgeInsets.only(top: 15)),

                            const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("O que voce precisa hoje?",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24)
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
                                      groupValue: _especiePaciente,
                                      onChanged: (value) {
                                        setState(() {
                                          _especiePaciente = value!;

                                        });
                                        },

                                      fillColor:
                                      MaterialStateColor.resolveWith((states) => Colors.green),
                                    ),

                                    const Text("Cães",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white)
                                    )
                                  ]
                                ),

                                Row(
                                  children: [
                                    Radio(
                                        value: "Gatos",
                                        groupValue: _especiePaciente,
                                        fillColor:
                                        MaterialStateColor.resolveWith((states) => Colors.green),
                                        onChanged: (value) {
                                          setState(() {
                                            _especiePaciente = value!;
                                          });
                                        }
                                    ),
                                    const Text("Gatos",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white
                                        )
                                    )
                                  ],
                                ),

                                Row(
                                  children: [
                                    Radio(
                                        value: "Pets exóticos",
                                        groupValue: _especiePaciente,
                                        fillColor:
                                        MaterialStateColor.resolveWith((states) => Colors.green),
                                        onChanged: (value) {
                                          setState(() {
                                            _especiePaciente = value!;
                                          });

                                        }
                                    ),
                                    const Text("Pets exóticos",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white
                                        )
                                    )
                                  ]
                                )
                              ],
                            ),


                            Container(

                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all( Radius.circular(10))),

                              child: Column(
                                  children: [
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 30,
                                            width: 350,

                                            child: TextFormField(
                                              controller: _busca,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(fontSize: 12),
                                              decoration: InputDecoration(
                                                  fillColor: const Color(0xFF12EC1A),
                                                  prefixIcon: IconButton(
                                                          onPressed: () {

                                                          },
                                                          icon: const Icon(
                                                              Icons.search,
                                                              size: 15,
                                                              color: Color(0xFF3C10BB))
                                                  ),
                                                  suffixIcon: IconButton(
                                                    icon: const Icon(MdiIcons.navigationVariant, size: 15),
                                                    color: const Color(0xFF3C10BB),
                                                    onPressed: () {

                                                      _dialogAddExercicio();
                                                      //_buscaDoencas();
                                                  },

                                                  )
                                              ),
                                            ),
                                          ),
                                        ]
                                    ),
                                  ]
                              ),
                            ),

                            Padding(padding: EdgeInsets.all(15)),


                            Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 30, right: 30),
                                    child: Text("Minha Area",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16
                                        )
                                    )
                                  ),

                                  const Padding(padding: EdgeInsets.all(15)),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          padding: const EdgeInsets.only(left: 40, right: 40, top: 5, bottom: 10),
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                                            color: Colors.white),
                                          child: const Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children:  [
                                                    Icon(MdiIcons.calendarEdit,
                                                      color: Color(0xFF4116B4),
                                                      size: 60)
                                                  ]
                                                ),
                                                Padding(padding: EdgeInsets.all(10)),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text("Minha\nagenda",
                                                      style: TextStyle(
                                                        color: Color(0xFF4116B4),
                                                        fontWeight: FontWeight.bold,
                                                      ),),

                                                  ],
                                                ),
                                              ]
                                          )
                                      ),

                                      const Padding(padding: EdgeInsets.only(left:10, right: 10)),

                                      Container(
                                          padding: const EdgeInsets.only(
                                              left: 40, right: 40, top: 5, bottom: 10),
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                                          child: const Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children:  [
                                                    Icon(MdiIcons.dogSide,
                                                      color: Color(0xFF4116B4),
                                                      size: 60)
                                                  ],
                                                ),

                                                Padding(padding: EdgeInsets.all(10)),

                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text("Meus\npacientes",
                                                      style: TextStyle(
                                                        color: Color(0xFF4116B4),
                                                        fontWeight: FontWeight.bold
                                                      )
                                                    )
                                                  ]
                                                )
                                              ]
                                          )
                                      )
                                    ]
                                  ),

                                  const Padding(padding: EdgeInsets.only(top:20)),

                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            padding: const EdgeInsets.only(
                                                left: 40, right: 40, top: 5, bottom: 10),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: Colors.white,
                                            ),
                                            child: const Column(
                                                children: [

                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children:  [

                                                      Icon(MdiIcons.notebookEditOutline,
                                                        color: Color(0xFF4116B4),
                                                        size: 60,),

                                                    ],
                                                  ),
                                                  Padding(padding: EdgeInsets.all(10)),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text("Exames\nliberados",
                                                        style: TextStyle(
                                                          color: Color(0xFF4116B4),
                                                          fontWeight: FontWeight.bold,
                                                        ),),

                                                    ],
                                                  ),
                                                ]
                                            )
                                        ),
                                        const Padding(padding: EdgeInsets.only(left:10, right: 10)),
                                        Container(
                                          //  margin: const EdgeInsets.only(left: 80, right: 10, top: 10, bottom: 1),
                                            padding: const EdgeInsets.only(
                                                left: 40, right: 40, top: 5, bottom: 10),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: Colors.white,
                                            ),
                                            child: const Column(
                                                children: [

                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children:  [
                                                      Icon(MdiIcons.bookOpenPageVariantOutline,
                                                        color: Color(0xFF4116B4),
                                                        size: 60)
                                                    ]
                                                  ),

                                                  Padding(padding: EdgeInsets.all(10)),

                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text("Meus\nestudos",
                                                        style: TextStyle(
                                                          color: Color(0xFF4116B4),
                                                          fontWeight: FontWeight.bold,
                                                        )
                                                      )
                                                    ],
                                                  ),
                                                ]
                                            )
                                        )
                                      ]
                                  )
                                ]
                              )
                            ),

                            const Padding(padding: EdgeInsets.all(10)),

                            const Padding(padding: EdgeInsets.only(left:20, right: 20),
                                child: Center(
                                  child: AutoSizeText("Cadastre-se gratuitamente",
                                    style: TextStyle(
                                      color: Color(0xFFFAD000),
                                      fontSize: 24
                                    ),
                                  ),
                                )
                              ),
                            const Padding(padding: EdgeInsets.all(10)),

                            const Padding(padding: EdgeInsets.only(left:20, right: 20),
                                child: Center(
                                  child: AutoSizeText(
                                    'Seu nome, especialidade e serviços poderão  aparecer para os tutores de pets de acordo com a sua região. Para começar é muito simples, cadastre-se agora mesmo!',
                                    style: TextStyle(
                                      fontSize: 240,
                                      color: Colors.grey,
                                    ),
                                    maxLines: 5,
                                    textAlign: TextAlign.justify,
                                  ),
                                )
                            ),

                            const Padding(padding: EdgeInsets.all(10)),
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
                  title:  const Text("Pesquise por sistema (s) ou em\n todo banco de dados'",
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
                                              if(!_disturbiosSelecionados.contains("Distúrbios oftalmológicos")) {
                                                if(_disturbiosSelecionados.length < 10) {
                                                  _disturbiosSelecionados.add("Distúrbios oftalmológicos");
                                                  _disturbios["Distúrbios oftalmológicos"] = !_disturbios["Distúrbios oftalmológicos"]!;
                                                } else {
                                                  _dialogNumeroMaximoDeDisturbios();
                                                }

                                              }
                                            } else {
                                              _disturbiosSelecionados.remove("Distúrbios oftalmológicos");
                                              _disturbios["Distúrbios oftalmológicos"] = !_disturbios["Distúrbios oftalmológicos"]!;
                                            }





                                        print(_disturbiosSelecionados.toString());
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
                                          if (!_disturbiosSelecionados.contains("Distúrbios dermatológicos")) {
                                            if (_disturbiosSelecionados.length < 10) {
                                              _disturbiosSelecionados.add("Distúrbios dermatológicos");
                                              _disturbios["Distúrbios dermatológicos"] = !_disturbios["Distúrbios dermatológicos"]!;
                                            } else {
                                              _dialogNumeroMaximoDeDisturbios();
                                            }
                                          }
                                        } else {
                                          _disturbiosSelecionados.remove("Distúrbios dermatológicos");
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
                                          if (!_disturbiosSelecionados.contains("Distúrbios neurológicos")) {
                                            if (_disturbiosSelecionados.length < 10) {
                                              _disturbiosSelecionados.add("Distúrbios neurológicos");
                                              _disturbios["Distúrbios neurológicos"] = !_disturbios["Distúrbios neurológicos"]!;
                                            } else {
                                              _dialogNumeroMaximoDeDisturbios();
                                            }
                                          }
                                        } else {
                                          _disturbiosSelecionados.remove("Distúrbios neurológicos");
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
                                          if (!_disturbiosSelecionados.contains("Distúrbios oncológicos")) {
                                            if (_disturbiosSelecionados.length < 10) {
                                              _disturbiosSelecionados.add("Distúrbios oncológicos");
                                              _disturbios["Distúrbios oncológicos"] = !_disturbios["Distúrbios oncológicos"]!;
                                            } else {
                                              _dialogNumeroMaximoDeDisturbios();
                                            }
                                          }
                                        } else {
                                          _disturbiosSelecionados.remove("Distúrbios oncológicos");
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
                                          if (!_disturbiosSelecionados.contains("Distúrbios nefrológicos e urológicos")) {
                                            if (_disturbiosSelecionados.length < 10) {
                                              _disturbiosSelecionados.add("Distúrbios nefrológicos e urológicos");
                                              _disturbios["Distúrbios nefrológicos e urológicos"] = !_disturbios["Distúrbios nefrológicos e urológicos"]!;
                                            } else {
                                              _dialogNumeroMaximoDeDisturbios();
                                            }
                                          }
                                        } else {
                                          _disturbiosSelecionados.remove("Distúrbios nefrológicos e urológicos");
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
                                          if (!_disturbiosSelecionados.contains("Distúrbios respiratórios")) {
                                            if (_disturbiosSelecionados.length < 10) {
                                              _disturbiosSelecionados.add("Distúrbios respiratórios");
                                              _disturbios["Distúrbios respiratórios"] = !_disturbios["Distúrbios respiratórios"]!;
                                            } else {
                                              _dialogNumeroMaximoDeDisturbios();
                                            }
                                          }
                                        } else {
                                          _disturbiosSelecionados.remove("Distúrbios respiratórios");
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
                                          if (!_disturbiosSelecionados.contains("Distúrbios toxicológicos")) {
                                            if (_disturbiosSelecionados.length < 10) {
                                              _disturbiosSelecionados.add("Distúrbios toxicológicos");
                                              _disturbios["Distúrbios toxicológicos"] = !_disturbios["Distúrbios toxicológicos"]!;
                                            } else {
                                              _dialogNumeroMaximoDeDisturbios();
                                            }
                                          }
                                        } else {
                                          _disturbiosSelecionados.remove("Distúrbios toxicológicos");
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
                                            if (!_disturbiosSelecionados.contains("Distúrbios infecciosos")) {
                                              if (_disturbiosSelecionados.length < 10) {
                                                _disturbiosSelecionados.add("Distúrbios infecciosos");
                                                _disturbios["Distúrbios infecciosos"] = !_disturbios["Distúrbios infecciosos"]!;
                                              } else {
                                                _dialogNumeroMaximoDeDisturbios();
                                              }
                                            }
                                          } else {
                                          _disturbiosSelecionados.remove("Distúrbios infecciosos");
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
                                            if (!_disturbiosSelecionados.contains("Distúrbios musculoesqueléticos")) {
                                              if (_disturbiosSelecionados.length < 10) {
                                                _disturbiosSelecionados.add("Distúrbios musculoesqueléticos");
                                                _disturbios["Distúrbios musculoesqueléticos"] = !_disturbios["Distúrbios musculoesqueléticos"]!;
                                              } else {
                                                _dialogNumeroMaximoDeDisturbios();
                                              }
                                            }
                                          } else {
                                            _disturbiosSelecionados.remove("Distúrbios musculoesqueléticos");
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
                                            if (!_disturbiosSelecionados.contains("Distúrbios metabólicos e endócrinos")) {
                                              if (_disturbiosSelecionados.length < 10) {
                                                _disturbiosSelecionados.add("Distúrbios metabólicos e endócrinos");
                                                _disturbios["Distúrbios metabólicos e endócrinos"] = !_disturbios["Distúrbios metabólicos e endócrinos"]!;
                                              } else {
                                                _dialogNumeroMaximoDeDisturbios();
                                              }
                                            }
                                          } else {
                                            _disturbiosSelecionados.remove("Distúrbios metabólicos e endócrinos");
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
                                            if (!_disturbiosSelecionados.contains("Distúrbios cardiológicos")) {
                                              if (_disturbiosSelecionados.length < 10) {
                                                _disturbiosSelecionados.add("Distúrbios cardiológicos");
                                                _disturbios["Distúrbios cardiológicos"] = !_disturbios["Distúrbios cardiológicos"]!;
                                              } else {
                                                _dialogNumeroMaximoDeDisturbios();
                                              }
                                            }
                                          } else {
                                            _disturbiosSelecionados.remove("Distúrbios cardiológicos");
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
                                            if (!_disturbiosSelecionados.contains("Distúrbios hematológicos")) {
                                              if (_disturbiosSelecionados.length < 10) {
                                                _disturbiosSelecionados.add("Distúrbios hematológicos");
                                                _disturbios["Distúrbios hematológicos"] = !_disturbios["Distúrbios hematológicos"]!;
                                              } else {
                                                _dialogNumeroMaximoDeDisturbios();
                                              }
                                            }
                                          } else {
                                            _disturbiosSelecionados.remove("Distúrbios hematológicos");
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
                                            if (!_disturbiosSelecionados.contains("Distúrbios odontológicos")) {
                                              if (_disturbiosSelecionados.length < 10) {
                                                _disturbiosSelecionados.add("Distúrbios odontológicos");
                                                _disturbios["Distúrbios odontológicos"] = !_disturbios["Distúrbios odontológicos"]!;
                                              } else {
                                                _dialogNumeroMaximoDeDisturbios();
                                              }
                                            }
                                          } else {
                                            _disturbiosSelecionados.remove("Distúrbios odontológicos");
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
                                            if (!_disturbiosSelecionados.contains("Distúrbios teriogenológicos")) {
                                              if (_disturbiosSelecionados.length < 10) {
                                                _disturbiosSelecionados.add("Distúrbios teriogenológicos");
                                                _disturbios["Distúrbios teriogenológicos"] = !_disturbios["Distúrbios teriogenológicos"]!;
                                              } else {
                                                _dialogNumeroMaximoDeDisturbios();
                                              }
                                            }
                                          } else {
                                            _disturbiosSelecionados.remove("Distúrbios teriogenológicos");
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
                                  _buscaDoencas(false);
                                  /*
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const DetalheDaPesquisa()),
                                  );

                                   */
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: const StadiumBorder(),
                                    backgroundColor: Color(0XFF4116B4)),
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
                                  _buscaDoencas(true);
                                  /*
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const DetalheDaPesquisa()),
                                  );

                                   */


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

  Future<void> _buscaDoencas(bool buscaCompleta) async {

    var querySnapshot;


    if(buscaCompleta) {
      querySnapshot = await FirebaseFirestore.instance.collection("doencas").get();
    } else {
      querySnapshot = await FirebaseFirestore.instance.collection("doencas")
          .where("disturbio", whereIn: _disturbiosSelecionados)
          .get();
    }


    for (var document in querySnapshot.docs) {
      var sinal = "";
      //var doenca = Doenca();
      //doenca.ranking = 1;
      //logDev.log(document.data().toString());
      String sinais = document.data()["sinais"].toString();
      for (var i = 0; i < sinais.length; i++) {
        var char = sinais[i];
        if (char != ";") {
          sinal += char;
          //print(sinal.toString());
        } else {



          if(sinal.toString() == _busca.text) {
            print(document.data()["nome"].toString());
          }
          sinal = "";
          /*
          if (sintomasRecebidos.contains(sinal)) {
            doenca.nome = document.data()["nome"].toString();

            if (!listaDoencas.any((item) => item.nome == doenca.nome)) {
              if (document.data()["especie"].toString() == especieAnimal) {
                doenca.ranking++;
              }

              var etaria = "";
              String etariaData = document.data()["etaria"].toString();
              for (var j = 0; j < etariaData.length; j++) {
                var char = etariaData[j];
                if (char != ";") {
                  etaria += char;
                } else if (etaria == idadeAnimal) {
                  doenca.ranking++;
                  etaria = "";
                }
              }

              var sinais = "";
              for (var j = 0; j < sinais.length; j++) {
                var char = sinais[j];
                if (char != ";") {
                  sinais += char;
                } else if (sinais == sintomasAnimal) {
                  doenca.ranking++;
                  sinais = "";
                }
              }

              var especie = "";
              String especieData = document.data()["especie"].toString();
              for (var j = 0; j < especieData.length; j++) {
                var char = especieData[j];
                if (char != ";") {
                  especie += char;
                } else if (especie == especieAnimal) {
                  doenca.ranking++;
                  especie = "";
                }
              }

              if (document.data()["porte"].toString() == porteAnimal) {
                doenca.ranking++;
              }

              if (document.data()["racial"].toString() == racaAnimal) {
                doenca.ranking++;
              }

              if (especieAnimal == "Cães") {
                String especieData = document.data()["especie"].toString();
                if (especieData == "Cães" ||
                    especieData == "Cães;Gatos" ||
                    especieData == "Gatos;Cães") {
                  listaDoencas.add(doenca);
                }
              } else if (especieAnimal == "Gatos") {
                String especieData = document.data()["especie"].toString();
                if (especieData == "Gatos" ||
                    especieData == "Cães;Gatos" ||
                    especieData == "Gatos;Cães") {
                  listaDoencas.add(doenca);
                }
              }
            }
            sinal = "";
          }

           */


        }
      }
    }

    /*

    listaDoencas.sort((a, b) => b.ranking.compareTo(a.ranking));

    setState(() {
      _listaDoencas = listaDoencas;
    });

     */


  }

}
