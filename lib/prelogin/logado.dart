import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vetadvisor/prelogin/slideVideo.dart';
import 'package:vetadvisor/prelogin/slide_tile.dart';
import 'package:video_player/video_player.dart';
import 'package:vetadvisor/recursos/Constants.dart';
import 'package:rolling_switch/rolling_switch.dart';
import 'teste.dart';
import 'package:vetadvisor/fluxoprontuariodigital/cadastreOPet.dart';

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

  bool _modoEscuro = false;
  //final PageController _pageController = PageController(viewportFraction: 0.8);
  // ele vai controlar o listView
  int posicaoSlide = 0;

  List<MaterialColor> cores = [Colors.red, Colors.grey];


  @override
  // aqui inicia o vídeo controller
  void initState() {
    _controller = VideoPlayerController.network(
      "https://firebasestorage.googleapis.com/v0/b/vetadvisor-2d900.appspot.com/o/Som%20de%20Cachorro%20e%20Cachorrinhos%20Latindo%20-%20Fatos%20Curiosos%20Sobre%20C%C3%A3es.mp4?alt=media&token=9a2d5805-0114-4cb5-b7da-38ff1fdfa16a",
    )..initialize().then((_) {
        setState(() {});
      });
    _controller.play();

    _controllerV = VideoPlayerController.asset('_listSlideVideos');

    _initializeVideoPlayerFuture = _controllerV.initialize();
    _controllerV.setLooping(true);
    _controllerV.setVolume(1.0);

    super.initState();
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


  late VideoPlayerController _controllerV;
  late Future<void> _initializeVideoPlayerFuture;




  @override
  void dispose() {
    _controllerV.dispose();
    super.dispose();
  }




  int _currentPageVideo = 0;
  final _listSlideVideo = ['', '', ''];

  @override
  Widget build(BuildContext context) {
    final bool isActive;
    bool status = false;
    return MaterialApp(
        theme: ThemeData(
            brightness: _modoEscuro ? Brightness.dark : Brightness.light,
          visualDensity: VisualDensity.adaptivePlatformDensity,

        ),
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
                          padding:
                              EdgeInsets.only(bottom: 30, left: 18, top: 30),
                          child: CircleAvatar(
                            backgroundImage: AssetImage('imagens/user.png'),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(bottom: 30, left: 20, top: 30),
                          child: Text(
                            "${Constants.nomeDr}\n\n${Constants.emailDr}",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                        /*  Padding(
                          padding: EdgeInsets.only(bottom: 20, top: 60, right: 10),
                          child:Text("juliano@gmail.com")
                        ),*/
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    Stack(children: [
                      Positioned(
                        height: 56,
                        width: 288,
                        child: Container(
                          margin:
                              EdgeInsets.only(left: 15, right: 10, bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(MdiIcons.bellOutline),
                        title: Text(
                          "Notificações",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ]),

                    Stack(children: [
                      Positioned(
                        height: 56,
                        width: 288,
                        child: Container(
                          margin:
                              EdgeInsets.only(left: 15, right: 10, bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(MdiIcons.stethoscope),
                        title: Text(
                          "Minhas consultas",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {},
                      )
                    ]),

                    Stack(children: [
                      Positioned(
                        height: 56,
                        width: 288,
                        child: Container(
                          margin:
                              EdgeInsets.only(left: 15, right: 10, bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(MdiIcons.calendarClockOutline),
                        title: Text(
                          "Agendar consulta",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {},
                      )
                    ]),

                    Stack(children: [
                      Positioned(
                        height: 56,
                        width: 288,
                        child: Container(
                          margin:
                              EdgeInsets.only(left: 15, right: 10, bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(MdiIcons.stethoscope),
                        title: Text(
                          "Ver procedimentos",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {},
                      )
                    ]),

                    Stack(children: [
                      Positioned(
                        height: 56,
                        width: 288,
                        child: Container(
                          margin:
                              EdgeInsets.only(left: 15, right: 10, bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(MdiIcons.stethoscope),
                        title: Text(
                          "Dicas de cuidados",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {},
                      )
                    ]),

                    Stack(children: [
                      Positioned(
                        height: 56,
                        width: 288,
                        child: Container(
                          margin:
                              EdgeInsets.only(left: 15, right: 10, bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(MdiIcons.cartMinus),
                        title: Text(
                          "Ofertas",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {},
                      )
                    ]),
                    Stack(children: [
                      Positioned(
                        height: 56,
                        width: 288,
                        child: Container(
                          margin:
                              EdgeInsets.only(left: 15, right: 10, bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(MdiIcons.bottleTonicPlusOutline),
                        title: Text(
                          "Telemedicina",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {},
                      )
                    ]),

                    Stack(children: [
                      Positioned(
                        height: 56,
                        width: 288,
                        child: Container(
                          margin:
                              EdgeInsets.only(left: 15, right: 10, bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(MdiIcons.bottleTonicPlusOutline),
                        title: Text(
                          "Add novo pet",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {},
                      )
                    ]),

                    Stack(children: [
                      Positioned(
                        height: 56,
                        width: 288,
                        child: Container(
                          margin:
                              EdgeInsets.only(left: 15, right: 10, bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(MdiIcons.bottleTonicPlusOutline),
                        title: Text(
                          "Suporte técnico",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {},
                      )
                    ]),

                    Stack(children: [
                      Positioned(
                        height: 56,
                        width: 288,
                        child: Container(
                          margin:
                              EdgeInsets.only(left: 15, right: 10, bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(MdiIcons.bottleTonicPlusOutline),
                        title: Text(
                          "Sair da conta",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {},
                      )
                    ]),

                    Divider(
                      color: Colors.white,
                      thickness: 0.2,
                      endIndent: 28,
                      indent: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          MdiIcons.helpCircleOutline,
                          color: Colors.white,
                          size: 16,
                        ),
                        Text(
                          " Cores de sua preferência",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [

                      RollingSwitch.icon(

                        initialState: _modoEscuro,

                        onChanged: (bool state) {
                         setState(() {
                           _modoEscuro = state;
                         });
                        },
                        rollingInfoRight: const RollingIconInfo(
                          icon: Icons.light_mode,
                          text: Text('Light'),
                          backgroundColor: Colors.white,

                        ),
                        rollingInfoLeft: const RollingIconInfo(
                          icon: Icons.dark_mode_outlined,
                          backgroundColor: Color(0xff7347EF),
                          text: Text('Dark'),
                        ),
                      ),

                    ])
                  ],
                )),
            body: CustomScrollView(slivers: [
              SliverAppBar(
                  backgroundColor: Colors.transparent,
                  toolbarHeight: 80,
                  elevation: 30,
                  pinned: true,
                  expandedHeight: 50,
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
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
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                /* IconButton(
                                    onPressed: () {
                                      print("clicado na seta");
                                    },
                                    icon: Icon(Icons.arrow_back)),*/
                                Padding(
                                  padding: EdgeInsets.only(left: 120),
                                  child: Text(
                                    "Olá ----- ",
                                    //textAlign: TextAlign.center,

                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 120),
                                  child: IconButton(
                                      onPressed: () {
                                        print("clicado no notificacao");
                                      },
                                      icon: Icon(MdiIcons.bellBadgeOutline)),
                                )
                              ],
                            )))
                  ]),
              SliverFillRemaining(
                hasScrollBody: true,
                child: Container(
                    //color: Color(0xFFF2F2F2),

                    //padding: const EdgeInsets.only(left: 30, right: 30),
                    child: SingleChildScrollView(
                        child: Column(children: [
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
                              left: 100, right: 50, bottom: 2, top: 2)),
                      Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Container(
                          padding: EdgeInsets.only(
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
                                  BorderRadius.all(Radius.circular(17)),
                            ),
                            child: TextFormField(
                              //para senha: obscureText: true,

                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                              ),
                              decoration: InputDecoration(
                                  fillColor: Color(0xFF3C10BB),
                                  prefixIcon: Icon(Icons.search, size: 18,),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(17),
                                    borderSide: const BorderSide(
                                      //color: Color(0xFFBDBECB),
                                      width: 1.0,
                                    ),
                                  ),
                                  // icon: ,
                                  hintText: "Digite os sintomas do seu pet",
                                  suffixIcon: Padding(
                                    padding: EdgeInsets.only(
                                        left: 1, right: 4, top: 3, bottom: 3),
                                    child: ElevatedButton(
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
                                              builder: (context) => const Teste()),
                                        );
                                      },
                                      child: Text(
                                        "IR",
                                        style: TextStyle(
                                            fontSize: 8,
                                            decoration: TextDecoration.none),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ),

                      Padding(padding: EdgeInsets.only(top: 10)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Icon(
                              Icons.calendar_month,
                              color: Color(0xFF3C10BB),
                            ),
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
                      Padding(padding: EdgeInsets.only(top: 8)),

                      SizedBox(
                        width: 120,
                        height: 120,
                        child: PageView.builder(
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

                      Padding(padding: EdgeInsets.all(4)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /*Icon(Icons.circle, size: 12, color: Colors.grey),
                          Icon(Icons.circle, size: 12, color: Colors.grey),
                          Icon(Icons.circle, size: 12, color: Colors.grey),*/

                          Container(
                            margin: EdgeInsets.all(5),
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: posicaoSlide == 0 ? cores[0] : cores[1],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: posicaoSlide == 1 ? cores[0] : cores[1],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: posicaoSlide == 2 ? cores[0] : cores[1],
                            ),
                          ),
                        ],
                      ),

                      // ],
                      // )),*/
                      Padding(padding: EdgeInsets.all(5)),
                      Container(
                          padding: EdgeInsets.only(bottom: 18, top: 10),
                          margin:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                MdiIcons.stethoscope,
                                size: 18,
                                color: Color(0xFF3C10BB),
                              ),
                              Text(
                                "   Consultas de meus PETS   ",
                                style: TextStyle(
                                    color: Color(0xFF3C10BB),
                                    fontSize: 14,
                                    decoration: TextDecoration.none),
                              ),
                              Icon(
                                MdiIcons.chevronRight,
                                size: 18,
                                color: Color(0xFF3C10BB),
                              ),
                            ],
                          )),
                      Padding(padding: EdgeInsets.all(10)),
                      Container(
                          padding: EdgeInsets.only(bottom: 10, top: 10),
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 20.0),
                          //color: Colors.white,
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.,
                            children: [

                              Text(
                                " |  Dicas do especialista ",
                                style: TextStyle(
                                    color: Color(0xFF3C10BB),
                                    fontSize: 14,
                                    decoration: TextDecoration.none),
                              ),
                            ],
                          )),
                     // Padding(padding: EdgeInsets.all(5)),

                      SizedBox(
                        width: double.infinity,
                        child: Container(
                          margin: EdgeInsets.only(left: 120, right: 120),
                          decoration: const BoxDecoration(
                              color: Colors.orange,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: CarouselSlider(

                            items: [
                              Center(
                                child: _controller.value.isInitialized
                                    ? AspectRatio(
                                        aspectRatio:
                                            _controller.value.aspectRatio,
                                        child: VideoPlayer(_controller),
                                      )
                                    : Container(),
                              ),
                            ],
                            options: CarouselOptions(
                              height: 120,

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
                              // enlargeFactor: 0.3,
                              //onPageChanged: callbackFunction,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        ),
                      ),

                          Container(
                              padding: EdgeInsets.only(bottom: 10, top: 10),
                              margin:
                              const EdgeInsets.only(left: 10.0, right: 20.0),
                              //color: Colors.white,
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.,
                                children: [

                                  Text(
                                    " |  Dicas do especialista ",
                                    style: TextStyle(
                                        color: Color(0xFF3C10BB),
                                        fontSize: 14,
                                        decoration: TextDecoration.none),
                                  ),
                                ],
                              )),
                          SizedBox(
                            width: 260,
                            height: 120,
                            child: PageView.builder(
                              onPageChanged: (posicao) {
                                setState(() {
                                  posicaoSlide = posicao;
                                });
                              },

                              itemCount: _listSlideVideos.length,
                              itemBuilder: (_, currentIndex) {

                                return SlideVideo(
                                  //image: _listSlideVideos[currentIndex],
                                   video: _listSlideVideos[currentIndex],

                                );
                              },
                            ),
                          ),




                      // ])
                    ]))),
              )
            ])));
  }
}
