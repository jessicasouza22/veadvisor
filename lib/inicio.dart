import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vetadvisor/prelogin/slideVideo.dart';
import 'package:vetadvisor/prelogin/slide_tile.dart';
import 'package:video_player/video_player.dart';
import 'package:vetadvisor/recursos/Constants.dart';
import 'package:rolling_switch/rolling_switch.dart';
import '../firebase_options.dart';
import '../recursos/dialogUtils.dart';

import 'package:vetadvisor/fluxoprontuariodigital/cadastreOPet.dart';

class InicioVeterinario extends StatelessWidget {
  const InicioVeterinario({super.key});

  @override
  Widget build(BuildContext context) {
    return const InicioVeterinarioPage();
  }
}

class InicioVeterinarioPage extends StatefulWidget {
  const InicioVeterinarioPage({Key? key}) : super(key: key);

  @override
  State<InicioVeterinarioPage> createState() => _InicioVeterinarioPageState();
}

class _InicioVeterinarioPageState extends State<InicioVeterinarioPage> {
  late VideoPlayerController _controller;
  late VideoPlayerController _controllerV;

  String _nomeUsuarioLogado = "";

  final List<IconData> _icone_volume = [
    Icons.volume_off_sharp,
    Icons.volume_up_sharp
  ];
  int _posicao_volume = 1;
  double _volume = 100;

  late final FirebaseAuth auth;
  late final FirebaseApp app;

  bool _modoEscuro = false;

  //final PageController _pageController = PageController(viewportFraction: 0.8);
  // ele vai controlar o listView
  int posicaoSlide = 0;
  int posicalCarrouselEspecialista = 0;

  List<MaterialColor> cores = [Colors.red, Colors.grey];

  //late Future<void> _initializeVideoPlayerFuture;

  @override
  // aqui inicia o vídeo controller
  void initState() {
    _controller = VideoPlayerController.network(
      "https://firebasestorage.googleapis.com/v0/b/vetadvisor-2d900.appspot.com/o/Som%20de%20Cachorro%20e%20Cachorrinhos%20Latindo%20-%20Fatos%20Curiosos%20Sobre%20C%C3%A3es.mp4?alt=media&token=9a2d5805-0114-4cb5-b7da-38ff1fdfa16a",
    )..initialize().then((_) {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.play();

    //_initializeVideoPlayerFuture = _controllerV.initialize();
    _controllerV = VideoPlayerController.network(
      "https://firebasestorage.googleapis.com/v0/b/vetadvisor-2d900.appspot.com/o/Som%20de%20Cachorro%20e%20Cachorrinhos%20Latindo%20-%20Fatos%20Curiosos%20Sobre%20C%C3%A3es.mp4?alt=media&token=9a2d5805-0114-4cb5-b7da-38ff1fdfa16a",
    )..initialize().then((_) {
      setState(() {});
    });
    _controllerV.setLooping(true);
    _controllerV.play();

    carregaDadosLogin();

    super.initState();
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
  void dispose() {
    _controllerV.dispose();
    _controller.dispose();
    super.dispose();
  }

  int _currentPageVideo = 0;
  final _listSlideVideo = ['', '', ''];

  @override
  Widget build(BuildContext context) {
    final bool isActive;
    bool status = false;
    int _indexCarrouselEspecialista = 0;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
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
                            "$_nomeUsuarioLogado\n\n$_nomeUsuarioLogado}",
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
                      /* Positioned(
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
                      ),*/
                      ListTile(
                        leading:
                        Icon(MdiIcons.bellOutline, color: Colors.white),
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
                      /* Positioned(
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
                      ),*/
                      ListTile(
                        leading:
                        Icon(MdiIcons.stethoscope, color: Colors.white),
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
                      /*Positioned(
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
                      ),*/
                      ListTile(
                        leading: Icon(MdiIcons.calendarClockOutline,
                            color: Colors.white),
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
                      /*Positioned(
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
                      ),*/
                      ListTile(
                        leading:
                        Icon(MdiIcons.stethoscope, color: Colors.white),
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
                      /*Positioned(
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
                      ),*/
                      ListTile(
                        leading:
                        Icon(MdiIcons.stethoscope, color: Colors.white),
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
                      /*Positioned(
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
                      ),*/
                      ListTile(
                        leading: Icon(MdiIcons.cartMinus, color: Colors.white),
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
                      /* Positioned(
                        height: 56,
                        width: 288,
                        child: Container(
                          margin:
                              const EdgeInsets.only(left: 15, right: 10, bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),*/
                      ListTile(
                        leading: Icon(MdiIcons.bottleTonicPlusOutline,
                            color: Colors.white),
                        title: const Text(
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
                      /*Positioned(
                        height: 56,
                        width: 288,
                        child: Container(
                          margin:
                              const EdgeInsets.only(left: 15, right: 10, bottom: 5),
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),*/
                      ListTile(
                        leading: const Icon(MdiIcons.bottleTonicPlusOutline,
                            color: Colors.white),
                        title: const Text(
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
                      /*Positioned(
                        height: 56,
                        width: 288,
                        child: Container(
                          margin:
                              const EdgeInsets.only(left: 15, right: 10, bottom: 5),
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),*/
                      ListTile(
                        leading: const Icon(MdiIcons.bottleTonicPlusOutline,
                            color: Colors.white),
                        title: const Text(
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
                      /* Positioned(
                        height: 56,
                        width: 288,
                        child: Container(
                          margin:
                              const EdgeInsets.only(left: 15, right: 10, bottom: 5),
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),*/
                      ListTile(
                        leading: const Icon(MdiIcons.bottleTonicPlusOutline,
                            color: Colors.white),
                        title: const Text(
                          "Sair da conta",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          DialogUtils.showCustomDialog(
                            context,
                            title: "Efetuar logoff",
                            text:
                            "Tem certeza que deseja efetuar logoff do aplicativo Vet Advisor ?",
                            botaoConfirma: "Sim",
                            botaoExtra: "",
                            botaoCancela: "Cancelar",
                            funcaoBotaoConfirma: () {
                              auth
                                  .signOut()
                                  .then((value) => Phoenix.rebirth(context))
                                  .onError((error, stackTrace) => null);
                            },
                            funcaoBotaoExtra: () {},
                            funcaoBotaoCancela: () {},
                          );

                          //wallace
                        },
                      )
                    ]),

                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                      endIndent: 28,
                      indent: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
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
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                                Container(),
                                AutoSizeText(
                                  "Olá $_nomeUsuarioLogado",
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
                      Center(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                          child: Row(
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
                          )),

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
                                  hintText: "Digite aqui a suspeita clínica",
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
                                                  const CadastreOPet()),
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

                      Padding(padding: EdgeInsets.only(top: 15)),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Icon(
                              MdiIcons.stethoscope,
                              color: Color(0xFF3C10BB),
                              size: 14,
                            ),
                          ),
                          Text(
                            " Iniciar nova consulta",
                            style: TextStyle(
                              color: Color(0xFF3C10BB),
                              decoration: TextDecoration.none,
                              fontSize: 14,
                            ),
                          ),
                          Icon(MdiIcons.chevronRight, color: Color(0xFF59616E), size: 18)
                        ],
                      ),


                      Padding(padding: EdgeInsets.only(top: 10)),

                      Divider(
                        color: Color(0xFF6F767E),
                        thickness: 0.2,
                        endIndent: 50,
                        indent: 50,
                      ),

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
                                Text(
                                  " |  Próximas consultas ",
                                  style: TextStyle(
                                      color: Color(0xFF3C10BB),
                                      fontSize: 14,
                                      decoration: TextDecoration.none),
                                ),

                                ElevatedButton(
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.only(
                                        top: 5, right: 10, left: 10, bottom: 5),

                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(2)),
                                    // Background Color
                                  ),
                                  onPressed: () {}, child:
                                Text("Ver todos",
                                  style: TextStyle(
                                    color: Color(0xFF8F90A6),
                                  ),),),

                                Icon(MdiIcons.chevronRight, color: Color(0xFF59616E), size: 18)



                               ])),



                    ])),
              )
              )])));
  }
}
