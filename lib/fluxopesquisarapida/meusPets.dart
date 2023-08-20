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
import '../firebase/doenca_service.dart';
import '../firebase_options.dart';
import '../objetos/doenca.dart';
import '../objetos/paciente.dart';
import '../recursos/Variaveis.dart';
import '../recursos/dialogUtils.dart';

import 'package:vetadvisor/fluxoprontuariodigital/cadastreOPet.dart';

class MeusPacientes extends StatelessWidget {
  const MeusPacientes({super.key});

  @override
  Widget build(BuildContext context) {
    return const MeusPacientesPage();
  }
}

class MeusPacientesPage extends StatefulWidget {
  const MeusPacientesPage({Key? key}) : super(key: key);

  @override
  State<MeusPacientesPage> createState() => _MeusPacientesPageState();
}

class _MeusPacientesPageState extends State<MeusPacientesPage> {
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
                                    Variaveis.pacientes.clear();
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
                            "Meus Pacientes",
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                    children: [

                  Padding(padding: EdgeInsets.only(top: 10)),

                  Flexible(

                    child: CustomScrollView(

                        slivers: <Widget>[
                          _getSlivers(Variaveis.pacientes, context)
                        ]
                    ),
                  ),

                  Padding(
                      padding: EdgeInsets.only(bottom: 20, right: 20),
                    child: FloatingActionButton(
                        child: Icon(Icons.add),
                        onPressed: (){

                          Variaveis.pacienteEmEdicao = Paciente();

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (
                                    context) => CadastreOPet()),
                          );
                        }),
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

  SliverList _getSlivers(List<Paciente> myList, BuildContext context) {
    return SliverList(

      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {

        return buildRow(myList[index], index);
      },
        childCount: myList.length,
      ),
    );
  }

  buildRow(Paciente paciente, index) {



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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(padding: EdgeInsets.only(top: 10)),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: AutoSizeText(paciente.nome!,
                                        maxLines: 3,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold
                                      ),
                                        ),
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        child: Icon(Icons.edit_note_outlined),
                                        onTap: () {

                                          Variaveis.pacienteEmEdicao = paciente;

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (
                                                    context) => CadastreOPet()),
                                          );



                                        },
                                      ),

                                      Padding(padding: EdgeInsets.only(left: 15)),

                                      GestureDetector(
                                        child: Icon(Icons.highlight_remove_outlined),
                                        onTap: () {


                                          DialogUtils.showCustomDialog(
                                              context,
                                              title: "Atenção",
                                              text: "Tem certeza que deseja apagar o registro selecionado ?",
                                              botaoConfirma: "Sim",
                                              botaoExtra: "",
                                              botaoCancela: "Não",
                                              funcaoBotaoConfirma: () async {
                                                if(await DoencaService.apagaPaciente(paciente.id.toString())) {
                                                  Navigator.of(context).pop();
                                                  Variaveis.pacientes.forEach((element) {
                                                    if(element.id == paciente.id) {
                                                      setState(() {
                                                        Variaveis.pacientes.remove(element);
                                                      });
                                                    }
                                                  });
                                                } else {
                                                  Navigator.of(context).pop();
                                                  final snackBar = SnackBar(
                                                    content: const Text("Ocorreu um erro ao tentar apagar o registro. Tente novamente mais tarde."),
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

                                              },
                                              funcaoBotaoExtra: () {},
                                              funcaoBotaoCancela: (){
                                                Navigator.of(context).pop();
                                              }
                                          );



                                        },
                                      )

                                    ],
                                  )
                                ]
                            ),

                            //const Padding(padding: EdgeInsets.only(top: 5)),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(padding: EdgeInsets.only(top: 10)),
                                AutoSizeText("Espécie: ${paciente.especie!}",

                                    style: TextStyle(
                                        color: Color(0xFF59616E))

                                ),
                                const Padding(padding: EdgeInsets.only(top: 10)),


                                AutoSizeText("Raça: ${paciente.raca!}",

                                    style: TextStyle(
                                        color: Color(0xFF59616E))

                                ),
                                const Padding(padding: EdgeInsets.only(top: 10)),


                                AutoSizeText("Sexo: ${paciente.sexo!}",

                                    style: TextStyle(
                                        color: Color(0xFF59616E))

                                ),
                                const Padding(padding: EdgeInsets.only(top: 10)),

                                AutoSizeText("Idade: ${calculaIdade(paciente.nascimento!.toDate())}",

                                    style: TextStyle(
                                        color: Color(0xFF59616E))

                                ),

                                const Padding(padding: EdgeInsets.only(top: 10)),

                                AutoSizeText("Responsável: ${paciente.responsavel!}",

                                    style: TextStyle(
                                        color: Color(0xFF59616E))

                                ),
                                const Padding(padding: EdgeInsets.only(top: 10)),

                                AutoSizeText("ID: ${paciente.id!}",

                                    style: TextStyle(
                                        color: Color(0xFF59616E))

                                ),
                                const Padding(padding: EdgeInsets.only(top: 10)),



                                /*
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

                                 */
                              ],
                            ),






                            const Padding(padding: EdgeInsets.only(top: 10)),

                          ],

                        ),
                      )
                    )
                ),

                /*
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

                 */

              ],

            ),

          ],
        )
    );
  }




  int calculaIdade(DateTime birthDate) {

    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year - (birthDate.isAfter(currentDate.subtract(Duration(days: 365 * (currentDate.year - birthDate.year)))) ? 1 : 0);

    return age;
  }





}
