// 1.3 Detalhe Da Pesquisa Dermatite Atopica

import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vetadvisor/fluxopesquisarapida/detalheDaPesquisa.dart';
import 'package:vetadvisor/fluxopesquisarapida/detalheDaPesquisaExameRecomendado.dart';

import 'package:vetadvisor/fluxopesquisarapida/home.dart';
import 'package:vetadvisor/fluxoprontuariodigital/consultaPaciente.dart';
import 'package:vetadvisor/fluxoprontuariodigital/perfilPaciente.dart';
import '../firebase_options.dart';


class DetalheDaPesquisaDermatiteAtopica extends StatelessWidget {
  const DetalheDaPesquisaDermatiteAtopica({super.key});

  @override
  Widget build(BuildContext context) {
    return const DetalheDaPesquisaDermatiteAtopicaPage();
  }
}

class DetalheDaPesquisaDermatiteAtopicaPage extends StatefulWidget {
  const DetalheDaPesquisaDermatiteAtopicaPage({Key? key}) : super(key: key);

  @override
  State<DetalheDaPesquisaDermatiteAtopicaPage> createState() => _DetalheDaPesquisaDermatiteAtopicaPageState();
}

class _DetalheDaPesquisaDermatiteAtopicaPageState extends State<DetalheDaPesquisaDermatiteAtopicaPage> {



  void initState(){
    super.initState();
    print("oi");
    _dialogAddExercicio();
    mostrarAlerta();
  }

  String _nomeUsuarioLogado = "";

  late final FirebaseAuth auth;
  late final FirebaseApp app;

  //late Future<void> _initializeVideoPlayerFuture;

  @override
  // aqui inicia o vídeo controller



  void mostrarAlerta() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context)
        {
          return Container(
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.only(left: 30, right: 30, top: 200,bottom: 500),
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

                Row(
                  children: [
                    Icon(
                      MdiIcons.alertCircleOutline,
                      size: 22,
                      color: Colors.pink,
                    ),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Text(
                      "Você sabia que dá para gerar um novo resultados a\npartir desta enfermidade, basta clicar no mais (+) e\nautomaticamente ele virá para a barra de pesquisa.\nDessa forma permitindo realizar uma nova pesquisa ",
                      style: TextStyle(color: Color(0xff59616E), fontSize: 8),
                    )
                  ],
                ),

              ]));
        },
      );
    });
  }

  Future<void> carregaDadosLogin() async {
    app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    auth = FirebaseAuth.instanceFor(app: app);

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        //print('User is currently signed out!');
      } else {
        //print('User is currently signed in!');
        setState(() {
          _nomeUsuarioLogado = auth.currentUser!.email.toString();
        });

        //print('User is signed in!');
      }
    });
  }


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
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
                                          builder: (
                                              context) => const PerfilPaciente()),
                                    );

                                    //print("clicado na seta");
                                  },
                                  icon: const Icon(Icons.arrow_back))),
                          Text(
                            "Detalhe da pesquisa",
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
                color: Color(0xFFF5F5F5),
                child: SingleChildScrollView(
                    child: Column(
                        children: [
                          Padding(padding: EdgeInsets.only(top: 10)),

                          Container(


                            margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all( Radius.circular(10))),

                            child: Column(
                                children: [

                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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



                                                        },
                                                        icon: const Icon(Icons.search,size: 15,
                                                            color: Color(0xFF979797)))),

                                                hintText: "Adicione mais informações",

                                                suffixIcon: const Icon(
                                                  MdiIcons.navigationVariant,
                                                  size: 15,
                                                  color: Color(0xFF979797),

                                                )
                                            ),
                                          ),),




                                      ]),







                                ]),
                          ),

                          Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all( Radius.circular(10))),

                              child: Text("Prurido generalizado; Maneios de cabeça; Febre",
                                style: TextStyle(
                                    color:  Color(0xFF8F90A6)
                                ),),),


                          Padding(padding: EdgeInsets.only(top: 10)),


                          Container(

                            padding: EdgeInsets.only(left: 10, right: 10),
                            margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all( Radius.circular(10)),
                               /* boxShadow: [
                                  BoxShadow(
                                      color: const Color(0xFF000000),
                                      offset: Offset.zero,
                                      blurRadius: 0.0,
                                      spreadRadius: 0.0
                                  ),
                                ]
                                */),


                            child: Column(

                              children: [
                                Padding(padding: EdgeInsets.only(top: 5)),


                          Container(

                            padding: EdgeInsets.only(left: 10, right: 10),
                            margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all( Radius.circular(20)),


                            ),


                            child: Column(

                              children: [
                                Padding(padding: EdgeInsets.only(top: 5)),

                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Dermatite atópica",
                                          style: TextStyle(
                                              //color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: const Color(0xFF4116B4),
                                          )

                                      ),

                                    ]),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(Icons.star,
                                      color: Colors.yellow,
                                      size: 10,),
                                    Icon(Icons.star,
                                      color: Colors.yellow,
                                      size: 10,),
                                    Icon(Icons.star,
                                      color: Colors.yellow,
                                      size: 10,),
                                    Icon(Icons.star,
                                      color: Colors.yellow,
                                      size: 10,),
                                    Icon(Icons.star,
                                      color: Colors.transparent,
                                      size: 10,),


                                  ],
                                ),

                                Padding(padding: EdgeInsets.only(top: 15)),

                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Achados clínicos",
                                          style: TextStyle(
                                              color: Color(0xFF59616E),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                          )

                                      ),

                                    ]),

                                Padding(padding: EdgeInsets.only(top: 15)),

                                Row(
                                  children: [


                                    Flexible(
                                        child: AutoSizeText(
                                          'Prurido + , Dermatite pruriginosa não sazonal + , Êmeses + , Diarreia + , Perda de peso  + , Pápula + , Pústula + , Alopecia perianal +   , Eritema  +  , Liquenificação  +  , Otite externa  +  , Desconforto abdominal  +  , Lesões na face +  , Lesões nas patas  +  , Lesões nas axilas +   , Lesões na região perilabial +  , Lesões na região perineal  + , Hiperpigmentação   +',
                                          style: TextStyle(
                                            color: Color(0xFF59616E),
                                            fontSize: 10,
                                            //fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 8,
                                          textAlign: TextAlign.justify,
                                        )),


                                    ]),
                                Padding(padding: EdgeInsets.only(top: 10)),
                                  ],),),


                          Container(

                      padding: EdgeInsets.only(left: 10, right: 10),
                      margin: EdgeInsets.only(left: 20, right: 20, top: 10),


                      child:Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Exames recomendados",
                                    style: TextStyle(
                                      color: Color(0xFF59616E),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    )

                                ),

                              ])),

                          Padding(padding: EdgeInsets.only(top: 10)),

                          Container(

                            padding: EdgeInsets.only(left: 10, right: 10),
                            margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all( Radius.circular(10))),

                            child: Column(

                              children: [
                                Padding(padding: EdgeInsets.only(top: 5)),

                                Row(
                                    children: [


                                      Flexible(
                                          child: AutoSizeText(
                                            'Dieta de eliminação , Níveis séricos de Folato e Cobalamina (Vitamina B12)',
                                            style: TextStyle(
                                              color: Color(0xFF59616E),
                                              fontSize: 10,
                                              //fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 2,
                                            textAlign: TextAlign.justify,
                                          )),


                                    ]),
                                Padding(padding: EdgeInsets.only(top: 10)),
                              ],),),

                          Padding(padding: EdgeInsets.only(top: 10)),

                          Container(

                            padding: EdgeInsets.only(left: 10, right: 10),
                            margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all( Radius.circular(10))),

                            child: Column(

                              children: [
                                Padding(padding: EdgeInsets.only(top: 5)),

                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Fatores de risco",
                                          style: TextStyle(
                                            color: Color(0xFF59616E),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          )

                                      ),

                                    ]),

                                Padding(padding: EdgeInsets.only(top: 15)),

                                Row(
                                    children: [
                                      Flexible(
                                          child: AutoSizeText(
                                            'Hereditariedade +   , Fontes proteicas com mais de 18 mil daltons',
                                            style: TextStyle(
                                              color: Color(0xFF59616E),
                                              fontSize: 10,
                                              //fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 8,
                                            textAlign: TextAlign.justify,
                                          )),


                                    ]),
                                Padding(padding: EdgeInsets.only(top: 10)),
                              ],),),



                          Padding(padding: EdgeInsets.only(top: 10)),
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
                                                backgroundColor: Colors.white),
                                            child:
                                            Row(
                                                children: [
                                                  Text(
                                                    'Pesquisar por diagnósticos diferenciais dessa enfermidade',
                                                    style: TextStyle(
                                                        color: Color(0xFF4116B4), fontSize: 8),

                                                  ),
                                                    ])
                                        )),
                                  ],
                                ),

                              ],),),

                          Container(
                              padding: const EdgeInsets.all(2),
                              //  margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: const Color(0xFF4116B4),
                              ),
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 10,
                              )),

                          Padding(padding: EdgeInsets.only(top: 8)),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Builder(
                                  builder: (context) => ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => const DetalheDaPesquisaExameRecomendado()),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                          shape: const StadiumBorder(),
                                          backgroundColor: Color(0XFF4116B4)),
                                      child:
                                      Row(
                                          children: [
                                            Text(
                                              'Finalizar',
                                              style: TextStyle(color: Colors.white),

                                            ),])
                                  )),
                            ],
                          ),

                          Padding(padding: EdgeInsets.only(top: 8)),

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
                                      child:
                                      Row(
                                          children: [
                                            Text(
                                              'Quero compartilhe este resultado',
                                              style: TextStyle(color: Colors.white),

                                            ),
                                            Padding(padding: EdgeInsets.only(left: 10)),
                                            Icon(MdiIcons.shareVariantOutline,
                                              color: Colors.white,
                                              size: 20,),  ])
                                  )),
                            ],
                          ),

                          Container(
                            margin: const EdgeInsets.only(left: 10, right: 10, top: 185),
                            padding: const EdgeInsets.only(bottom: 10),
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
                                  TabBar(
                                      indicatorColor: Colors.transparent,
                                      tabs: [
                                        Tab(
                                          icon: Icon(
                                            MdiIcons.home, color: Colors.grey, size: 30,),
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
                        ])
                ),
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
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                backgroundColor: Colors.white.withOpacity(0.9),
                //backgroundColor: Colors.white,

                title:  Text("Pesquise por sistema (s) ou em\n todo banco de dados'",
                  style: TextStyle(
                      color: Color(0xFF4116B4),
                      fontSize: 18
                  ),),
                /*Flexible(
                    child: AutoSizeText(
                      'Pesquise por sistema (s) ou em\n todo banco de dados',
                      style: TextStyle(
                          color: Color(0xFF4116B4),
                          fontSize: 20
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    )),*/
                content: SingleChildScrollView(
                    child: Column(
                      children: [


                        Row(
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
                            const Text("Oftalmicos",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF4116B4)
                                )
                            ),

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
                                    fontSize: 14,
                                    color: Color(0xFF4116B4)
                                )
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    fontSize: 14,
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
                                    fontSize: 14,
                                    color: Color(0xFF4116B4)
                                )
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    fontSize: 14,
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
                                    fontSize: 14,
                                    color: Color(0xFF4116B4)
                                )
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    fontSize: 14,
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
                                    fontSize: 14,
                                    color: Color(0xFF4116B4)
                                )
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    fontSize: 14,
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
                                    fontSize: 14,
                                    color: Color(0xFF4116B4)
                                )
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    fontSize: 14,
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
                                    fontSize: 14,
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
                                    fontSize: 14,
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
                                    fontSize: 14,
                                    color: Color(0xFF4116B4)
                                )
                            ),
                          ],
                        ),

                      ],
                    )




                  /*Form(
                      key: _formKey,
                      child: ListBody(
                        children: <Widget>[
                          Text("Esse exercício será adicionado ao programa: "),
                          const Padding(padding: EdgeInsets.only(bottom: 10)),
                          TextFormField(
                            style: const TextStyle(

                            ),
                            controller: _nome,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Nome",
                              labelStyle: TextStyle(

                              ),

                            ),
                            validator: (text){
                              if(text == null || text.isEmpty){
                                return "Por favor, digite o nome do exercício.";
                              }
                            },
                          ),

                          const Padding(padding: EdgeInsets.only(bottom: 10)),

                          TextFormField(
                            style: const TextStyle(

                            ),
                            controller: _repeticoes,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Repetições",
                              labelStyle: TextStyle(

                              ),

                            ),
                            validator: (text){
                              if(text == null || text.isEmpty){
                                return "Por favor, digite a quantidade de repetições.";
                              }
                            },
                          ),

                          const Padding(padding: EdgeInsets.only(bottom: 10)),

                          TextFormField(
                            style: const TextStyle(

                            ),
                            controller: _sequencia,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Sequência",
                              labelStyle: TextStyle(

                              ),

                            ),
                            validator: (text){
                              if(text == null || text.isEmpty){
                                return "Por favor, digite a sequência.";
                              }
                            },
                          ),

                          const Padding(padding: EdgeInsets.only(bottom: 10)),

                          TextFormField(
                            style: const TextStyle(

                            ),
                            controller: _series,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Séries",
                              labelStyle: TextStyle(

                              ),

                            ),
                            validator: (text){
                              if(text == null || text.isEmpty){
                                return "Por favor, digite a quantidade de séries.";
                              }
                            },
                          ),

                          const Padding(padding: EdgeInsets.only(bottom: 10)),

                          TextFormField(
                            style: const TextStyle(

                            ),
                            controller: _treino,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Treino",
                              labelStyle: TextStyle(

                              ),

                            ),
                            validator: (text){
                              if(text == null || text.isEmpty){
                                return "Por favor, digite o treino.";
                              }
                            },
                          ),

                          const Padding(padding: EdgeInsets.only(bottom: 10)),

                          TextFormField(
                            style: const TextStyle(

                            ),
                            controller: _descanso,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Descanso",
                              labelStyle: TextStyle(

                              ),

                            ),
                            validator: (text){
                              if(text == null || text.isEmpty){
                                return "Por favor, digite o descanso.";
                              }
                            },
                          ),

                          const Padding(padding: EdgeInsets.only(bottom: 10)),

                          TextFormField(
                            style: const TextStyle(

                            ),
                            controller: _grupo,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Grupo",
                              labelStyle: TextStyle(

                              ),

                            ),
                            validator: (text){
                              if(text == null || text.isEmpty){
                                return "Por favor, selecione o grupo.";
                              }
                            },
                          ),

                          const Padding(padding: EdgeInsets.only(bottom: 10)),

                          TextFormField(
                            style: const TextStyle(

                            ),
                            controller: _video,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Vídeo",
                              labelStyle: TextStyle(

                              ),

                            ),
                            validator: (text){
                              if(text == null || text.isEmpty){
                                return "Por favor, selecione o vídeo.";
                              }
                            },
                          ),

                          const Padding(padding: EdgeInsets.only(bottom: 10)),

                          TextFormField(
                            style: const TextStyle(

                            ),
                            controller: _capa,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Capa",
                              labelStyle: TextStyle(

                              ),

                            ),
                            validator: (text){
                              if(text == null || text.isEmpty){
                                return "Por favor, selecione a capa.";
                              }
                            },
                          ),

                          const Padding(padding: EdgeInsets.only(bottom: 10)),

                          TextFormField(
                            style: const TextStyle(

                            ),
                            controller: _observacoes,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Observações",
                              labelStyle: TextStyle(

                              ),

                            ),
                            validator: (text){
                              if(text == null || text.isEmpty){
                                return "Por favor, digite as observações.";
                              }
                            },
                          ),


                        ],
                      ),
                    )*/


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
                                  style: TextStyle(color: Colors.white),
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
                                  style: TextStyle(color: Colors.white),
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
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        ],
                      ),

                    ],
                  )


                ],
              );
            }
        );

      },
    );
  }

}