//1.1 e 1.3

import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vetadvisor/fluxopesquisarapida/detalheDaPesquisaDermatiteAtopica.dart';
import 'package:vetadvisor/fluxopesquisarapida/home.dart';
import 'package:vetadvisor/fluxopesquisarapida/resultadoDaPesquisa.dart';
import 'package:vetadvisor/fluxopesquisarapida/servicos.dart';
import 'package:vetadvisor/fluxoprontuariodigital/consultaPaciente.dart';
import 'package:vetadvisor/prelogin/slideVideo.dart';
import 'package:vetadvisor/prelogin/slide_tile.dart';
import 'package:video_player/video_player.dart';
import 'package:vetadvisor/recursos/Constants.dart';
import 'package:rolling_switch/rolling_switch.dart';
import '../firebase_options.dart';
import '../recursos/dialogUtils.dart';

import 'package:vetadvisor/fluxoprontuariodigital/cadastreOPet.dart';

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
                                ),)
                            /* Column(
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
                                           // fillColor: const Color(0xFF12EC1A),

                                            // contentPadding: EdgeInsets.fromLTRB(20, 0, 12, 0),
                                            //prefixIcon:
                                            /*Builder(
                                                builder: (context) => IconButton(
                                                    onPressed: () {



                                                    },
                                                    icon: const Icon(Icons.search,size: 15,
                                                        color: Color(0xFF3C10BB)))),*/

                                            hintText: "Prurido generalizado; Maneios de cabeça; Febre",

                                            /*suffixIcon: const Icon(
                                              MdiIcons.navigationVariant,
                                              size: 15,
                                              color: Color(0xFF3C10BB),

                                            )*/
                                        ),
                                      ),),




                                  ]),
                         ]),*/
                          ),
                          // Padding(padding: EdgeInsets.only(top: 5)),

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

                        ])),
              )
          )]));
  }





  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
