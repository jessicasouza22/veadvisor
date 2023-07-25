//1.1  Detalhe Da Pesquisa

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
import 'package:vetadvisor/fluxoprontuariodigital/perfilPaciente.dart';
import 'package:vetadvisor/prelogin/slideVideo.dart';
import 'package:vetadvisor/prelogin/slide_tile.dart';
import 'package:video_player/video_player.dart';
import 'package:vetadvisor/recursos/Constants.dart';
import 'package:rolling_switch/rolling_switch.dart';
import '../firebase_options.dart';
import '../objetos/doenca.dart';
import '../recursos/Variaveis.dart';
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

  List<String> _testes = ["Teste1", "Teste2","Teste3", "Teste4"];

  late final FirebaseAuth auth;
  late final FirebaseApp app;

  @override
  void initState() {
    super.initState();


    //mostrarAlerta();
  }

  void mostrarAlerta() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Container(
              padding: EdgeInsets.only(left: 10, top: 10),
              margin:
              EdgeInsets.only(left: 30, right: 30, top: 200, bottom: 500),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(children: [
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
                //  Text('Atenção'),

                Row(
                  children: [
                    Icon(
                      MdiIcons.alertCircleOutline,
                      size: 22,
                      color: Colors.pink,
                    ),
                    Padding(padding: EdgeInsets.only(left: 11)),
                    Text(
                      "Clique no símbolo de (+) para acessar as\ninformações a respeito dessa patologia ",
                      style: TextStyle(
                          color: Color(0xff59616E),
                          fontSize: 10,
                          decoration: TextDecoration.none),
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

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isActive;
    bool status = false;
    int _indexCarrouselEspecialista = 0;
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
                          const Text(
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
                child: Column(children: [

                  Padding(padding: EdgeInsets.only(top: 10)),

                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(children: [
                      Row(children: [
                        SizedBox(
                          height: 30,
                          width: 350,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 12),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                // tira a borda do TextField
                                //  fillColor: const Color(0xFF12EC1A),
                                // contentPadding: EdgeInsets.fromLTRB(20, 0, 12, 0),
                                prefixIcon: Builder(
                                    builder: (context) => IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.search,
                                            size: 15,
                                            color: Color(0xFF979797)))),
                                hintText: "Adicione mais informações",
                                suffixIcon: const Icon(
                                  MdiIcons.navigationVariant,
                                  size: 15,
                                  color: Color(0xFF979797),
                                )),
                          ),

                        ),

                      ]),
                    ]),
                  ),


                  Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(Variaveis.sintomaBuscado,
                            style: TextStyle(color: Color(0xFF8F90A6)),
                          ),
                          Icon(Icons.highlight_remove_outlined, color: Colors.red, size: 12,)
                        ],
                      )
                      
                  ),

                  Padding(padding: EdgeInsets.only(top: 10)),

                  Container(
                      margin: EdgeInsets.only(right: 210),
                      child: const Text("Resultado da pesquisa",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )
                  ),

                  const Divider(

                    color: Color(0xFF12EC1A),

                    thickness: 0.8,

                    endIndent: 230,

                    indent: 20,

                  ),

                  Flexible(

                    child: CustomScrollView(

                        slivers: <Widget>[
                          _getSlivers(Variaveis.doencas, context)
                        ]
                    ),
                  ),







                  Padding(padding: EdgeInsets.only(top: 20)),

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
                                    const DetalheDaPesquisaDermatiteAtopica()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                backgroundColor: Color(0XFF4116B4)),
                            child: const Text(
                              'Finalizar',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ],
                  ),

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
                              child: const Row(children: [
                                Text(
                                  'Quero compartilhe este resultado',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Padding(padding: EdgeInsets.only(left: 10)),
                                Icon(
                                  MdiIcons.shareVariantOutline,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ]))),
                    ],
                  ),
                ])
              ))
        ]),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                label: "Início", icon: Icon(MdiIcons.home, color: Colors.grey)),
            BottomNavigationBarItem(
                label: "Consulta",
                icon: Icon(MdiIcons.stethoscope, color: Colors.grey)),
            BottomNavigationBarItem(
                label: "Comunidade",
                icon: Icon(MdiIcons.googleCirclesCommunities,
                    color: Colors.grey)),
            BottomNavigationBarItem(
                label: "Calendário",
                icon: Icon(MdiIcons.calendar, color: Colors.grey)),
            BottomNavigationBarItem(
                label: "Mais",
                icon: Icon(MdiIcons.dotsSquare, color: Colors.grey))
          ],
          currentIndex: _selectedIndex,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.green,
          onTap: _onItemTapped,
        ));
  }

  SliverList _getSlivers(List<Doenca> myList, BuildContext context) {
    return SliverList(

      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {

        return buildRow(myList[index], index);
      },
        childCount: myList.length,
      ),
    );
  }

  buildRow(Doenca doenca, index) {


    return Padding(
        padding: const EdgeInsets.only(right: 5, left: 5, top: 5),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Card(
                  child: Container(

                    padding: const EdgeInsets.only(left: 10, top:10),

                    margin: const EdgeInsets.only(left: 20, right: 20, top: 10),

                    decoration: const BoxDecoration(

                        color: Colors.white,

                        borderRadius: BorderRadius.all(Radius.circular(10))),

                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top: 5)),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(doenca.nome!,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ]),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 10,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 10,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 10,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 10,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 10,
                            ),
                          ],
                        ),
                        const Padding(padding: EdgeInsets.only(top: 5)),
                        Center(
                          child: AutoSizeText(doenca.referencias!,
                              style: TextStyle(
                                color: Color(0xFF59616E),
                              ), maxLines: 10),
                        ),

                        const Padding(padding: EdgeInsets.only(top: 10)),

                      ],
                    ),

                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(left:2, right: 2, top: 2, bottom: 2),
                    //  margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xFF4116B4),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 10,
                    )),
              ],
            )






          ],
        )
    );
  }

}
