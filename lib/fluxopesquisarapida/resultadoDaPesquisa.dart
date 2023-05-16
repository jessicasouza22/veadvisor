// 1.2 e 1.7 Resultado Da Pesquisa


import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vetadvisor/fluxopesquisarapida/detalheDaPesquisa.dart';
import 'package:vetadvisor/fluxopesquisarapida/detalheDaPesquisa02.dart';

import '../firebase_options.dart';
import '../recursos/dialogUtils.dart';

import 'package:vetadvisor/fluxoprontuariodigital/cadastreOPet.dart';

class ResultadoDaPesquisa extends StatelessWidget {
  const ResultadoDaPesquisa ({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResultadoDaPesquisaPage();
  }
}

class ResultadoDaPesquisaPage extends StatefulWidget {
  const ResultadoDaPesquisaPage({Key? key}) : super(key: key);

  @override
  State<ResultadoDaPesquisaPage> createState() => _ResultadoDaPesquisaPageState();
}

class _ResultadoDaPesquisaPageState extends State<ResultadoDaPesquisaPage> {


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
    return MaterialApp(
        debugShowCheckedModeBanner: false,

        //debugShowCheckedModeBanner: false,
        home: Scaffold(

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
                                                    context) => const DetalheDaPesquisa02()),
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
                         Padding(padding: EdgeInsets.all(10)),

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

                                    Padding(padding: EdgeInsets.only(top: 10)),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                            child: AutoSizeText(
                                              'Critérios de Favrot et al',
                                              style: TextStyle(
                                                color: Color(0xFF35364F),
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              maxLines: 1,
                                              textAlign: TextAlign.justify,
                                            )),

                                        IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (
                                                      context) => const DetalheDaPesquisa02()),
                                            );
                                          },
                                          icon:  Icon(MdiIcons.closeCircleOutline,
                                            color: Colors.red,
                                            size: 16,),
                                        ),







                                      ],
                                    ),

                                    const Padding(padding: EdgeInsets.only(top: 30)),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Flexible(
                                            child: AutoSizeText(
                                              '1- Início dos sinais clínicos antes de três anos de idade',
                                              style: TextStyle(
                                                color: Color(0xFF59616E),
                                                fontSize: 10,
                                              ),
                                              maxLines: 2,
                                              textAlign: TextAlign.justify,
                                            )),
                                      ],
                                    ),

                                    Padding(padding: EdgeInsets.only(top: 10)),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Flexible(
                                            child: AutoSizeText(
                                              '2- Cães habitam normalmente ambientes internos',
                                              style: TextStyle(
                                                color: Color(0xFF59616E),
                                                fontSize: 10,
                                              ),
                                              maxLines: 2,
                                              textAlign: TextAlign.justify,
                                            )),
                                      ],
                                    ),

                                    Padding(padding: EdgeInsets.only(top: 10)),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Flexible(
                                            child: AutoSizeText(
                                              '3- Prurido responsivo a corticoides',
                                              style: TextStyle(
                                                color: Color(0xFF59616E),
                                                fontSize: 10,
                                              ),
                                              maxLines: 1,
                                              textAlign: TextAlign.justify,
                                            )),
                                      ],
                                    ),

                                    Padding(padding: EdgeInsets.only(top: 10)),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Flexible(
                                            child: AutoSizeText(
                                              '4- Prurido como sinal inicial (prurido sem lesão)',
                                              style: TextStyle(
                                                color: Color(0xFF59616E),
                                                fontSize: 10,
                                              ),
                                              maxLines: 2,
                                              textAlign: TextAlign.justify,
                                            )),
                                      ],
                                    ),

                                    Padding(padding: EdgeInsets.only(top: 10)),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Flexible(
                                            child: AutoSizeText(
                                              '5- Patas dianteiras afetadas',
                                              style: TextStyle(
                                                color: Color(0xFF59616E),
                                                fontSize: 10,
                                              ),
                                              maxLines: 1,
                                              textAlign: TextAlign.justify,
                                            )),
                                      ],
                                    ),

                                    Padding(padding: EdgeInsets.only(top: 10)),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Flexible(
                                            child: AutoSizeText(
                                              '6- Pavilhões auriculares afetados',
                                              style: TextStyle(
                                                color: Color(0xFF59616E),
                                                fontSize: 10,
                                              ),
                                              maxLines: 1,
                                              textAlign: TextAlign.justify,
                                            )),
                                      ],
                                    ),

                                    Padding(padding: EdgeInsets.only(top: 10)),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Flexible(
                                            child: AutoSizeText(
                                              '7- Margens de orelhas não afetadas',
                                              style: TextStyle(
                                                color: Color(0xFF59616E),
                                                fontSize: 10,
                                              ),
                                              maxLines: 1,
                                              textAlign: TextAlign.justify,
                                            )),
                                      ],
                                    ),

                                    Padding(padding: EdgeInsets.only(top: 10)),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Flexible(
                                            child: AutoSizeText(
                                              '8- Área dorso-lombar não afetada.',
                                              style: TextStyle(
                                                color: Color(0xFF59616E),
                                                fontSize: 10,
                                              ),
                                              maxLines: 1,
                                              textAlign: TextAlign.justify,
                                            )),
                                      ],
                                    ),

                                    Padding(padding: EdgeInsets.only(top: 10)),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Flexible(
                                            child: AutoSizeText(
                                              'A combinação de cinco critérios de avaliação tem uma sensibilidade de 80% a 85% e especificidade de 79% a 85% para diferenciar cães com Dermatite Atópica de cães com prurido crônico recorrente sem dermatite atópica',
                                              style: TextStyle(
                                                color: Color(0xFF59616E),
                                                fontSize: 10,
                                              ),
                                              maxLines: 6,
                                              textAlign: TextAlign.justify,
                                            )),
                                      ],
                                    ),

                                    Padding(padding: EdgeInsets.only(top: 30)),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [

                                        Text("Deixe aqui o seu link  ",
                                          style: TextStyle(
                                            color: Color(0xFF12EC1A),
                                          ),),

                                        Icon(MdiIcons.thumbUp,
                                          color: Colors.transparent,),

                                        Icon(MdiIcons.thumbUp,
                                          color: Color(0xFFC7C9D9),),

                                        Icon(MdiIcons.thumbUp,
                                          color: Colors.transparent,),

                                        Icon(MdiIcons.thumbUpOutline,
                                          color: Color(0xFFC7C9D9),),
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
              )])));
  }
}
