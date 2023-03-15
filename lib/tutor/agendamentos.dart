import 'package:flutter/cupertino.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:video_player/video_player.dart';

class Agendamentos extends StatelessWidget {
  const Agendamentos({super.key});

  @override
  Widget build(BuildContext context) {
    return const AgendamentosPage();
  }
}

class AgendamentosPage extends StatefulWidget {
  const AgendamentosPage({Key? key}) : super(key: key);

  @override
  State<AgendamentosPage> createState() => _AgendamentosPageState();
}

class _AgendamentosPageState extends State<AgendamentosPage> {
  late VideoPlayerController _controller;

  @override
  // aqui inicia o vídeo controller
  void initState() {
    _controller = VideoPlayerController.network(
        "hhttps://edisciplinas.usp.br/pluginfile.php/5196097/mod_resource/content/1/Teste.mp4")
      ..initialize().then((_) {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // body: Scaffold(
      home: Container(
          child: CustomScrollView(slivers: [
        SliverFillRemaining(
            hasScrollBody: true,
            child: Container(
                color: Colors.white,

                //padding: const EdgeInsets.only(left: 30, right: 30),
                child: SingleChildScrollView(
                    child: Column(children: [
                  // appBar:
                  AppBar(
                      toolbarHeight: 80,
                      elevation: 50,
                      flexibleSpace: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                           // begin: Alignment.topLeft,
                           // end: Alignment(0.8, 1),
                            colors: <Color>[

                              Color(0xFF3C10BB),
                              Color(0xffffb56b),
                            ],
                            //tileMode: TileMode.mirror,
                          ),
                        ),
                      ),
                      title: Text(
                        "Olá ----- ",
                        style: TextStyle(
                          decoration: TextDecoration.none,
                        ),
                      ),
                      // elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(30),
                        ),
                      ),
                      actions: [
                        Expanded(
                            child: Padding(
                                padding: EdgeInsets.only(left: 40),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          print("clicado na seta");
                                        },
                                        icon: Icon(Icons.arrow_back)),
                                    Text(
                                      "Olá ----- ",
                                      style: TextStyle(),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          print("clicado no notificacao");
                                        },
                                        icon: Icon(Icons.doorbell)),
                                  ],
                                )))
                      ]),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Center(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                  )),

                  const Padding(padding: EdgeInsets.only(top: 25)),
                  Material(
                    child: Container(
                      padding: EdgeInsets.only(left: 50, right: 50),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(17)),
                      ),
                      child: TextFormField(
                        // obscureText: true,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          //fillColor: Colors.orange,
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(17),
                            borderSide: const BorderSide(
                              color: Color(0xFF3C10BB),
                              width: 1.0,
                            ),
                          ),
                          // icon: ,
                          hintText: "Digite os sintomas do seu pet",
                          suffixIcon: ElevatedButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.only(
                                  top: 5, right: 5, left: 1, bottom: 5),
                              primary: Colors.white,
                              backgroundColor: Color(0xFF3C10BB),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              // Background Color
                            ),
                            onPressed: () {
                              /*Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => const Agendamentos()),
                                          );*/
                            },
                            child: Text("IR",
                                style: TextStyle(
                                    fontSize: 10,
                                    decoration: TextDecoration.none)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calendar_month,
                        color: Color(0xFF3C10BB),
                      ),
                      Text(
                        " Agende sua consulta com especialista",
                        style: TextStyle(
                          color: Color(0xFF3C10BB),
                          decoration: TextDecoration.none,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                  // Material(
                  //  child: Row(

                  // children: [
                  Padding(padding: EdgeInsets.only(top: 10)),
                  CarouselSlider(
                    // auto

                    items: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            image: const DecorationImage(
                              image: AssetImage("imagens/med01.jpg"),
                            )),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            image: const DecorationImage(
                              image: AssetImage("imagens/med02.jpeg"),
                            )),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            image: const DecorationImage(
                              image: AssetImage("imagens/med03.jpeg"),
                            )),
                      ),
                    ],
                    options: CarouselOptions(
                      height: 100,
                      aspectRatio: 16 / 9,
                      //viewportFraction: 0.8,
                      //initialPage: 0,
                      //enableInfiniteScroll: true,
                      //reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 4),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      //onPageChanged: callbackFunction,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),

                  //   ],
                  // )),

                  Container(
                      padding: EdgeInsets.only(bottom: 18, top: 18),
                      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            MdiIcons.stethoscope,
                            color: Color(0xFF3C10BB),
                          ),
                          Text(
                            " Consultas de meus PETS ",
                            style: TextStyle(
                                color: Color(0xFF3C10BB),
                                fontSize: 14,
                                decoration: TextDecoration.none),
                          ),
                          Icon(
                            MdiIcons.chevronRight,
                            color: Color(0xFF3C10BB),
                          ),
                        ],
                      )),
                  Container(
                      padding: EdgeInsets.only(bottom: 18, top: 18),
                      margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                      color: Colors.white,
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.,
                        children: [
                          Icon(
                            MdiIcons.stethoscope,
                            color: Color(0xFF3C10BB),
                          ),
                          Text(
                            " |  Dicas do especialista ",
                            style: TextStyle(
                                color: Color(0xFF3C10BB),
                                fontSize: 14,
                                decoration: TextDecoration.none),
                          ),
                        ],
                      )),
                  CarouselSlider(
                    items: [
                      Container(
                        padding: EdgeInsets.only(bottom: 150, top: 150),
                        margin: const EdgeInsets.only(left: 40.0, right: 40.0),
                        //color: Colors.amber,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Colors.amber,

                          // image: const DecorationImage(
                          // image: AssetImage("imagens/med03.jpeg")

                          //  )
                        ),
                        child: _controller.value.isInitialized
                            ? VideoPlayer(_controller)
                            : Container(),
                      )
                    ],
                    options: CarouselOptions(
                      height: 100,
                     // aspectRatio: 16 / 9,
                      //viewportFraction: 0.8,
                      //initialPage: 0,
                      //enableInfiniteScroll: true,
                      //reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 4),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      //onPageChanged: callbackFunction,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ])))),
      ])),
    );
  }
}
