// 2.1 Nova Consulta



import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:vetadvisor/fluxoprontuariodigital/cadastreOPet.dart';
import 'package:vetadvisor/fluxoprontuariodigital/consultaAtendimentoPaciente.dart';
import 'package:vetadvisor/fluxoprontuariodigital/consultaPossiveisDiagnosticos.dart';
import 'package:vetadvisor/fluxoprontuariodigital/perfilPaciente.dart';
import 'package:vetadvisor/inicio.dart';
import 'package:vetadvisor/recursos/Constants.dart';
import 'dart:io';

class NovaConsulta extends StatelessWidget {
  const NovaConsulta({super.key});

  @override
  Widget build(BuildContext context) {
    return const NovaConsultaPage();
  }
}
class Dados{
  String nomeTutor = "Sandra";
  String raca = "Rask Siberiano";
}

class NovaConsultaPage extends StatefulWidget {
  const NovaConsultaPage({Key? key}) : super(key: key);

  @override
  State<NovaConsultaPage> createState() => _NovaConsultaState();
}

class _NovaConsultaState extends State<NovaConsultaPage> {



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
                            "Nova Consulta",
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
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(padding: EdgeInsets.all(5)),
            Text("Paciente",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF4116B4),
                  fontWeight: FontWeight.bold
              ),),

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
                    offset: const Offset(
                        0, 0), // changes x,y position of shadow
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
                                fontSize: 11),
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


            const Padding(padding: EdgeInsets.all(10)),

            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
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
                      hintText: "Digite o ID do Animal",
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
                                      const InicioVeterinario()),
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

            const Padding(padding: EdgeInsets.all(5)),

            Container(
                padding: EdgeInsets.only(bottom: 18, top: 10),
                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      MdiIcons.stethoscope,
                      size: 18,
                      color: Color(0xFF3C10BB),
                    ),
                    Text(
                      "   Iniciar nova consulta   ",
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

            const Padding(padding: EdgeInsets.all(2)),

            Divider(
              color: Color(0xFF59616E),
              thickness: 0.3,
              endIndent:50,
              indent: 50,),

            const Padding(padding: EdgeInsets.all(2)),

            Text(
              "Clientes mais frequentes",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF59616E),
                fontWeight: FontWeight.bold,
              ),
            ),


            const Padding(padding: EdgeInsets.all(2)),

            Container(
              // color: Colors.blue,

              margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
              //padding: EdgeInsets.only(top: 15, bottom: 30),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
               /* boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 10,
                    blurRadius: 5,
                    offset: const Offset(
                        0, 0), // changes x,y position of shadow
                  ),
                ],*/
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
                                child:
                                   Image.asset("imagens/rask.jpeg"),

                                ),
                          ),
                          const Text(
                            " ID: 000000",
                            style: TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold,
                                fontSize: 11),
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
                          "Tutor(a):}",
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "",
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "",
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Incluir",
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [

                        Icon(MdiIcons.chevronRight, color: Color(0xFF59616E), size: 18),
                        Text(
                          "",
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 1,
                          height: 1,
                          child:
                          Checkbox(
                              checkColor: Colors.white,
                              activeColor: Colors.green,
                              //fillColor: MaterialStateProperty.resolveWith(getColor),
                              value: false,
                              shape: CircleBorder(),
                              onChanged: (value) {}
                          ),

                        ),


                      ],
                    ),


                  ]),
            ),

            const Padding(padding: EdgeInsets.all(5)),

            Container(
              // color: Colors.blue,

              margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
              //padding: EdgeInsets.only(top: 15, bottom: 30),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                /* boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 10,
                    blurRadius: 5,
                    offset: const Offset(
                        0, 0), // changes x,y position of shadow
                  ),
                ],*/
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
                              child:
                              Image.asset("imagens/rask.jpeg"),

                            ),
                          ),
                          const Text(
                            " ID: 000000",
                            style: TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold,
                                fontSize: 11),
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
                          "Tutor(a):}",
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "",
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "",
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Incluir",
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [

                        Icon(MdiIcons.chevronRight, color: Color(0xFF59616E), size: 18),
                        Text(
                          "",
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 1,
                          height: 1,
                          child:
                          Checkbox(
                              checkColor: Colors.white,
                              activeColor: Colors.green,
                              //fillColor: MaterialStateProperty.resolveWith(getColor),
                              value: false,
                              shape: CircleBorder(),
                              onChanged: (value) {}
                          ),

                        ),


                      ],
                    ),


                  ]),
            ),

            const Padding(padding: EdgeInsets.all(10)),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.all(2),
                    //  margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,

                    ),
                    child: const Icon(
                      Icons.add,
                      color: Color(0xFF4116B4),
                      size: 16,
                    )),
                const Padding(padding: EdgeInsets.all(2)),
                const Text("Cadastrar novo paciente ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF4116B4),
                    fontWeight: FontWeight.bold,

                  ),),
                Icon(MdiIcons.chevronRight, color: Color(0xFF4116B4), size: 18),
              ],
            ),

            const Padding(padding: EdgeInsets.all(10)),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.all(2),
                    //  margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,

                    ),
                    child: const Icon(
                      Icons.add,
                      color: Color(0xFF4116B4),
                      size: 16,
                    )),
                const Padding(padding: EdgeInsets.all(10)),
                const Text("Ver lista de todos os tutores ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF4116B4),
                    fontWeight: FontWeight.bold,

                  ),),
                Icon(MdiIcons.chevronRight, color: Color(0xFF4116B4), size: 18),
              ],
            ),

            const Padding(padding: EdgeInsets.all(10)),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.all(2),
                    //  margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,

                    ),
                    child: const Icon(
                      Icons.add,
                      color: Color(0xFF4116B4),
                      size: 16,
                    )),
                const Padding(padding: EdgeInsets.all(10)),
                const Text("Ver lista de todos os pacientes ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF4116B4),
                    fontWeight: FontWeight.bold,

                  ),),
                Icon(MdiIcons.chevronRight, color: Color(0xFF4116B4), size: 18),
              ],
            ),
            const Padding(padding: EdgeInsets.all(10)),

            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Builder(
                    builder: (context) => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              const CadastreOPet()),
                        );
                      },
                      child: const Text(
                        'Iniciar nova consulta',
                        style: TextStyle(color: Color(0xFF3C10BB)),
                      ),),
                  ),
                ]),





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
        ));
  }
}
