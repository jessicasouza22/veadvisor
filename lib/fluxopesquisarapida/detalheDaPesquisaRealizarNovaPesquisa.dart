// 1.4 Detalhe Da Pesquisa Realizar Nova Pesquisa

import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:vetadvisor/fluxopesquisarapida/detalheDaPesquisaDermatiteAtopica.dart';
import 'package:vetadvisor/fluxopesquisarapida/home.dart';
import 'package:vetadvisor/fluxoprontuariodigital/cadastreOPet.dart';
import 'package:vetadvisor/fluxoprontuariodigital/perfilPaciente.dart';
import 'package:vetadvisor/inicio.dart';
import 'package:vetadvisor/recursos/Constants.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imageUrls = [
  'https://example.com/image1.jpg',
  'https://example.com/image2.jpg',
  'https://example.com/image3.jpg',
];


class DetalheDaPesquisaRealizarNovaPesquisa extends StatelessWidget {
  const DetalheDaPesquisaRealizarNovaPesquisa ({super.key});

  @override
  Widget build(BuildContext context) {
    return const DetalheDaPesquisaRealizarNovaPesquisaPage();
  }
}

class DetalheDaPesquisaRealizarNovaPesquisaPage extends StatefulWidget {
  const DetalheDaPesquisaRealizarNovaPesquisaPage({Key? key}) : super(key: key);

  @override
  State<DetalheDaPesquisaRealizarNovaPesquisaPage> createState() => _DetalheDaPesquisaRealizarNovaPesquisaState();
}

class _DetalheDaPesquisaRealizarNovaPesquisaState extends State<DetalheDaPesquisaRealizarNovaPesquisaPage> {



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

          Container(
          margin: EdgeInsets.only(left: 20,right: 20, top: 30, bottom: 10),
            padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
            decoration: BoxDecoration(
                color: Colors.white
            ),
            child:
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
                        width: 250,
                        child: TextFormField(
                          //para senha: obscureText: true,

                          textAlign: TextAlign.left,

                          style: const TextStyle(
                            fontSize: 12,
                          ),
                          decoration: InputDecoration(
                              fillColor: const Color(0xFF12EC1A),

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
            ),),

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

            Container(

              padding: EdgeInsets.only(left: 10, right: 10),
              margin: EdgeInsets.only(left: 20, right: 20, top: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all( Radius.circular(20)),


              ),


              child: Column(

                children: [
                  Padding(padding: EdgeInsets.only(top: 5)),

                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Dermatite atópica",
                            style: TextStyle(
                              //color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: const Color(0xFF4116B4),
                            )

                        ),

                      ]),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.star,
                        color: Colors.yellow,
                        size: 10,),
                      Icon(Icons.star,
                        color: Colors.yellow,
                        size: 10,),
                      Icon(Icons.star,
                        color: Colors.yellow,
                        size: 10,),
                      Icon(Icons.star,
                        color: Colors.yellow,
                        size: 10,),
                      Icon(Icons.star,
                        color: Colors.transparent,
                        size: 10,),


                    ],
                  ),

                  Padding(padding: EdgeInsets.only(top: 15)),

                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Achados clínicos",
                            style: TextStyle(
                              color: Color(0xFF59616E),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            )

                        ),

                      ]),

                  Padding(padding: EdgeInsets.only(top: 15)),

                  Row(
                      children: [


                        Flexible(
                            child: AutoSizeText(
                              'Prurido + , Dermatite pruriginosa não sazonal + , Êmeses + , Diarreia + , Perda de peso  + , Pápula + , Pústula + , Alopecia perianal +   , Eritema  +  , Liquenificação  +  , Otite externa  +  , Desconforto abdominal  +  , Lesões na face +  , Lesões nas patas  +  , Lesões nas axilas +   , Lesões na região perilabial +  , Lesões na região perineal  + , Hiperpigmentação   +',
                              style: TextStyle(
                                color: Color(0xFF59616E),
                                fontSize: 10,
                                //fontWeight: FontWeight.bold,
                              ),
                              maxLines: 8,
                              textAlign: TextAlign.justify,
                            )),


                      ]),
                  Padding(padding: EdgeInsets.only(top: 10)),
                ],),),

            Container(

                padding: EdgeInsets.only(left: 10, right: 10),
                margin: EdgeInsets.only(left: 20, right: 20, top: 10),


                child:Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Exames recomendados",
                          style: TextStyle(
                            color: Color(0xFF59616E),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          )

                      ),

                    ])),

            Padding(padding: EdgeInsets.only(top: 10)),

            Container(

              padding: EdgeInsets.only(left: 10, right: 10),
              margin: EdgeInsets.only(left: 20, right: 20, top: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all( Radius.circular(10))),

              child: Column(

                children: [
                  Padding(padding: EdgeInsets.only(top: 5)),

                  Row(
                      children: [


                        Flexible(
                            child: AutoSizeText(
                              'Dieta de eliminação , Níveis séricos de Folato e Cobalamina (Vitamina B12)',
                              style: TextStyle(
                                color: Color(0xFF59616E),
                                fontSize: 10,
                                //fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              textAlign: TextAlign.justify,
                            )),


                      ]),
                  Padding(padding: EdgeInsets.only(top: 10)),
                ],),),

            Padding(padding: EdgeInsets.only(top: 10)),

            Container(

              padding: EdgeInsets.only(left: 10, right: 10),
              margin: EdgeInsets.only(left: 20, right: 20, top: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all( Radius.circular(10))),

              child: Column(

                children: [
                  Padding(padding: EdgeInsets.only(top: 5)),

                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Fatores de risco",
                            style: TextStyle(
                              color: Color(0xFF59616E),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            )

                        ),

                      ]),

                  Padding(padding: EdgeInsets.only(top: 15)),

                  Row(
                      children: [
                        Flexible(
                            child: AutoSizeText(
                              'Hereditariedade +   , Fontes proteicas com mais de 18 mil daltons',
                              style: TextStyle(
                                color: Color(0xFF59616E),
                                fontSize: 10,
                                //fontWeight: FontWeight.bold,
                              ),
                              maxLines: 8,
                              textAlign: TextAlign.justify,
                            )),


                      ]),
                  Padding(padding: EdgeInsets.only(top: 10)),
                ],),),

            Container(
                padding: const EdgeInsets.all(2),
                //  margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xFF4116B4),
                ),
                child: const Icon(
                  Icons.remove,
                  color: Colors.white,
                  size: 10,
                )),

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
                            backgroundColor: Colors.white),
                        child:
                        Row(
                            children: [
                              Text(
                                'Pesquisar por diagnósticos diferenciais dessa enfermidade',
                                style: TextStyle(
                                    color: Color(0xFF4116B4), fontSize: 8),

                              ),
                            ])
                    )),
              ],
            ),



            Padding(padding: EdgeInsets.only(top: 10, bottom: 50)),

            Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Esta informação foi útil para você? ",
                  style: TextStyle(
                    color: Color(0xFF12EC1A),
                    fontSize: 12,
                  ),
                ),

                Icon(
                  MdiIcons.thumbUp,
                  color: Colors.transparent,
                  size: 14,
                ),

                Icon(
                  MdiIcons.thumbUp,
                  color: Color(0xFFC7C9D9),
                  size: 16,
                ),

                Icon(
                  MdiIcons.thumbUp,
                  color: Colors.transparent,
                  size: 14,
                ),

                Icon(
                  MdiIcons.thumbUpOutline,
                  color: Color(0xFFC7C9D9),
                  size: 16,
                ),
              ],
            ),



            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                autoPlay: true,
              ),
              items: imageUrls.map((url) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      padding: EdgeInsets.all(30),

                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 2.0),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                      ),
                      child: Image.network(
                        url,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
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
          ]),
        )))]));
  }
}
