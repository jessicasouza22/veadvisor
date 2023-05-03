//2.5 Consulta Possiveis Diagnosticos


import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:vetadvisor/fluxoprontuariodigital/consultaPaciente.dart';
import 'package:vetadvisor/fluxoprontuariodigital/consultaPacienteEmConsulta.dart';
import 'package:vetadvisor/fluxoprontuariodigital/perfil.dart';
import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';


class ConsultaPossiveisDiagnosticos extends StatelessWidget {
  const ConsultaPossiveisDiagnosticos({super.key});

  @override
  Widget build(BuildContext context) {
    return const ConsultaPossiveisDiagnosticosPage();
  }
}

class ConsultaPossiveisDiagnosticosPage extends StatefulWidget {
  const ConsultaPossiveisDiagnosticosPage({Key? key}) : super(key: key);

  @override
  State<ConsultaPossiveisDiagnosticosPage> createState() =>
      _ConsultaPossiveisDiagnosticosState();
}

class _ConsultaPossiveisDiagnosticosState
    extends State<ConsultaPossiveisDiagnosticosPage> {
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
                                            context) => const ConsultaPaciente()),
                                  );

                                  //print("clicado na seta");
                                },
                                icon: const Icon(Icons.arrow_back))),
                        const Text(
                          "Consulta",
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
      body:  SingleChildScrollView(
          child: Column( children: [
        Container(
          margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
          //padding: const EdgeInsets.only(bottom: 400),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xFFF5F5F5),
            //color: Colors.orange,
          ),
          child: Column( children: [


             Text("Possíveis diagnósticos",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF4116B4),
                  fontWeight: FontWeight.bold
              ),),


            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 30,
                    width: 250,

                    child:
                    TextFormField(
                      //para senha: obscureText: true,

                      textAlign: TextAlign.center,

                      style: const TextStyle(
                        fontSize: 12,
                      ),
                      decoration: InputDecoration(
                        fillColor: const Color(0xFF3C10BB),
                        // contentPadding: EdgeInsets.fromLTRB(20, 0, 12, 0),
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 15,

                        ),


                        // icon: ,
                        hintText: "Possíveis diagnósticos",
                      ),
                    ),),




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
                ]),

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
                          Icon(Icons.star,
                            color: Colors.yellow,)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Flexible(
                              child: AutoSizeText(
                                'Alérgia comum em cães da raça shih tzu',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                ),
                                maxLines: 3,
                                textAlign: TextAlign.justify,
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text("Incluir"),
                          const Padding(padding: EdgeInsets.only(left: 10)),
                          SizedBox(
                            width: 15,
                            height: 15,
                            child: Radio(
                              //fillColor: Color.white,
                              value: false,
                              groupValue: false,

                              onChanged: (value) {},
                            ),
                          ),

                        ],
                      )
                    ]
                )
            ),

            Container(
                //padding: const EdgeInsets.all(1),
                  margin: const EdgeInsets.only(top: 1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xFF4116B4),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 16,
                )),

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



                          Text("Otite externa",
                            style: TextStyle(
                              color: Color(0xFF4116B4),
                              fontWeight: FontWeight.bold,
                            ),),
                          Icon(Icons.star,
                            color: Colors.yellow,)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [

                          Flexible(
                              child: AutoSizeText(
                                'Infecção comum em cães com predisposição a dermatite atópica e que frequentam banho',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                ),
                                maxLines: 3,
                                textAlign: TextAlign.justify,
                              )),

                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text("Incluir"),
                          const Padding(padding: EdgeInsets.only(left: 10)),
                          /*SizedBox(
                            width: 15,
                            height: 15,
                            child: Radio(
                              //fillColor: Color.white,
                              value: false,
                              groupValue: false,

                              onChanged: (value) {},
                            ),
                          ),*/
                          Checkbox(
                            checkColor: Colors.white,
                            activeColor: Colors.green,
                            //fillColor: MaterialStateProperty.resolveWith(getColor),
                            value: false,
                            visualDensity: VisualDensity.compact,
                            shape: CircleBorder(),
                            onChanged: (value) {},
                          ),

                        ],
                      )
                    ]
                )
            ),

            Container(
              //padding: const EdgeInsets.all(1),
                margin: const EdgeInsets.only(top: 1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xFF4116B4),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 16,
                )),

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
                          Text("Otite média",
                            style: TextStyle(
                              color: Color(0xFF4116B4),
                              fontWeight: FontWeight.bold,
                            ),),
                          Icon(Icons.star,
                            color: Colors.yellow,)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [

                          Flexible(
                              child: AutoSizeText(
                                'Sempre elimine essa possibilidade se estiver suspeitando de otite externa, por que se for ',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                ),
                                maxLines: 3,
                                textAlign: TextAlign.justify,
                              )),

                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text("Incluir"),
                          const Padding(padding: EdgeInsets.only(left: 10)),
                          SizedBox(
                            width: 15,
                            height: 15,
                            child: Radio(
                              //fillColor: Color.white,
                              value: false,
                              groupValue: false,

                              onChanged: (value) {},
                            ),
                          ),

                        ],
                      )
                    ]
                )
            ),

            Container(
              //padding: const EdgeInsets.all(1),
                margin: const EdgeInsets.only(top: 1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xFF4116B4),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 16,
                )),

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
                          Text("Otite Aguda",
                            style: TextStyle(
                              color: Color(0xFF4116B4),
                              fontWeight: FontWeight.bold,
                            ),),
                          Icon(Icons.star,
                            color: Colors.yellow,)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [

                          Flexible(
                              child: AutoSizeText(
                                'Costuma ser uma consequência da Otite externa. Imprescendivel determinar a ',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                ),
                                maxLines: 3,
                                textAlign: TextAlign.justify,
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text("Incluir"),
                          const Padding(padding: EdgeInsets.only(left: 10)),
                          SizedBox(
                            width: 15,
                            height: 15,
                            child: Radio(
                              //fillColor: Color.white,
                              value: false,
                              groupValue: false,

                              onChanged: (value) {},
                            ),
                          ),

                        ],
                      )
                    ]
                )
            ),

            Container(
              //padding: const EdgeInsets.all(1),
                margin: const EdgeInsets.only(top: 1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xFF4116B4),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 16,
                )),





          ]),

        ),
            Builder(
              builder: (context) => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ConsultaPacienteEmConsulta()),
                    );
                  },
                  child: const Text(
                    'Próxima etapa',
                    style: TextStyle(color: Color(0xFF3C10BB)),
                  )),
            ),
        const Padding(
          padding: EdgeInsets.all(8),
        ),

        const Padding(
          padding: EdgeInsets.all(8),

        ),
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10, top: 185),
          padding: const EdgeInsets.only(bottom: 10),
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
                TabBar(
                    indicatorColor: Colors.transparent,
                    tabs: [
                      Tab(
                        icon: Icon(
                          MdiIcons.home, color: Colors.grey, size: 30,),
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
