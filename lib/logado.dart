import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:video_player/video_player.dart';

class Logado extends StatelessWidget {
  const Logado({super.key});

  @override
  Widget build(BuildContext context) {
    return const LogadoPage();
  }
}

class LogadoPage extends StatefulWidget {
  const LogadoPage({Key? key}) : super(key: key);

  @override
  State<LogadoPage> createState() => _LogadoPageState();
}

class _LogadoPageState extends State<LogadoPage> {
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
        //debugShowCheckedModeBanner: false,
        home: Scaffold(
            drawer: Drawer(
                backgroundColor: Color(0xFF0E02B7),
                child: ListView(
                  children: [
                    // aqui ele está dividindo o menu em duas partes
                    UserAccountsDrawerHeader(
                      decoration: new BoxDecoration(
                        color: Color(0xFF0E02B7),
                      ),
                      currentAccountPicture: Image.asset('imagens/user.png'),
                      accountName: Text("Davies"),
                      accountEmail: Text("davies@gmail.com"),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    Row(
                      children: [
                        Icon(MdiIcons.bellOffOutline,
                            color: Colors.white, size: 20),
                        Text(
                          "Notificações",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    Row(
                      children: [
                        Icon(MdiIcons.stethoscope,
                            color: Colors.white, size: 20),
                        Text(
                          "Minhas consultas",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(MdiIcons.calendarClockOutline,
                            color: Colors.white, size: 20),
                        Text(
                          "Agendar consulta",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(MdiIcons.stethoscope,
                            color: Colors.white, size: 20),
                        Text(
                          "Ver procedimentos",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(MdiIcons.stethoscope,
                            color: Colors.white, size: 20),
                        Text(
                          "Dicas de cuidados",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(MdiIcons.cartMinus, color: Colors.white, size: 20),
                        Text(
                          "Ofertas",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(MdiIcons.bottleTonicPlusOutline,
                            color: Colors.white, size: 20),
                        Text(
                          "Telemedicina",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(MdiIcons.bottleTonicPlusOutline,
                            color: Colors.white, size: 20),
                        Text(
                          "Add novo pet",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(MdiIcons.bottleTonicPlusOutline,
                            color: Colors.white, size: 20),
                        Text(
                          "Suporte técnico",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(MdiIcons.bottleTonicPlusOutline,
                            color: Colors.white, size: 20),
                        Text(
                          "Sair da conta",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.white,
                      thickness: 0.2,
                      endIndent: 28,
                      indent: 18,
                    )
                  ],
                )),
            body: CustomScrollView(slivers: [
              SliverFillRemaining(
                hasScrollBody: true,
                child: Container(
                    color: Color(0xFFF2F2F2),

                    //padding: const EdgeInsets.only(left: 30, right: 30),
                    child: SingleChildScrollView(
                        child: Column(children: [
                      //backgroundColor: Color(0xFF0E02B7),

                      // a partir daqui que comecou a mostrar a msg que estourou

                      AppBar(
                          toolbarHeight: 80,
                          elevation: 30,
                          shadowColor: Color(0xFF3C10BB),
                          //   backgroundColor: Colors.lightGreenAccent,
                          //  cor da sombra
                          flexibleSpace: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                //end: Alignment(0.8, 1),
                                colors: <Color>[
                                  Color(0xFF4116B4),
                                  Color(0xff7347EF),
                                  Color(0xff4116B4),
                                  Color(0xffE3EDF7),
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

                      const Padding(
                          padding: EdgeInsets.only(
                              left: 100, right: 50, bottom: 5, top: 5)),
                      Container(
                        color: Colors.green,
                          padding: EdgeInsets.only(left: 50, right: 50, bottom: 5, top: 5),
                        child: Container(
                          padding: EdgeInsets.only(left: 2, right: 2, bottom: 5, top: 5),
                          child: Container(
                            // padding: EdgeInsets.only(left: , right: 5),
                            decoration: const BoxDecoration(
                              color: Colors.orange,
                              //color: Color(0xFFF2F2F2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(17)),
                            ),
                            child: TextFormField(
                              //para senha: obscureText: true,

                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                //fillColor: Color(0xFF3C10BB),

                                prefixIcon: Icon(Icons.search),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(17),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFBDBECB),
                                    width: 1.0,
                                  ),
                                ),
                                // icon: ,
                                hintText: "Digite os sintomas do seu pet",
                                suffixIcon: ElevatedButton(
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.only(
                                        top: 5, right: 15, left: 1, bottom: 5),
                                    // primary: Colors.white,
                                    backgroundColor: Color(0xFF3C10BB),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
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
                      // ),
                      // ),
                          Padding(padding: EdgeInsets.only(top: 10)),






                          /* CarouselSlider(
                        // auto

                        items: [
                          Container(
                      child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                        child:Image(
                          image: AssetImage("imagens/med01.jpg"),
                        /*decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0),),
                                image: DecorationImage(
                                  image: AssetImage("imagens/med01.jpg"),
                                */
                    )),
                          ),
                          /*Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                image: const DecorationImage(
                                  image: AssetImage("imagens/med02.jpeg"),
                                )),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                image: const DecorationImage(
                                  image: AssetImage("imagens/med03.jpeg"),
                                )),
                          ),*/
                        ],
                        options: CarouselOptions(
                          height: 100,
                          aspectRatio: 16 / 9,
                          //viewportFraction: 0.8,
                          //initialPage: 0,
                          autoPlay: true,
                          // enableInfiniteScroll: true,
                          //reverse: false,
                          enlargeCenterPage: true,
                          autoPlayInterval: Duration(seconds: 4),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,

                          enlargeFactor: 0.3,
                          //onPageChanged: callbackFunction,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),*/
                      PageView.builder(
                         itemCount: 3,
                         itemBuilder: (_ , int correntIndex){
                           return Container(
                           color: Colors.green,
                           );
                     }


                     ),


                          Padding(padding: EdgeInsets.all(5)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         /*Icon(Icons.circle, size: 12, color: Colors.grey),
                          Icon(Icons.circle, size: 12, color: Colors.grey),
                          Icon(Icons.circle, size: 12, color: Colors.grey),*/

                          Container(
                            margin: EdgeInsets.all(10),
                            width:10,
                            height: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.red,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            width:10,
                            height: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            width:10,
                            height: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),

                      // ],
                      // )),*/
Padding(padding: EdgeInsets.all(10)),
                      Container(
                          padding: EdgeInsets.only(bottom: 18, top: 18),
                          margin:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
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
                          Padding(padding: EdgeInsets.all(10)),
                      Container(
                          padding: EdgeInsets.only(bottom: 18, top: 18),
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 20.0),
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
                          Padding(padding: EdgeInsets.all(10)),
                      CarouselSlider(
                        items: [
                          Container(
                            padding:
                                const EdgeInsets.only(bottom: 200, top: 200),
                            margin:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            //color: Colors.amber,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
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
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          //onPageChanged: callbackFunction,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      // ])
                    ]))),
              )
            ])));
  }
}
