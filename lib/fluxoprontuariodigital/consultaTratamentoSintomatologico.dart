// 2.7 Consulta Tratamento Sintomatologico

import 'dart:io';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:vetadvisor/fluxoprontuariodigital/cadastreOPet.dart';
import 'package:vetadvisor/fluxoprontuariodigital/consultaAtendimentoPaciente.dart';
import 'package:vetadvisor/fluxoprontuariodigital/consultaPossiveisDiagnosticos.dart';
import 'package:vetadvisor/fluxoprontuariodigital/consultaTratamentoSintomatologicoPosologiaAutomatico.dart';
import 'package:vetadvisor/recursos/Constants.dart';

class ConsultaTratamentoSintomatologico extends StatelessWidget {
  const ConsultaTratamentoSintomatologico({super.key});

  @override
  Widget build(BuildContext context) {
    return const ConsultaTratamentoSintomatologicoPage();
  }
}

class ConsultaTratamentoSintomatologicoPage extends StatefulWidget {
  const ConsultaTratamentoSintomatologicoPage({Key? key}) : super(key: key);

  @override
  State<ConsultaTratamentoSintomatologicoPage> createState() => _ConsultaTratamentoSintomatologicoState();
}

class _ConsultaTratamentoSintomatologicoState extends State<ConsultaTratamentoSintomatologicoPage> {
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
                        IconButton(
                            onPressed: () {
                              //print("clicado na seta");
                            },
                            icon: const Icon(Icons.arrow_back)),
                        Text(
                          "Perfil",
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
        Container(
          margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
          padding: const EdgeInsets.only(bottom: 240),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xFFF5F5F5),
            //color: Colors.orange,
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
                    offset:
                    const Offset(0, 0), // changes x,y position of shadow
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.only(top: 10),
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
                    margin: const EdgeInsets.only(top: 10),
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
                    margin: const EdgeInsets.only(top: 15),
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
            const Padding(padding: EdgeInsets.all(20)),
            DefaultTabController(
              initialIndex: 1,
              //optional, starts from 0, select the tab by default
              length: 4,

              child: Column(children: [
                const TabBar(
                  indicatorColor: Colors.green,
                  tabs: [
                    Tab(
                      icon:
                      Icon(MdiIcons.stethoscope, color: Color(0xFF4116B4)),
                      text: "Consultas",
                    ),
                    Tab(
                      icon: Icon(MdiIcons.medicationOutline,
                          color: Color(0xFF4116B4)),
                      text: "Tratamento",
                    ),
                    Tab(
                      icon: Icon(Icons.vaccines, color: Color(0xFF4116B4)),
                      text: "Vacinas e Outros",
                    ),
                    Tab(
                      icon: Icon(MdiIcons.bottleTonicPlusOutline,
                          color: Color(0xFF4116B4)),
                      text: "Procedimentos",
                    ),
                  ],
                ),
                /*TabBarView(
                    children:  [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text("Inicio"),
                          Text("Termino"),

                        ],
                      ),
                    ]
                )*/
              ]),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Tipo de prescrição",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF59616E),
                      fontWeight: FontWeight.bold,
                  ),),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                padding: const EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Simples",
                    style: TextStyle(
                      fontSize: 11,
                    ),),
                    Checkbox(
                      checkColor: Colors.white,
                      activeColor: Colors.green,
                      //fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: true,
                      shape: CircleBorder(),
                        onChanged: (value) {},
    ),

                  ],
                ),

              ),
              Container(
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Controle Especial",
                        style: TextStyle(
                          fontSize: 11,
                        ),),
                      Checkbox(
                        checkColor: Colors.white,
                        activeColor: Colors.green,
                        //fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: true,
                        shape: CircleBorder(),
                        onChanged: (value) {},
                      ),

                    ],
                  ),

                ),
            ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Manipulado",
                          style: TextStyle(
                            fontSize: 11,
                          ),),
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: Colors.green,
                          //fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: true,
                          shape: CircleBorder(),
                          onChanged: (value) {},
                        ),

                      ],
                    ),

                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Produto industrializado",
                          style: TextStyle(
                            fontSize: 11,
                          ),),
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: Colors.green,
                          //fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: true,
                          shape: CircleBorder(),
                          onChanged: (value) {},
                        ),

                      ],
                    ),

                  ),
                ]),
            Container(
                  // padding: EdgeInsets.only(left: , right: 5),
              margin: EdgeInsets.only(top: 10),
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
                        hintText: "Pesquisar medicações e produtos",
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
                                        const CadastreOPet()),
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
            Padding(padding: EdgeInsets.all(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Tipo de prescrição",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF59616E),
                    fontWeight: FontWeight.bold,
                  ),),

              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
              padding: const EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
            child: Column(
              children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                        Text("Apoquel",
                          style: TextStyle(
                            fontSize: 12,
                          ),),
                      ],),

            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                        Text("Dermatológico",
                          style: TextStyle(
                            fontSize: 12,
                          ),),
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: Colors.green,
                          //fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: true,
                          shape: CircleBorder(),
                          onChanged: (value) {},
                        ),
                      ],),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Receita: Simples - Uso: CãesZoetis",
                          style: TextStyle(
                            fontSize: 12,
                          ),),
                        Text("Selecionar",
                          style: TextStyle(
                            fontSize: 12,
                          ),),
                      ],),
                ]),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Apresentação  e concentração",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF59616E),
                    fontWeight: FontWeight.bold,
                  ),),

              ],
            ),
            Padding(padding: EdgeInsets.all(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Tablet + cápsula (213 g)",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF59616E),
                  ),),
                Icon(MdiIcons.chevronDown, color: Color(0xFF59616E), size: 16)
              ],
            ),
            Padding(padding: EdgeInsets.all(5)),
            Divider(
              color: Color(0xFF59616E),
              thickness: 0.3,
              endIndent:10,
              indent: 10,),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                const ConsultaTratamentoSintomatologico()),
                          );
                        },
                        child: const Text(
                          'Definir posologia',
                          style: TextStyle(color: Color(0xFF3C10BB)),
                        )),
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
                                builder: (context) =>
                                const ConsultaTratamentoSintomatologicoPosologiaAutomatico()),
                          );
                        },
                        child: const Text(
                          'Próxima etapa',
                          style: TextStyle(color: Color(0xFF3C10BB)),
                        )),
                  ),
                ]),
            Padding(padding: EdgeInsets.all(5)),
            Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
         // padding: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,

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
                        icon: Icon(MdiIcons.home, color: Colors.grey, size: 30,),
                      ),
                      Tab(
                        icon: Icon(MdiIcons.stethoscope,
                            color: Colors.grey, size: 30),
                      ),
                      Tab(
                        icon: Icon(MdiIcons.googleCirclesCommunities, color: Colors.grey, size: 30),
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
    )])));
  }
}
