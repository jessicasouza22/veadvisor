//1.1  Detalhe Da Pesquisa Agendamento da Consulta

import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vetadvisor/fluxodeagendamentodeconsulta/msgDetalheDaPesquisaAgendamentoDeConsulta.dart';
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
import '../firebase/doenca_service.dart';
import '../firebase_options.dart';
import '../fluxopesquisarapida/detalheDaPesquisa.dart';
import '../objetos/doenca.dart';
import '../recursos/Variaveis.dart';
import '../recursos/dialogUtils.dart';

import 'package:vetadvisor/fluxoprontuariodigital/cadastreOPet.dart';

class DetalheDaPesquisaAgendamentoDaConsulta extends StatelessWidget {
  const DetalheDaPesquisaAgendamentoDaConsulta({super.key});


  @override
  Widget build(BuildContext context) {
    return const DetalheDaPesquisaAgendamentoDaConsultaPage();
  }
}

class DetalheDaPesquisaAgendamentoDaConsultaPage extends StatefulWidget {
  const DetalheDaPesquisaAgendamentoDaConsultaPage({Key? key}) : super(key: key);



  @override
  State<DetalheDaPesquisaAgendamentoDaConsultaPage> createState() => _DetalheDaPesquisaAgendamentoDaConsultaPageState();
}

class _DetalheDaPesquisaAgendamentoDaConsultaPageState extends State<DetalheDaPesquisaAgendamentoDaConsultaPage> {


  String _nomeUsuarioLogado = "";

  final _busca = TextEditingController();




  bool _buscandoSintomaNoBancoDeDados = false;

  bool _visibilidadeDoTituloResultadoDaPesquisa = true;

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
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: const Column(children: [
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
                                    Variaveis.sintomaBuscado.clear();
                                    Navigator.of(context).pop();
                                    /*
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const PerfilPaciente()),
                                    );

                                     */

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
                      child: TextFormField(
                        controller: _busca,
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
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
                                      color: Colors.transparent))),
                          hintText: "Adicione mais informações",
                          suffixIcon: Builder(
                              builder: (context) => IconButton(
                                  onPressed: () {

                                    final currentFocus = FocusScope.of(context);
                                    currentFocus.unfocus();

                                    DialogUtils.dialogBuscandoNoBanco(context);

                                    setState(() {
                                      if(!Variaveis.sintomaBuscado.contains(_busca.text)) {

                                        buscarDoencas(_busca.text, Variaveis.especieSelecionada, Variaveis.buscaCompleta);
                                      } else {

                                      }

                                    });

                                  },
                                  icon: const Icon(Icons.add_circle_outline,
                                      size: 15,
                                      color: Color(0xFF979797)))),),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10, top: 10),

                      child: Wrap(
                        spacing: 8.0, // gap between adjacent chips
                        runSpacing: 4.0, // gap between lines
                        children: <Widget>[
                          for (var nome in Variaveis.sintomaBuscado)

                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(nome),
                                const Padding(padding: EdgeInsets.only(right: 2)),
                                GestureDetector(
                                  onTap: (){
                                    if(Variaveis.sintomaBuscado.contains(nome)) {
                                      setState(() {
                                        Variaveis.sintomaBuscado.remove(nome);
                                      });
                                      for (var doencaDoSintomaClicado in Variaveis.doencas) {
                                        bool jaExiste = Variaveis.doencas.any((doenca) => doenca.nome == nome);
                                        if (!jaExiste) {
                                          setState(() {
                                            Variaveis.doencas.remove(doencaDoSintomaClicado);
                                          });
                                        }
                                      }

                                    }
                                  },
                                  child: const Icon(MdiIcons.closeCircleOutline, color: Colors.red, size: 10),
                                )

                              ],
                            )

                        ],
                      ),
                    ),


                    Column(
                      children: [
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
                      ],
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
                                _Alerta01ShowAlertDialog(context);
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

                                  DialogUtils.showCustomDialog(
                                      context,
                                      title: "Versão beta",
                                      text: "Compartilhamento será liberado na próxima versão do Vet Advisor",
                                      botaoConfirma: "OK",
                                      botaoExtra: "",
                                      botaoCancela: "",
                                      funcaoBotaoConfirma: (){
                                        Navigator.of(context).pop();
                                      },
                                      funcaoBotaoExtra: (){},
                                      funcaoBotaoCancela: (){});

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

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Esta informação foi útil para você? ",
                        style: TextStyle(
                          color: Color(0xFF12EC1A)
                        ),),
                        
                        Icon(MdiIcons.thumbUpOutline,
                            color: Color(0xFF979797)),

                        Icon(MdiIcons.thumbUpOutline,
                        color: Colors.transparent),

                        Icon(MdiIcons.thumbUpOutline,
                            color: Color(0xFF979797)),


                      ]
                    ),

                    Padding(padding: EdgeInsets.all(10)),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                      /*  PageView(
                          children: [
                            buildContainer1(),
                          ],
                        )*/

                      ],
                    )
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

    int _pontuacao = 0;


    return Padding(
        padding: const EdgeInsets.only(right: 5, left: 5),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [

                Container(
                  // esse container deve variar o tamanho de acordo com o conteúdo
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Card(
                        child: Container(

                          padding: const EdgeInsets.only(left: 10),

                          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),

                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)
                              )
                          ),

                          child: Column(
                            children: [
                              const Padding(padding: EdgeInsets.only(top: 5)),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: AutoSizeText(doenca.nome!,
                                          maxLines: 3,
                                          style: TextStyle(
                                              color: !doenca.cardExpandido! ? Colors.black : const Color(0xFF4116B4),
                                              fontSize: !doenca.cardExpandido! ? null : 20,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ]
                              ),
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
                                child: AutoSizeText(doenca.dicas! != "" ? doenca.dicas! : "Doença sem descrição cadastrada no banco de dados",
                                    style: const TextStyle(
                                      color: Color(0xFF59616E),
                                    ), maxLines: 10),
                              ),
                              Visibility(
                                  visible: doenca.cardExpandido!,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Padding(padding: EdgeInsets.only(top: 10)),
                                      const AutoSizeText("Achados clínicos",

                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF59616E))

                                      ),
                                      const Padding(padding: EdgeInsets.only(top: 10)),
                                      Container(

                                        child: Wrap(
                                          spacing: 4,

                                          children: (doenca.sinais ?? "")
                                              .replaceAll("[", "")
                                              .replaceAll("]", "")
                                              .split(',')
                                              .map((item) => Row(
                                              mainAxisSize: MainAxisSize.min,

                                              children: <Widget>[


                                                achadosClinicos(item.trim())

                                                /*
                                            Text(item.trim(),
                                                style: const TextStyle(color: Color(0xFF59616E))),
                                            const Icon(Icons.add_circle_outline, color: Color(0xFF12EC1A), size: 10),

                                             */
                                              ]
                                          )
                                          )
                                              .toList(),
                                        ),
                                      ),
                                      const Padding(padding: EdgeInsets.only(top: 10)),

                                      const AutoSizeText("Exames recomendados",

                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF59616E))

                                      ),
                                      const Padding(padding: EdgeInsets.only(top: 10)),
                                      Wrap(
                                        spacing: 4,

                                        children: (doenca.exComp ?? "")
                                            .replaceAll("[", "")
                                            .replaceAll("]", "")
                                            .split('.')
                                            .map((item) => Row(
                                            mainAxisSize: MainAxisSize.min,

                                            children: <Widget>[


                                              outrosItens(item.trim())

                                              /*
                                          Text(item.trim(),
                                              style: const TextStyle(color: Color(0xFF59616E))),
                                          const Icon(Icons.add_circle_outline, color: Color(0xFF12EC1A), size: 10),

                                           */
                                            ]
                                        )).toList(),
                                      ),

                                      const Padding(padding: EdgeInsets.only(top: 10)),
                                      const AutoSizeText("Fatores de risco",

                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF59616E))

                                      ),
                                      const Padding(padding: EdgeInsets.only(top: 10)),


                                      Wrap(
                                        spacing: 4,

                                        children: (doenca.fatoresDeRisco ?? "")
                                            .replaceAll("[", "")
                                            .replaceAll("]", "")
                                            .split('.')
                                            .map((item) => Row(
                                            mainAxisSize: MainAxisSize.min,

                                            children: <Widget>[
                                              outrosItens(item.trim())
                                            ]
                                        )).toList(),
                                      ),
                                    ],
                                  )
                              ),


                              const Padding(padding: EdgeInsets.only(top: 10)),

                            ],

                          ),
                        )
                    )
                ),

                Positioned(
                  bottom: 0,
                  child: Container(
                      padding: const EdgeInsets.only(left:2, right: 2, top: 2, bottom: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color(0xFF4116B4),
                      ),
                      child: GestureDetector(
                          onTap: (){
                            setState(() {
                              doenca.cardExpandido = !doenca.cardExpandido!;
                              _visibilidadeDoTituloResultadoDaPesquisa = !_visibilidadeDoTituloResultadoDaPesquisa;
                            });

                          },
                          child: Icon(
                            doenca.cardExpandido! ? Icons.remove : Icons.add,
                            color: Colors.white,
                            size: 15,
                          ))

                  ),
                ),

              ],

            ),

          ],
        )
    );
  }

  Widget itemBuscado(String item) {

    return Row(
      children: [
        Text(item,
          style: const TextStyle(color: Color(0xFF8F90A6)),
        ),
        GestureDetector(
            onTap: (){
              if(Variaveis.sintomaBuscado.contains(item)){
                setState(() {
                  Variaveis.sintomaBuscado.remove(item);
                });

              }
            },
            child: const Icon(
                Icons.highlight_remove_outlined,
                color: Colors.red,
                size: 12)
        )

      ],
    );
    /*
    return Chip(
      label: Text(item),
      backgroundColor: Colors.blue,
      labelStyle: TextStyle(color: Colors.white),
    );

     */






  }

  Widget itemPesquisado(String item) {
    return Row(
      children: [
        Text(item),
        Icon(MdiIcons.deleteCircleOutline)
      ],
    );

  }



  Widget achadosClinicos(String item) {

    return Row(
      children: [
        Text(item,
          style: const TextStyle(color: Color(0xFF8F90A6)),
        ),
        GestureDetector(
            onTap: (){

              print(item);
            },
            child: const Icon(
                Icons.add_circle_outline,
                color: Color(0xFF12EC1A),
                size: 12)
        )

      ],
    );
  }

  Widget outrosItens(String item) {


    return Flexible(
      child: AutoSizeText("$item ",

        maxLines: 10,
        style: const TextStyle(color: Color(0xFF8F90A6)),
      ),
    );
  }


  Future<void> buscarDoencas(sinal, especie, buscaCompleta) async {

    List<Doenca> _doencasEncontradas = [];
    try{
      _doencasEncontradas = await DoencaService.buscaDoencas(sinal, especie, buscaCompleta);

    } catch (Exception){

    }
    for (var doencaEncontrada in _doencasEncontradas) {
      bool jaExiste = Variaveis.doencas.any((doenca) => doenca.nome == doencaEncontrada.nome);
      if (!jaExiste) {
        setState(() {
          Variaveis.doencas.add(doencaEncontrada);
        });
      }
    }


    if(_doencasEncontradas.length > 0) {
      Variaveis.sintomaBuscado.add(sinal);
    } else {
      final snackBar = SnackBar(
        content: const Text('Não existem resultados para os parâmetros informados'),
        action: SnackBarAction(
          label: 'Fechar',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

    }



    setState(() {
      _buscandoSintomaNoBancoDeDados = false;
    });

    // Necessário repetir para fechar o dialog de busca e o de carregamento
    Navigator.of(context).pop();






  }

  buildContainer1() {
    /*return Container(


      margin: EdgeInsets.only(left: 15, right: 15),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white, // Cor de fundo do Container
        borderRadius: BorderRadius.circular(
            10), // Define o raio do arredondamento das bordas
      ),


      child:

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                      color: Colors.lightGreenAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                        child:
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Color(0xFF3C10BB),

                          child: ClipOval(

                            child:
                            Image.asset("imagens/uhtred.jpeg"),

                          ),
                        ))),

              ]),

          Padding(padding: EdgeInsets.only(left: 10)),

          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("João Clovis",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),)
                  ],
                ),

                Padding(padding: EdgeInsets.all(2)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Dermatologista",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF82888A),

                      ),)
                  ],
                ),

                Padding(padding: EdgeInsets.all(2)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Text("150,00 a consulta",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF82888A),

                      ),)
                  ],
                ),

                Row(
                  children: [
                    Container(
                      width: 100,
                      height: 20,
                      child:
                      Builder(
                        builder: (context) =>
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor: Color(0xff12EC1A),
                                  // minimumSize: MaterialStateProperty.all(Size(50, 100))
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const DetalheDaPesquisa()),
                                  );
                                },
                                child: const Text(
                                  'Agendar Consulta',
                                  style: TextStyle(
                                      color: Color(0xff1A3D8E), fontSize: 8),
                                )),
                      ),),
                  ],
                )
              ]),

          Padding(padding: EdgeInsets.only(left: 10)),

          Column(

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [


                  Icon(Icons.star,
                    color: Color(0xFFFBB509),
                    size: 18,),

                  Text("(17 avaliações)",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF82888A),

                    ),),
                  Icon(MdiIcons.chevronRight,
                    color: Color(0xFF979797),
                    size: 12,),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("ocupar espaço",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.transparent,

                    ),)
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [


                  Icon(MdiIcons.mapMarkerOutline,
                    color: Color(0xFF979797),
                    size: 18,),

                  Text("3 km de você",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF82888A),

                    ),),

                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Recomendado",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFFFBB509),

                    ),)
                ],
              ),

            ],
          )
        ],
      ),
    );*/

  }

// MÉTODO PARA CHAMAR A MENSAGEM DE ALERTA

  void _Alerta01ShowAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        // title: const Text('Atenção'),
        content:
        Column(children: [

          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Icon(MdiIcons.thumbUpOutline,
                    color: Color(0xFF12EC1A)),

                Padding(padding:EdgeInsets.only(left: 10)),

                Text("Envie um feedback adicional",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF3C10BB),
                        fontWeight: FontWeight.bold,

                        fontSize: 15)
                )



              ]),

          Padding(padding:EdgeInsets.all(10)),

          CupertinoTextField(
            placeholder: 'Deixe um comentário ou depoimento de\n sua incrível experiência em nosso site.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey,

            ),
          ),

          Padding(padding:EdgeInsets.all(10)),

          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Builder(
                  builder: (context) => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: Color(0xFF3C10BB)),
                    onPressed: () {
                    _Alerta02ShowAlertDialog(context);
                    },
                    child: const Text(
                      'Enviar feedback',
                      style: TextStyle(color: Colors.white,
                    ),),
                )),
              ])



        ]),
        actions: <CupertinoDialogAction>[

        ],
      ),
    );
  }

  void _Alerta02ShowAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        // title: const Text('Atenção'),
        content:

        Column(children: [

          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Icon(MdiIcons.thumbDownOutline,
                    color: Colors.redAccent),

                Padding(padding:EdgeInsets.only(left: 10)),

                Text("Gostaríamos de te ouvir,\n deixe sua sugestão!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF3C10BB),
                        fontWeight: FontWeight.bold,

                        fontSize: 15)
                )



              ]),

          Padding(padding:EdgeInsets.all(10)),

          CupertinoTextField(
            placeholder: 'Gostaríamos de te ouvir, deixe sua sugestão!\n deixe sua sugestão!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey,

            ),
          ),

          Padding(padding:EdgeInsets.all(10)),

          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Não encontrei um especialista próximo",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF8F90A6),
                        fontSize: 10)
                )
              ]),

          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("O valor da consulta está alto para mim",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF8F90A6),
                        fontSize: 10)
                )
              ]),

          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Isso não é útil",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF8F90A6),
                        fontSize: 10)
                )
              ]),

          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Builder(
                    builder: (context) => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: Color(0xFF3C10BB)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              const MsgDetalheDaPesquisaAgendamento(),
                        ));
                      },
                      child: const Text(
                        'Enviar feedback',
                        style: TextStyle(color: Colors.white,
                        ),),
                    )),
              ])



        ]),

        actions: <CupertinoDialogAction>[

        ],
      ),
    );
  }




}
