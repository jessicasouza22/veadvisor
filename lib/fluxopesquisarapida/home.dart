//1.O HOME FLUXO PESQUISA
import 'package:auto_size_text/auto_size_text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vetadvisor/fluxopesquisarapida/detalheDaPesquisa.dart';
import 'package:vetadvisor/fluxopesquisarapida/servicos.dart';
import 'package:vetadvisor/fluxoprontuariodigital/consultaPaciente.dart';
import 'package:vetadvisor/fluxoprontuariodigital/perfilPaciente.dart';
import 'package:vetadvisor/prelogin/logado.dart';

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

  String _especiePaciente = "Cães";

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
                      children:[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Radio<SingingCharacterAreaMedica>(
                          value: SingingCharacterAreaMedica.Oftalmicos,

                          onChanged: (SingingCharacterAreaMedica? value) {

                            setState(() {

                            });
                          },
                          groupValue: null,
                          fillColor:
                          MaterialStateColor.resolveWith((states) => Colors.grey),
                        ),

                        Radio<SingingCharacterAreaMedica>(
                          value: SingingCharacterAreaMedica.Dermatologicos,

                          onChanged: (SingingCharacterAreaMedica? value) {

                            setState(() {

                            });
                          },
                          groupValue: null,
                          fillColor:
                          MaterialStateColor.resolveWith((states) => Colors.grey),
                        ),

                        Radio<SingingCharacterAreaMedica>(
                          value: SingingCharacterAreaMedica.NefrologicosUrologicos,

                          onChanged: (SingingCharacterAreaMedica? value) {

                            setState(() {

                            });
                          },
                          groupValue: null,
                          fillColor:
                          MaterialStateColor.resolveWith((states) => Colors.grey),
                        ),

                        Radio<SingingCharacterAreaMedica>(
                          value: SingingCharacterAreaMedica.Oncologicos,

                          onChanged: (SingingCharacterAreaMedica? value) {

                            setState(() {

                            });
                          },
                          groupValue: null,
                          fillColor:
                          MaterialStateColor.resolveWith((states) => Colors.grey),
                        ),

                        Radio<SingingCharacterAreaMedica>(
                          value: SingingCharacterAreaMedica.NefrologicosUrologicos,

                          onChanged: (SingingCharacterAreaMedica? value) {

                            setState(() {

                            });
                          },
                          groupValue: null,

                          fillColor:
                          MaterialStateColor.resolveWith((states) => Colors.grey),
                        ),

                        Radio<SingingCharacterAreaMedica>(
                          value: SingingCharacterAreaMedica.Respiratorios,

                          onChanged: (SingingCharacterAreaMedica? value) {

                            setState(() {

                            });
                          },
                          groupValue: null,
                          fillColor:
                          MaterialStateColor.resolveWith((states) => Colors.grey),
                        ),

                        Radio<SingingCharacterAreaMedica>(
                          value: SingingCharacterAreaMedica.Toxocologicos,

                          onChanged: (SingingCharacterAreaMedica? value) {

                            setState(() {

                            });
                          },
                          groupValue: null,
                          fillColor:
                          MaterialStateColor.resolveWith((states) => Colors.grey),
                        ),

                                      ],
                        ),

                        const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                        Text("Oftálmícos",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF4116B4)
                            )
                        ),
                        ]),
                        Padding(padding: EdgeInsets.only(bottom: 40)),

                        Row(
                            children: [
                              Text("Dermatológicos",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF4116B4)
                                  )
                              ),
                            ]),

                        Padding(padding: EdgeInsets.only(bottom: 40)),

                        Row(
                            children: [
                              Text("Neurológicos",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF4116B4)
                                  )
                              ),
                            ]),

                        Padding(padding: EdgeInsets.only(bottom: 40)),

                        Row(
                            children: [
                              Text("Oncológicos",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF4116B4)
                                  )
                              ),
                            ]),

                        Padding(padding: EdgeInsets.only(bottom: 50)),

                        Row(
                            children: [
                              Text("Nefrológicos e\n urológicos",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF4116B4)
                                  )
                              ),
                            ]),

                        Padding(padding: EdgeInsets.only(bottom: 40)),

                        Row(
                            children: [
                              Text("Toxocológicos",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF4116B4)
                                  )
                              ),
                            ]),


                      ],
                    ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Radio<SingingCharacterAreaMedica>(
                              value: SingingCharacterAreaMedica.Oftalmicos,

                              onChanged: (SingingCharacterAreaMedica? value) {

                                setState(() {

                                });
                              },
                              groupValue: null,
                              fillColor:
                              MaterialStateColor.resolveWith((states) => Colors.grey),
                            ),

                            Radio<SingingCharacterAreaMedica>(
                              value: SingingCharacterAreaMedica.Dermatologicos,

                              onChanged: (SingingCharacterAreaMedica? value) {

                                setState(() {

                                });
                              },
                              groupValue: null,
                              fillColor:
                              MaterialStateColor.resolveWith((states) => Colors.grey),
                            ),

                            Radio<SingingCharacterAreaMedica>(
                              value: SingingCharacterAreaMedica.NefrologicosUrologicos,

                              onChanged: (SingingCharacterAreaMedica? value) {

                                setState(() {

                                });
                              },
                              groupValue: null,
                              fillColor:
                              MaterialStateColor.resolveWith((states) => Colors.grey),
                            ),

                            Radio<SingingCharacterAreaMedica>(
                              value: SingingCharacterAreaMedica.Oncologicos,

                              onChanged: (SingingCharacterAreaMedica? value) {

                                setState(() {

                                });
                              },
                              groupValue: null,
                              fillColor:
                              MaterialStateColor.resolveWith((states) => Colors.grey),
                            ),

                            Radio<SingingCharacterAreaMedica>(
                              value: SingingCharacterAreaMedica.NefrologicosUrologicos,

                              onChanged: (SingingCharacterAreaMedica? value) {

                                setState(() {

                                });
                              },
                              groupValue: null,

                              fillColor:
                              MaterialStateColor.resolveWith((states) => Colors.grey),
                            ),

                            Radio<SingingCharacterAreaMedica>(
                              value: SingingCharacterAreaMedica.Respiratorios,

                              onChanged: (SingingCharacterAreaMedica? value) {

                                setState(() {

                                });
                              },
                              groupValue: null,
                              fillColor:
                              MaterialStateColor.resolveWith((states) => Colors.grey),
                            ),

                            Radio<SingingCharacterAreaMedica>(
                              value: SingingCharacterAreaMedica.Toxocologicos,

                              onChanged: (SingingCharacterAreaMedica? value) {

                                setState(() {

                                });
                              },
                              groupValue: null,
                              fillColor:
                              MaterialStateColor.resolveWith((states) => Colors.grey),
                            ),

                          ],
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                                children: [
                                  Text("Oftálmícos",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF4116B4)
                                      )
                                  ),
                                ]),
                            Padding(padding: EdgeInsets.only(bottom: 40)),

                            Row(
                                children: [
                                  Text("Dermatológicos",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF4116B4)
                                      )
                                  ),
                                ]),

                            Padding(padding: EdgeInsets.only(bottom: 40)),

                            Row(
                                children: [
                                  Text("Neurológicos",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF4116B4)
                                      )
                                  ),
                                ]),

                            Padding(padding: EdgeInsets.only(bottom: 40)),

                            Row(
                                children: [
                                  Text("Oncológicos",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF4116B4)
                                      )
                                  ),
                                ]),

                            Padding(padding: EdgeInsets.only(bottom: 50)),

                            Row(
                                children: [
                                  Text("Nefrológicos e\n urológicos",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF4116B4)
                                      )
                                  ),
                                ]),

                            Padding(padding: EdgeInsets.only(bottom: 40)),

                            Row(
                                children: [
                                  Text("Toxocológicos",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF4116B4)
                                      )
                                  ),
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
                                        builder: (context) => const DetalheDaPesquisa()),
                                  );
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const DetalheDaPesquisa()),
                                  );
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



});}}
