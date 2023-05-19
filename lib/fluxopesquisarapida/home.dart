//1.1 e 1.3

import 'package:auto_size_text/auto_size_text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vetadvisor/fluxopesquisarapida/resultadoDaPesquisa.dart';
import 'package:vetadvisor/fluxoprontuariodigital/consultaPaciente.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

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
                        padding: const EdgeInsets.only(left: 0),
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
                              "Home",
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
                decoration: const BoxDecoration(
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
                )),


                //color: Color(0xFFF5F5F5),
                child: SingleChildScrollView(
                    child: Column(children: [
                      const Padding(padding: EdgeInsets.only(top: 15)),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Text("O que voce precisa hoje?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,

                      ),),
                      ]),

                      const Padding(padding: EdgeInsets.only(top: 15)),

                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Faça a triagem do seu paciente",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,

                              ),),
                          ]),

                      const Padding(padding: EdgeInsets.only(top: 15)),

                      Row(
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
                      ),

                      const Padding(padding: EdgeInsets.only(top: 15)),

                      Container(


                        margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                        borderRadius: BorderRadius.all( Radius.circular(10))),

                        child: Column(
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
                                          fillColor: const Color(0xFF12EC1A),

                                          // contentPadding: EdgeInsets.fromLTRB(20, 0, 12, 0),
                                          prefixIcon: const Icon(
                                            Icons.search,
                                            size: 15,
                                            color: Color(0xFF3C10BB),

                                          ),


                                          // icon: ,
                                          hintText: "Adicione mais informações",

                                            suffixIcon: const Icon(
                                              MdiIcons.navigationVariant,
                                              size: 15,
                                              color: Color(0xFF3C10BB),

                                            )
                                        ),
                                      ),),




                                  ]),


                            ]),
                      ),

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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text("Dermatite atópica",
                                      style: TextStyle(
                                        color: Color(0xFF4116B4),
                                        fontWeight: FontWeight.bold,
                                      ),),

                                  ],
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children:  [

                                    Icon(Icons.star,
                                      color: Colors.yellow,
                                      size: 10,),
                                    Text("Incluir diagnostico",
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),),
                                    Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Colors.green,

                                      //fillColor: MaterialStateProperty.resolveWith(getColor),
                                      value: true,
                                      shape: CircleBorder(),
                                      onChanged: (value) {

                                      },
                                    ),
                                  ],
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Flexible(
                                        child: AutoSizeText(
                                          'Achados clínicos',
                                          style: TextStyle(
                                            color: Color(0xFF35364F),
                                            fontSize: 10,
                                          ),
                                          maxLines: 1,
                                          textAlign: TextAlign.justify,
                                        )),
                                  ],
                                ),
                                const Padding(padding: EdgeInsets.only(top: 10)),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Flexible(
                                        child: AutoSizeText(
                                          'Eritema, Prurido, Alopecia, Otite externa, Blefarite Prurido antes de aparecer as lesões, Lambe as patas e lambe outras partes do corpo excessivamente.',
                                          style: TextStyle(
                                            color: Color(0xFF59616E),
                                            fontSize: 10,
                                          ),
                                          maxLines: 3,
                                          textAlign: TextAlign.justify,
                                        )),
                                  ],
                                ),

                              ]
                          )
                      ),

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

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Flexible(
                                        child: AutoSizeText(
                                          'Exames recomendados',
                                          style: TextStyle(
                                            color: Color(0xFF35364F),
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 1,
                                          textAlign: TextAlign.justify,
                                        )),
                                  ],
                                ),
                                const Padding(padding: EdgeInsets.only(top: 10)),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Flexible(
                                        child: AutoSizeText(
                                          'Critérios de favrot et al, Teste cutâneo intradérmico e prick test',
                                          style: TextStyle(
                                            color: Color(0xFF59616E),
                                            fontSize: 10,
                                          ),
                                          maxLines: 3,
                                          textAlign: TextAlign.justify,
                                        )),
                                  ],
                                ),

                              ]
                          )
                      ),

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

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Flexible(
                                        child: AutoSizeText(
                                          'Fatores de risco',
                                          style: TextStyle(
                                            color: Color(0xFF35364F),
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 1,
                                          textAlign: TextAlign.justify,
                                        )),
                                  ],
                                ),
                                const Padding(padding: EdgeInsets.only(top: 10)),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Flexible(
                                        child: AutoSizeText(
                                          'Alergia alimentar, Hipersensibilidade à picada de pulgas, Ambiente domiciliar com alta quantidade de panos e fômites que acumulam poeira e ácaros, região com alta quantidade de pólen, região com longa estações do ano que proporcionam alergias, hereditariedade, Clima temperado e região com altos níveis de mofo',
                                          style: TextStyle(
                                            color: Color(0xFF59616E),
                                            fontSize: 10,
                                          ),
                                          maxLines: 3,
                                          textAlign: TextAlign.justify,
                                        )),
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
          )]));
  }
}
