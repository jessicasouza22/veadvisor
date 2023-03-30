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
                    padding: EdgeInsets.only(left: 5),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              print("clicado na seta");
                            },
                            icon: Icon(Icons.arrow_back)),
                        Padding(
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

      body: Column(
          children: [

            Container(
              //height: 500,
              //width: 200,
              margin: EdgeInsets.only(top: 20, left: 20, right: 20 ),
              padding: EdgeInsets.only( bottom: 700),
              //color: Colors.deepPurple,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFFF5F5F5),
                              ),

child: Column(
children: [
         Container(
              // color: Colors.blue,
              margin: EdgeInsets.only(left: 80, right: 80, top: 10),
              padding: EdgeInsets.only(left: 70, right: 70, bottom: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 10,
                    blurRadius: 5,
                    offset: Offset(0, 0), // changes x,y position of shadow
                  ),
                ],

              ),
              child: Row(
              children: [
              Column(
               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
               // crossAxisAlignment: CrossAxisAlignment.start,
                children: [

              CircleAvatar(

                radius: 35,
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
                        width:15,
                        height: 15,
                      )
                          : Image.asset("imagens/user.png"),
                      onTap: () {},
                    )),
                   ),
                  Text("ID: 000000",
                      style: TextStyle(
                        color: Colors.deepPurple
                      ),),
    ]
    ),

                Column(
                  children: [
                    Text("Raca"),
                    Text("Idade"),
                    Text("Tutor(a)"),
                  ],
                )
                ]
              ),

            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.only(left: 60, right: 40,top: 7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFD3D3D3),
                  ),
                    child: Icon(MdiIcons.whatsapp,
                    color: Color(0xFF4116B4),
                    )

                ),
                Container(
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.only( right: 30,top: 7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFFD3D3D3),
                    ),
                    child: Icon(MdiIcons.videoOffOutline,
                      color: Color(0xFF4116B4),
                    )
                ),
                Container(
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.only(right: 90,top: 7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFFD3D3D3),
                    ),
                    child: Icon(MdiIcons.phone,
                      color: Color(0xFF4116B4),
                    )
                )
              ],
            ),
  Container(
    child: TabBar(
      tabs: <Widget>[
        Tab(
          icon: Icon(Icons.cloud_outlined),
        ),
        Tab(
          icon: Icon(Icons.beach_access_sharp),
        ),
        Tab(
          icon: Icon(Icons.brightness_5_sharp),
        ),
      ],
    ),
  ),

          ]
      )
      ,
    )
    ])

     );
  }
}
