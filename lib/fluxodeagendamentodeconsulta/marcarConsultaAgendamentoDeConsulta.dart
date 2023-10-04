// 1.2 e 1.3 MsgDetalheDaPesquisaAgendamento

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'dart:developer' as logDev;

import 'package:google_maps_flutter/google_maps_flutter.dart';



class MarcarConsultaAgendamento extends StatelessWidget {
  const MarcarConsultaAgendamento({super.key});

  @override
  Widget build(BuildContext context) {
    return const MarcarConsultaAgendamentoPage();
  }
}

class MarcarConsultaAgendamentoPage extends StatefulWidget {
  const MarcarConsultaAgendamentoPage({Key? key}) : super(key: key);

  @override
  State<MarcarConsultaAgendamentoPage> createState() => _MarcarConsultaAgendamentoPageState();
}

class _MarcarConsultaAgendamentoPageState extends State<MarcarConsultaAgendamentoPage> {

  GoogleMapController? _controller;

  final LatLng _initialLocation = LatLng(37.7749, -122.4194); // Coordenadas iniciais do mapa


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        drawer: Drawer(
          child: Container(



              child: ListView(
                //padding: EdgeInsets.zero,
                  children: const [
                    DrawerHeader(

                        child: Image(
                          image: AssetImage("imagens/user.png"),
                        )
                    ),

                    Column(

                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [

                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(padding: EdgeInsets.only(top:15, bottom: 15)),
                            //Text("v.0.${_packageInfo.version}.2023", style: TextStyle(color: Colors.white)),

                          ],
                        )

                      ],
                    ),



                  ]
              )
          ),
        ),
        appBar: AppBar(
            backgroundColor: const Color(0xff4116B4),
            toolbarHeight: 80,
            elevation: 30,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF4116B4),
                    Color(0xff4116B4),
                    Color(0xff7347EF),
                    Color(0xffE3EDF7),
                  ],
                ),
              ),
            ),

            actions: <Widget>[
              PopupMenuButton<String>(
                icon: const Icon(MdiIcons.bellBadgeOutline),
                //onSelected: opcoesDoMenu,
                itemBuilder: (context) => [
                  PopupMenuItem<String>(value: "4", child: Text("Não existem mensagens")),
                  PopupMenuItem<String>(value: "4", child: Text("Sair"))
                ],
              ),





            ]
        ),
        body: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                  hasScrollBody: true,
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    //color:  Color(0xFF3C10BB),
                    child: SingleChildScrollView(
                        child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.only(top: 15)),

                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Veterinário (a)  selecionado:",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xFF59616E),

                                          fontSize: 18)
                                  )
                                ]
                            ),

                            Padding(padding: EdgeInsets.only(top: 15)),

                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: [
                                  Column(
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(30),
                                              border: Border.all(
                                                color: Color(0xFF4D2CC8),               // Define a cor da borda como azul
                                                width: 2.0,                       // Define a largura da borda como 2.0 pixels
                                              ),
                                            ),
                                            margin: EdgeInsets.all(2),
                                            padding: EdgeInsets.all(5),
                                            child: Center(
                                                child:
                                                CircleAvatar(
                                                  radius: 20,
                                                //  backgroundColor: Color(0xFF3C10BB),

                                                  foregroundImage: AssetImage("imagens/uhtred.jpeg"),


                                                ))),

                                      ]),

                                  Padding(padding: EdgeInsets.only(left: 10)),

                                  Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text("Dr. João Clovis",
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
                                            Text("Clínico Geral - CRM 00532",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF82888A),

                                              ),)
                                          ],
                                        ),

                                        Padding(padding: EdgeInsets.all(2)),

                                        const Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [

                                            Text("150,00 a consulta",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF82888A),
                                                  fontWeight: FontWeight.bold

                                              ),)
                                          ],
                                        ),

                                        Padding(padding: EdgeInsets.all(2)),

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [

                                            Text("3 km de você",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF82888A),

                                              ),),

                                            Icon(Icons.star,
                                              color: Color(0xFFFBB509),
                                              size: 18,),

                                            Text("(17 avaliações)",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF82888A),

                                              ),),
                                          ],
                                        ),
                                      ]),
                                ],
                              ),

                            Padding(padding: EdgeInsets.only(top: 15)),

                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Anote aí o endereço de nossa clínica:",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xFF4116B4),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)
                                  )
                                ]
                            ),

                            Padding(padding: EdgeInsets.only(top: 15)),

                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(MdiIcons.mapMarkerOutline,
                                  size: 16,
                                  color: Color(0xFF6C7589),),

                                  Padding(padding: EdgeInsets.only(left: 2)),

                                  Text("116 Bold Street, Liverpool, L1 4JA",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xFF59616E),
                                          fontSize: 14)
                                  )
                                ]
                            ),

                            Padding(padding: EdgeInsets.only(top: 15)),

                            Container(
                              height: 300,
                              color:  Colors.amber,// Altura do Container
                              child: GoogleMap(
                                onMapCreated: (GoogleMapController controller) {
                                  _controller = controller;
                                },
                                initialCameraPosition: CameraPosition(
                                  target: _initialLocation,
                                  zoom: 12.0, // Nível de zoom inicial
                                ),
                                markers: <Marker>[
                                  Marker(
                                    markerId: MarkerId('MarkerID'),
                                    position: _initialLocation,
                                    infoWindow: InfoWindow(title: 'Localização Inicial'),
                                  ),
                                ].toSet(),
                              ),
                            ),



                          ],

                        )
                    ),
                  )
              )
            ]
        ),
        bottomNavigationBar: BottomNavigationBar(

          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                label: "Início",
                icon: Icon(MdiIcons.home,color: Colors.grey)
            ),

            BottomNavigationBarItem(
                label: "Consulta",
                icon: Icon(MdiIcons.stethoscope,color: Colors.grey)
            ),

            BottomNavigationBarItem(
                label: "Comunidade",
                icon: Icon(MdiIcons.googleCirclesCommunities,color: Colors.grey)
            ),

            BottomNavigationBarItem(
                label: "Calendário",
                icon: Icon(MdiIcons.calendar,color: Colors.grey)
            ),

            BottomNavigationBarItem(
                label: "Mais",
                icon: Icon(MdiIcons.dotsSquare,color: Colors.grey)
            )

          ],

        )
    );
  }



}




