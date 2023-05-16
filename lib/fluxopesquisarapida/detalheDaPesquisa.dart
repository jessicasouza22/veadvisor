//1.1 e 1.3

import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vetadvisor/fluxopesquisarapida/resultadoDaPesquisa.dart';
import 'package:vetadvisor/fluxoprontuariodigital/consultaPaciente.dart';
import 'package:vetadvisor/prelogin/slideVideo.dart';
import 'package:vetadvisor/prelogin/slide_tile.dart';
import 'package:video_player/video_player.dart';
import 'package:vetadvisor/recursos/Constants.dart';
import 'package:rolling_switch/rolling_switch.dart';
import '../firebase_options.dart';
import '../recursos/dialogUtils.dart';

import 'package:vetadvisor/fluxoprontuariodigital/cadastreOPet.dart';

class DetalheDaPesquisa extends StatelessWidget {
  const DetalheDaPesquisa({super.key});

  @override
  Widget build(BuildContext context) {
    return const DetalheDaPesquisaPage();
  }
}

class DetalheDaPesquisaPage extends StatefulWidget {
  const DetalheDaPesquisaPage({Key? key}) : super(key: key);

  @override
  State<DetalheDaPesquisaPage> createState() => _DetalheDaPesquisaPageState();
}

class _DetalheDaPesquisaPageState extends State<DetalheDaPesquisaPage> {


  String _nomeUsuarioLogado = "";


  late final FirebaseAuth auth;
  late final FirebaseApp app;


  //late Future<void> _initializeVideoPlayerFuture;

  @override
  // aqui inicia o vídeo controller

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

  int _currentPage = 0;

  final _listSlide2 = [
    'imagens/med01.jpg',
    'imagens/med02.jpeg',
    'imagens/med03.jpeg'
  ];

  ///////////*************************OUTRO VÍDEO
  final _listSlideVideos = [
    'videos/cuidados.mp4',
    'videos/cuidados.mp4',
    'videos/cuidados.mp4'
  ];



  @override
  Widget build(BuildContext context) {
    final bool isActive;
    bool status = false;
    int _indexCarrouselEspecialista = 0;
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
                            padding: const EdgeInsets.only(left: 40),
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
                                                    context) => const ConsultaPaciente()),
                                          );

                                          //print("clicado na seta");
                                        },
                                        icon: const Icon(Icons.arrow_back))),
                                AutoSizeText(
                                  "Detalhe da pesquisa $_nomeUsuarioLogado",
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
                    color: Color(0xFFF5F5F5),
                    child: SingleChildScrollView(
                        child: Column(children: [
                          const Padding(padding: EdgeInsets.only(top: 10)),


                          const Padding(
                              padding: EdgeInsets.only(
                                  left: 100, right: 50, bottom: 2, top: 2)),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 30, right: 30, bottom: 10, top: 10),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                //color: Color(0xFFF2F2F2),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(17),
                                ),
                              ),
                              child: Container(
                                // padding: EdgeInsets.only(left: , right: 5),
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.2),
                                  //color: Color(0xFFF2F2F2),
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(17)),
                                ),
                                child: TextFormField(
                                  //para senha: obscureText: true,

                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                  decoration: InputDecoration(
                                      fillColor: const Color(0xFF3C10BB),
                                      prefixIcon: const Icon(
                                        Icons.search,
                                        size: 18,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(17),
                                        borderSide: const BorderSide(
                                          //color: Color(0xFFBDBECB),
                                          width: 1.0,
                                        ),
                                      ),
                                      // icon: ,
                                      hintText: "Dermatite atópica",
                                      suffixIcon: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 1, right: 4, top: 3, bottom: 3),
                                          child: Builder(
                                            builder: (context) => ElevatedButton(
                                              style: TextButton.styleFrom(
                                                padding: const EdgeInsets.only(
                                                    top: 5,
                                                    right: 15,
                                                    left: 20,
                                                    bottom: 5),
                                                // primary: Colors.white,
                                                backgroundColor: Color(0xFF3C10BB),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(15.0),
                                                ),
                                                // Background Color
                                              ),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                      const ResultadoDaPesquisa()),
                                                );
                                              },
                                              child: const Text(
                                                "IR",
                                                style: TextStyle(
                                                    fontSize: 8,
                                                    decoration: TextDecoration.none),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ))),
                                ),
                              ),
                            ),
                          ),

                          Container(
                            color: Colors.white,
                            margin: EdgeInsets.all(10),
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
                                      prefixIcon: const Icon(
                                        Icons.search,
                                        size: 15,
                                        color: Color(0xFF3C10BB),

                                      ),


                                      // icon: ,
                                      hintText: "Resultado",
                                    ),
                                  ),),




                              ]),


                          ]),
                          ),

                          Container(
                              margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 1),
                              padding: const EdgeInsets.only(
                                  left: 40, right: 40, top: 5, bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text("Dermatite atópica",
                                          style: TextStyle(
                                            color: Color(0xFF4116B4),
                                            fontWeight: FontWeight.bold,
                                          ),),

                                      ],
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children:  [

                                        Icon(Icons.star,
                                          color: Colors.yellow,
                                          size: 10,),
                                         Text("Incluir diagnostico",
                                         style: TextStyle(
                                           fontSize: 10,
                                         ),),
                                         Checkbox(
                                          checkColor: Colors.white,
                                          activeColor: Colors.green,

                                          //fillColor: MaterialStateProperty.resolveWith(getColor),
                                          value: true,
                                          shape: CircleBorder(),
                                          onChanged: (value) {

                                          },
                                         ),
                                      ],
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Flexible(
                                            child: AutoSizeText(
                                              'Achados clínicos',
                                              style: TextStyle(
                                                color: Color(0xFF35364F),
                                                fontSize: 10,
                                              ),
                                              maxLines: 1,
                                              textAlign: TextAlign.justify,
                                            )),
                                      ],
                                    ),
                                    const Padding(padding: EdgeInsets.only(top: 10)),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Flexible(
                                            child: AutoSizeText(
                                              'Eritema, Prurido, Alopecia, Otite externa, Blefarite Prurido antes de aparecer as lesões, Lambe as patas e lambe outras partes do corpo excessivamente.',
                                              style: TextStyle(
                                                color: Color(0xFF59616E),
                                                fontSize: 10,
                                              ),
                                              maxLines: 3,
                                              textAlign: TextAlign.justify,
                                            )),
                                      ],
                                    ),

                                  ]
                              )
                          ),

                          Container(
                              margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 1),
                              padding: const EdgeInsets.only(
                                  left: 40, right: 40, top: 5, bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Column(
                                  children: [

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Flexible(
                                            child: AutoSizeText(
                                              'Exames recomendados',
                                              style: TextStyle(
                                                color: Color(0xFF35364F),
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              maxLines: 1,
                                              textAlign: TextAlign.justify,
                                            )),
                                      ],
                                    ),
                                    const Padding(padding: EdgeInsets.only(top: 10)),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Flexible(
                                            child: AutoSizeText(
                                              'Critérios de favrot et al, Teste cutâneo intradérmico e prick test',
                                              style: TextStyle(
                                                color: Color(0xFF59616E),
                                                fontSize: 10,
                                              ),
                                              maxLines: 3,
                                              textAlign: TextAlign.justify,
                                            )),
                                      ],
                                    ),

                                  ]
                              )
                          ),

                          Container(
                              margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 1),
                              padding: const EdgeInsets.only(
                                  left: 40, right: 40, top: 5, bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Column(
                                  children: [

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Flexible(
                                            child: AutoSizeText(
                                              'Fatores de risco',
                                              style: TextStyle(
                                                color: Color(0xFF35364F),
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              maxLines: 1,
                                              textAlign: TextAlign.justify,
                                            )),
                                      ],
                                    ),
                                    const Padding(padding: EdgeInsets.only(top: 10)),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Flexible(
                                            child: AutoSizeText(
                                              'Alergia alimentar, Hipersensibilidade à picada de pulgas, Ambiente domiciliar com alta quantidade de panos e fômites que acumulam poeira e ácaros, região com alta quantidade de pólen, região com longa estações do ano que proporcionam alergias, hereditariedade, Clima temperado e região com altos níveis de mofo',
                                              style: TextStyle(
                                                color: Color(0xFF59616E),
                                                fontSize: 10,
                                              ),
                                              maxLines: 3,
                                              textAlign: TextAlign.justify,
                                            )),
                                      ],
                                    ),

                                  ]
                              )
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
}
