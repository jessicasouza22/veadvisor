// 1.5 Detalhe Da Pesquisa Resultado da Pesquisa 01

import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:vetadvisor/fluxopesquisarapida/DetalheDaPesquisaResultado02.dart';
import 'package:vetadvisor/fluxopesquisarapida/detalheDaPesquisaDermatiteAtopica.dart';
import 'package:vetadvisor/fluxopesquisarapida/home.dart';
import 'package:vetadvisor/fluxoprontuariodigital/cadastreOPet.dart';
import 'package:vetadvisor/fluxoprontuariodigital/perfilPaciente.dart';
import 'package:vetadvisor/inicio.dart';
import 'package:vetadvisor/recursos/Constants.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class DetalheDaPesquisaResultado01 extends StatelessWidget {
  const DetalheDaPesquisaResultado01 ({super.key});

  @override
  Widget build(BuildContext context) {
    return const DetalheDaPesquisaResultado01Page();
  }
}

class DetalheDaPesquisaResultado01Page extends StatefulWidget {
  const DetalheDaPesquisaResultado01Page({Key? key}) : super(key: key);

  @override
  State<DetalheDaPesquisaResultado01Page> createState() => _DetalheDaPesquisaResultado01State();
}

class _DetalheDaPesquisaResultado01State extends State<DetalheDaPesquisaResultado01Page> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
        AppBar(
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
                                          builder: (
                                              context) => const PerfilPaciente()),
                                    );

                                    //print("clicado na seta");
                                  },
                                  icon: const Icon(Icons.arrow_back))),
                          Text(
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
                  child: SingleChildScrollView(
                    child: Column(children: [


                      Padding(padding: EdgeInsets.only(top: 10)),

                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Column(children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 30,
                                  width: 350,
                                  child: TextFormField(
                                    //para senha: obscureText: true,

                                    textAlign: TextAlign.center,

                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                    decoration: InputDecoration(
                                        border: InputBorder.none, // tira a borda do TextField
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
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Text(
                            "Prurido generalizado; Maneios de cabeça; Febre",
                            style: TextStyle(color: Color(0xFF8F90A6)),
                          )

                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Builder(
                            builder: (context) => ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const DetalheDaPesquisaDermatiteAtopica()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: const StadiumBorder(),
                                    backgroundColor: Color(0XFF4116B4)),
                                child: const Text(
                                  'Realizar Nova Pesquisa',
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        ],
                      ),

                      // Padding(padding: EdgeInsets.only(top: 5)),

                      Padding(padding: EdgeInsets.only(top: 10)),

                      Container(
                          margin: EdgeInsets.only(right: 210),
                          child: Text(
                            "Resultado da pesquisa",
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold),
                          )),


                      const Divider(
                        color: Color(0xFF12EC1A),
                        thickness: 0.8,
                        endIndent: 230,
                        indent: 20,
                      ),

                      Container(
                        padding: EdgeInsets.only(left: 10),
                        margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 5)),
                            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                              Text("Dermatite atópica",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ]),
                            Row(
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
                                  color: Colors.transparent,
                                  size: 10,
                                ),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 5)),
                            Row(
                              children: [
                                Text("Alérgia comum em cães da raça shih tzu",
                                    style: TextStyle(
                                      color: Color(0xFF59616E),
                                    )),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 10)),
                          ],
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.all(2),
                        //  margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color(0xFF4116B4),
                        ),
                        child:  Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 10,
                                )),


                      Container(
                        padding: EdgeInsets.only(left: 10),
                        margin: EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 5)),
                            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                              Text("Otite externa",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ]),
                            Row(
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
                                  color: Colors.transparent,
                                  size: 10,
                                ),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 5)),
                            Row(
                              children: [
                                Text(
                                    "Infecção comum em cães com predisposição a \n dermatite atópica e que frequentam banho ",
                                    style: TextStyle(
                                      color: Color(0xFF59616E),
                                    )),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 10)),
                          ],
                        ),
                      ),

                      Container(
                          padding: const EdgeInsets.all(2),
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

                      Container(
                        padding: EdgeInsets.only(left: 10),
                        margin: EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 5)),
                            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                              Text("Otite média",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ]),
                            Row(
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
                                  color: Colors.transparent,
                                  size: 10,
                                ),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 5)),
                            Row(
                              children: [
                                Text(
                                    "Sempre elimine essa possibilidade se estiver \n suspeitando de otite externa, por que se for  ",
                                    style: TextStyle(
                                      color: Color(0xFF59616E),
                                    )),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 10)),
                          ],
                        ),
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
                                        builder: (context) => const DetalheDaPesquisaResultado02()),
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
                                  child: Row(children: [
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



                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        padding: const EdgeInsets.only(bottom: 50),
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
                  ]))))]));

  }
}
