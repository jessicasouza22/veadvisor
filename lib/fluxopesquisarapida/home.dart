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
                                                context) => const Logado()),
                                      );

                                      //print("clicado na seta");
                                    },
                                    icon: const Icon(Icons.arrow_back))),
                            AutoSizeText(
                              "Serviços",
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
                decoration: const BoxDecoration(
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
                )),


                //color: Color(0xFFF5F5F5),
                child: SingleChildScrollView(
                    child: Column(children: [
                      const Padding(padding: EdgeInsets.only(top: 15)),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Text("O que voce precisa hoje?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,

                      ),),
                      ]),

                      const Padding(padding: EdgeInsets.only(top: 15)),

                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Faça a triagem do seu paciente",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,

                              ),),
                          ]),

                      const Padding(padding: EdgeInsets.only(top: 15)),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Padding(padding: EdgeInsets.only(left: 10)),
                          Icon(Icons.circle, size: 12, color: Colors.green),
                          Padding(padding: EdgeInsets.only(left: 10)),
                          Text(
                            "Cães",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(left: 10)),
                          Icon(Icons.circle, size: 12, color: Colors.grey),
                          Padding(padding: EdgeInsets.only(left: 10)),
                          Text(
                            "Gatos",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(left: 10)),
                          Icon(Icons.circle, size: 12, color: Colors.grey),
                          Padding(padding: EdgeInsets.only(left: 10)),
                          Text(
                            "Pets exóticos",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),

                      const Padding(padding: EdgeInsets.only(top: 15)),

                      Container(


                        margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                        borderRadius: BorderRadius.all( Radius.circular(10))),

                        child: Column(
                            children: [

                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 30,
                                      width: 250,

                                      child:
                                      TextFormField(
                                        //para senha: obscureText: true,

                                        textAlign: TextAlign.left,

                                        style: const TextStyle(
                                          fontSize: 12,
                                        ),
                                        decoration: InputDecoration(
                                          fillColor: const Color(0xFF12EC1A),

                                          // contentPadding: EdgeInsets.fromLTRB(20, 0, 12, 0),
                                          prefixIcon:

                                          Builder(
                                              builder: (context) => IconButton(
                                                  onPressed: () {

                                                    _dialogAddExercicio();

                                                  },
                                                  icon: const Icon(Icons.search,size: 15,
                                                      color: Color(0xFF3C10BB)))),

                                          hintText: "Adicione mais informações",

                                            suffixIcon: const Icon(
                                              MdiIcons.navigationVariant,
                                              size: 15,
                                              color: Color(0xFF3C10BB),

                                            )
                                        ),
                                      ),),




                                  ]),


                            ]),
                      ),


                    Row(

                    children:[

                      Container(
                          margin: const EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 1),
                      child:
                      Text("Minha Area",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),),),
                      ]),

                      Padding(padding: EdgeInsets.all(6)),

                      Row(
                        children: [


                          Column(
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 1),
                                  padding: const EdgeInsets.only(
                                      left: 40, right: 40, top: 5, bottom: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                      children: [

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children:  [

                                            Icon(MdiIcons.calendarEdit,
                                              color: Color(0xFF4116B4),
                                              size: 60,),

                                          ],
                                        ),
                                        Padding(padding: EdgeInsets.all(10)),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: const [
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
                            ],
                          ),

                          Column(
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(left: 60, right: 10, top: 10, bottom: 1),
                                  padding: const EdgeInsets.only(
                                      left: 40, right: 40, top: 5, bottom: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                      children: [

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children:  [

                                            Icon(MdiIcons.dogSide,
                                              color: Color(0xFF4116B4),
                                              size: 60,),

                                          ],
                                        ),
                                        Padding(padding: EdgeInsets.all(10)),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: const [
                                            Text("Meus\npacientes",
                                              style: TextStyle(
                                                color: Color(0xFF4116B4),
                                                fontWeight: FontWeight.bold,

                                              ),),

                                          ],
                                        ),

                                      ]
                                  )
                              ),
                            ],
                          ),







                        ],



                      ),

                      Row(
                        children: [


                          Column(
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 1),
                                  padding: const EdgeInsets.only(
                                      left: 40, right: 40, top: 5, bottom: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  child: Column(
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
                                          children: const [
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
                            ],
                          ),

                          Padding(padding: EdgeInsets.all(30)),

                          Column(
                            children: [
                              Container(
                                //  margin: const EdgeInsets.only(left: 80, right: 10, top: 10, bottom: 1),
                                  padding: const EdgeInsets.only(
                                      left: 40, right: 40, top: 5, bottom: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                      children: [

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children:  [

                                            Icon(MdiIcons.bookOpenPageVariantOutline,
                                              color: Color(0xFF4116B4),
                                              size: 60,),

                                          ],
                                        ),
                                        Padding(padding: EdgeInsets.all(10)),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: const [
                                            Text("Meus\nestudos",
                                              style: TextStyle(
                                                color: Color(0xFF4116B4),
                                                fontWeight: FontWeight.bold,

                                              ),),

                                          ],
                                        ),

                                      ]
                                  )
                              ),
                            ],
                          ),

                     ] ),

                      Padding(padding: EdgeInsets.all(10)),

                      Container(
                          margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
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
                                      Row(
                                          children: [
                                            Text("Ver todos",
                                              style: TextStyle(
                                                color: Color(0xFF8F90A6),
                                                fontSize: 12,
                                              ),),

                                            Icon(MdiIcons.chevronRight, color: Color(0xFF59616E), size: 16)])),

                                    ]),
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

                      Padding(padding: EdgeInsets.all(5)),

                        Row(
                         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                        Container(
                        margin: const EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 1),
                      child:

                      Text(
                        " |  Próximas consultas ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            decoration: TextDecoration.none),
                      )),]),

                      Padding(padding: EdgeInsets.all(10)),

                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Cadastre-se gratuitamente",
                              style: TextStyle(
                                color: Color(0xFFFAD000),
                                fontSize: 24,

                              ),),
                          ]),

                      //Padding(padding: EdgeInsets.all(10)),

                      Container(
                        //color: Colors.white,

                        margin:  EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('imagens/telaHome01.png'),
                            fit: BoxFit.fill,
                            //colorFilter: new ColorFilter.mode(Cores.azulSafe.withOpacity(1), BlendMode.dstATop))
                          ),
                        ),
                        child: Column(

                          children:  const [
                            Padding(padding: EdgeInsets.all(10)),
                            Text("Eleve a experiência do seu cliente",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,

                              ),),

                            Padding(padding: EdgeInsets.all(20)),

                            Text(" Seu nome, especialidade e\n serviços poderão  aparecer \n para os tutores de \n pets de acordo com a sua região.\n Para começar é muito simples,\n cadastre-se agora mesmo!",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,

                              ),),

                            /*Flexible(
                                child: AutoSizeText(
                                  'Seu nome, especialidade e serviços poderão  aparecer para os tutores de pets de acordo com a sua região.   Para começar é muito simples, cadastre-se agora mesmo!',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                  maxLines: 5,
                                  textAlign: TextAlign.justify,
                                )),*/

                          ],
                        ),
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
                    ])),
              )
          )]));
  }
  Future<void> _dialogAddExercicio() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (context, setStateForDialog) {
              return AlertDialog(
                shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                backgroundColor: Colors.white.withOpacity(0.9),
                contentPadding: EdgeInsets.zero,


                title:  Text("Pesquise por sistema (s) ou em\n todo banco de dados'",
                  style: TextStyle(
                      color: Color(0xFF4116B4),
                      fontSize: 18
                  ),),
                              content: SingleChildScrollView(
                    child: Column(
                      children:[
                        Column(
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


                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [



                            Padding(padding: EdgeInsets.all(10)),


                            Radio<SingingCharacterAreaMedica>(
                              value: SingingCharacterAreaMedica.Infecciosos,

                              onChanged: (SingingCharacterAreaMedica? value) {

                                setState(() {

                                });
                              },
                              groupValue: null,
                              fillColor:
                              MaterialStateColor.resolveWith((states) => Colors.grey),
                            ),
                            const Text("Infecciosos",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF4116B4)
                                )
                            ),
                          ],
                        ),

                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                          children: [
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
                            const Text("Dermatologicos",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF4116B4)
                                )
                            ),

                            Padding(padding: EdgeInsets.all(10)),


                            Radio<SingingCharacterAreaMedica>(
                              value: SingingCharacterAreaMedica.MusculoEsqueletico,

                              onChanged: (SingingCharacterAreaMedica? value) {

                                setState(() {

                                });
                              },
                              groupValue: null,
                              fillColor:
                              MaterialStateColor.resolveWith((states) => Colors.grey),
                            ),
                            const Text("Musculo",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF4116B4)
                                )
                            ),
                          ],
                        ),

                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio<SingingCharacterAreaMedica>(
                              value: SingingCharacterAreaMedica.Neurologicos,

                              onChanged: (SingingCharacterAreaMedica? value) {

                                setState(() {

                                });
                              },
                              groupValue: null,

                              fillColor:
                              MaterialStateColor.resolveWith((states) => Colors.grey),
                            ),
                            const Text("Neurológicos",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF4116B4)
                                )
                            ),

                            Padding(padding: EdgeInsets.all(10)),


                            Radio<SingingCharacterAreaMedica>(
                              value: SingingCharacterAreaMedica.MetabolicosEndocrinos,

                              onChanged: (SingingCharacterAreaMedica? value) {

                                setState(() {

                                });
                              },
                              groupValue: null,
                              fillColor:
                              MaterialStateColor.resolveWith((states) => Colors.grey),
                            ),
                            const Text("Metabolicos",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF4116B4)
                                )
                            ),
                          ],
                        ),

                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                          children: [
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
                            const Text("Oncologicos",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF4116B4)
                                )
                            ),

                            Padding(padding: EdgeInsets.all(10)),


                            Radio<SingingCharacterAreaMedica>(
                              value: SingingCharacterAreaMedica.Cardiologicos,

                              onChanged: (SingingCharacterAreaMedica? value) {

                                setState(() {

                                });
                              },
                              groupValue: null,
                              fillColor:
                              MaterialStateColor.resolveWith((states) => Colors.grey),
                            ),
                            const Text("Cardiologicos",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF4116B4)
                                )
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
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
                            const Text("Nefrologicos",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF4116B4)
                                )
                            ),

                            Padding(padding: EdgeInsets.all(10)),


                            Radio<SingingCharacterAreaMedica>(
                              value: SingingCharacterAreaMedica.Hematologicos,

                              onChanged: (SingingCharacterAreaMedica? value) {

                                setState(() {

                                });
                              },
                              groupValue: null,
                              fillColor:
                              MaterialStateColor.resolveWith((states) => Colors.grey),
                            ),
                            const Text("Hematologicos",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF4116B4)
                                )
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
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
                            const Text("Respiratorios",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF4116B4)
                                )
                            ),

                            Padding(padding: EdgeInsets.all(10)),


                            Radio<SingingCharacterAreaMedica>(
                              value: SingingCharacterAreaMedica.Odontologicos,

                              onChanged: (SingingCharacterAreaMedica? value) {

                                setState(() {

                                });
                              },
                              groupValue: null,
                              fillColor:
                              MaterialStateColor.resolveWith((states) => Colors.grey),
                            ),
                            const Text("Odontologicos",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF4116B4)
                                )
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
                            const Text("Toxocologicos",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF4116B4)
                                )
                            ),

                            Padding(padding: EdgeInsets.all(10)),


                            Radio<SingingCharacterAreaMedica>(
                              value: SingingCharacterAreaMedica.Teriogenologicos,

                              onChanged: (SingingCharacterAreaMedica? value) {

                                setState(() {

                                });
                              },
                              groupValue: null,
                              fillColor:
                              MaterialStateColor.resolveWith((states) => Colors.grey),
                            ),
                            const Text("Teriogenologicos",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF4116B4)
                                )
                            ),
                          ],
                        ),

                      ],
                        ),

                        Column(
                          children: [
                            const Text
                              ("Oftalmicos",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF4116B4)
                                )
                            ),
                          ],
                        )
                                ]
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
