import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vetadvisor/tutor/slide_tile.dart';
import 'package:video_player/video_player.dart';
import 'package:vetadvisor/recursos/Constants.dart';



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
  //final PageController _pageController = PageController(viewportFraction: 0.8);
  // ele vai controlar o listView
  int posicaoSlide = 0;
  List <MaterialColor> cores = [Colors.red, Colors.grey];


  // declaracoes para o listView

  //int _corrrentPage =0; // _ significa pread

 // aqui ele vai mandar iniciar o estado antes de tudo para escutar o pagecontroller

 /* @override
  void initState() {
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
    super.initState();
  }*/

 // get currentIndex => null;

  @override
  // aqui inicia o vídeo controller
  void initState() {

    _controller = VideoPlayerController.network(
        "https://firebasestorage.googleapis.com/v0/b/vetadvisor-2d900.appspot.com/o/Som%20de%20Cachorro%20e%20Cachorrinhos%20Latindo%20-%20Fatos%20Curiosos%20Sobre%20C%C3%A3es.mp4?alt=media&token=9a2d5805-0114-4cb5-b7da-38ff1fdfa16a",)
      ..initialize().then((_) {
        setState(() {});
      });
    _controller.play();
    super.initState();
  }

  int _currentPage = 0;
  final _listSlide = [
    { 'id': 0, 'image': 'imagens/med01.jpg'},
    { 'id': 1, 'image': 'imagens/med02.jpeg'},
    { 'id': 2, 'image': 'imagens/med03.jpeg'}
  ];

  final _listSlide2 = ['imagens/med01.jpg','imagens/med02.jpeg','imagens/med03.jpeg'];

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
                    /*UserAccountsDrawerHeader(
                      decoration: new BoxDecoration(
                        color: Color(0xFF0E02B7),
                      ),
                     margin: EdgeInsets.only(bottom: 30
                     ),
                      currentAccountPicture: Image.asset('imagens/user.png'),
                      accountName: Text("Davies"),
                      accountEmail: Text("davies@gmail.com"),
                    ),*/
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 30, left: 30, top: 30),
                          child: CircleAvatar(
                          backgroundImage: AssetImage('imagens/user.png'),
                          
                        ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 30, left: 30, top: 30),
                          child: Text(Constants.nomeDr,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white
                          ),),
                        ),
                      /*  Padding(
                          padding: EdgeInsets.only(bottom: 20, top: 60, right: 10),
                          child:Text("juliano@gmail.com")
                        ),*/
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(10)),

                    ListTile(
                      leading: Icon(MdiIcons.bellOffOutline),
                      title: Text("Notificações",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),),

                      onTap: (){},
                    )

                    /*Row(
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
                    ),*/
                   /* Divider(
                      color: Colors.white,
                      thickness: 0.2,
                      endIndent: 28,
                      indent: 18,
                    )*/
                  ],
                )


            ),
            body: CustomScrollView(slivers: [
              SliverAppBar (
                backgroundColor: Colors.transparent,
                toolbarHeight: 80,
                elevation: 30,
                pinned: true,
                expandedHeight: 50,
                flexibleSpace: Container (

                  decoration: BoxDecoration (
                    borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(45),
                ),
                    // LinearGradient
                    gradient: LinearGradient (
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
                  title: Text(
                    "Olá ----- ",
                    style: TextStyle(
                      decoration: TextDecoration.none,
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
                  ]
              ),
              SliverFillRemaining(
                hasScrollBody: true,
                child: Container(
                    color: Color(0xFFF2F2F2),

                    //padding: const EdgeInsets.only(left: 30, right: 30),
                    child: SingleChildScrollView(
                        child: Column(children: [
                      //backgroundColor: Color(0xFF0E02B7),

                      // a partir daqui que comecou a mostrar a msg que estourou


                          /*
                      AppBar(
                          toolbarHeight: 80,
                          elevation: 30,
                          //shadowColor: Color(0xFF3C10BB),
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
                          ]),*/

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
                      Padding(
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: Container(

                          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            //color: Color(0xFFF2F2F2),
                            borderRadius:
                            BorderRadius.all(Radius.circular(17)),
                          ),
                          child: Container(
                            // padding: EdgeInsets.only(left: , right: 5),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
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
                                suffixIcon: Padding(
                                  padding: EdgeInsets.only(left: 10, right:10, top: 0, bottom: 0),
                                  child: ElevatedButton(
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
                                            decoration: TextDecoration.none), textAlign: TextAlign.center,),
                                  ),
                                )
                                
                                
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


                      SizedBox(
                        width: 150,
                        height: 150,
                        child:
                          PageView.builder(
                            onPageChanged: (posicao) {
                              setState(() {
                                posicaoSlide = posicao;
                              });

                            },
                           // controller: _pageController,
                            itemCount: _listSlide2.length,
                            itemBuilder: (_, currentIndex) {
                           //  bool activePage = currentIndex == _currentPage;
                              return SlideTile(

                                image: _listSlide2[currentIndex],
                               /* activePage: activePage,
                                //image: _listSlide[currentIndex]['image'],
                                image: _listSlide[currentIndex]['immage']*/

                           );
                     },


                     ),
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
                              color: posicaoSlide == 0 ? cores[0] : cores[1],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            width:10,
                            height: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: posicaoSlide == 1 ? cores[0] : cores[1],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            width:10,
                            height: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: posicaoSlide == 2 ? cores[0] : cores[1],
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

                          Center(
                            child: _controller.value.isInitialized
                                ? AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            )
                                : Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),

                              ),
                            ),
                          ),



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
