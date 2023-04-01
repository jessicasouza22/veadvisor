import 'dart:io';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:vetadvisor/recursos/Constants.dart';




class PerfilPet extends StatelessWidget {
  const PerfilPet({super.key});

  @override
  Widget build(BuildContext context) {
    return const PerfilPetPage();
  }
}

class PerfilPetPage extends StatefulWidget {
  const PerfilPetPage({Key? key}) : super(key: key);

  @override
  State<PerfilPetPage> createState() => _PerfilPetState();
}

class _PerfilPetState extends State<PerfilPetPage> {


  @override
  Widget build(BuildContext context) {
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
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                //print("clicado na seta");
                              },
                              icon: const Icon(Icons.arrow_back)),
                          const Padding(
                            padding: EdgeInsets.only(left: 120),
                            child: Text(
                              "Perfil ",
                              //textAlign: TextAlign.center,

                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 120),
                            child: IconButton(
                                onPressed: () {
                                  //print("clicado no notificacao");
                                },
                                icon: const Icon(MdiIcons.bellBadgeOutline)),
                          )
                        ],
                      )))
            ]),
        body: Column(children: [
          Container(

            margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
            padding: const EdgeInsets.only(bottom: 700),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFFF5F5F5),
            ),

            child: Column(children: [
              Container(
                // color: Colors.blue,

                margin: const EdgeInsets.only(left: 80, right: 80, top: 10),
                //padding: EdgeInsets.only(top: 15, bottom: 30),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 10,
                      blurRadius: 5,
                      offset: const Offset(0, 0), // changes x,y position of shadow
                    ),
                  ],
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              child: ClipOval(
                                  child: GestureDetector(
                                child:
                                    File('${Constants.diretorioVetAdvisor}/avatar.png')
                                            .existsSync()
                                        ? Image.file(
                                            File(
                                                '${Constants.diretorioVetAdvisor}/avatar.png'),
                                            // um condicional

                                            //maxSizeBytes: 3000 * 1000,
                                            fit: BoxFit.cover,
                                            // width:5,
                                            //height: 5,
                                          )
                                        : Image.asset("imagens/user.png"),
                                onTap: () {},
                              )),
                            ),
                            const Text(
                              " ID: 000000",
                              style: TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold,
                                fontSize: 11
                              ),
                            ),
                          ]),
                      Column(

                        children: const [
                          Text(
                            "Raca:",
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Idade:",
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Tutor(a):",
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      padding: const EdgeInsets.all(15),
                     margin: const EdgeInsets.only( top: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFD3D3D3),
                      ),
                      child: const Icon(
                        MdiIcons.whatsapp,
                        color: Color(0xFF4116B4),
                      )),
                  Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only( top: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFD3D3D3),
                      ),
                      child: const Icon(
                        MdiIcons.videoOffOutline,
                        color: Color(0xFF4116B4),
                      )),
                  Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only( top: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFD3D3D3),
                      ),
                      child: const Icon(
                        MdiIcons.phone,
                        color: Color(0xFF4116B4),
                      ))
                ],
              ),
    const Padding  (padding: EdgeInsets.all(20)),

    DefaultTabController(
    initialIndex: 1,  //optional, starts from 0, select the tab by default
    length:4,

             child:  Column(
              children: [
                const TabBar(
                    indicatorColor: Colors.green,
                  tabs: [
                    Tab(

                      icon: Icon(MdiIcons.stethoscope,
                          color: Color(0xFF4116B4)),
                      text: "Consultas",

                    ),
                    Tab(
                      icon: Icon(MdiIcons.medicationOutline,
                          color: Color(0xFF4116B4)),
                      text: "Tratamento",
                    ),
                    Tab(
                      icon: Icon(Icons.vaccines,
                          color: Color(0xFF4116B4)),
                      text: "Vacinas e Outros",
                    ),
                    Tab(
                      icon: Icon(MdiIcons.bottleTonicPlusOutline,
                         color: Color(0xFF4116B4)),
                      text: "Procedimentos",
                    ),
                  ],
                ),
                TabBarView(
                    children:  [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text("Inicio"),
                          Text("Termino"),

                        ],
                      ),
                    ]
                )
    ]),
    )
             ] ),
    )
            ]),
          );
  }
}
