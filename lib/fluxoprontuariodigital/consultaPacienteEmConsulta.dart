// 2.6 Consulta Paciente Em Consulta

import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:vetadvisor/fluxoprontuariodigital/consultaPossiveisDiagnosticos.dart';
import 'package:vetadvisor/fluxoprontuariodigital/consultaTratamentoSintomatologico.dart';

import 'package:vetadvisor/recursos/Constants.dart';

class ConsultaPacienteEmConsulta extends StatelessWidget {
  const ConsultaPacienteEmConsulta({super.key});

  @override
  Widget build(BuildContext context) {
    return const ConsultaPacienteEmConsultaPage();
  }
}

class ConsultaPacienteEmConsultaPage extends StatefulWidget {
  const ConsultaPacienteEmConsultaPage({Key? key}) : super(key: key);

  @override
  State<ConsultaPacienteEmConsultaPage> createState() =>
      _ConsultaAtendimentoPacienteState();
}

class _ConsultaAtendimentoPacienteState
    extends State<ConsultaPacienteEmConsultaPage> {
  //bool _value = false;
  int val = -1;

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
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
            //padding: const EdgeInsets.only(bottom: 400),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFFF5F5F5),
              //color: Colors.orange,
            ),
            child: Column(children: [
              const Text(
                "Paciente em consulta",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF4116B4), fontWeight: FontWeight.bold),
              ),
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
              Container(
                  //padding: const EdgeInsets.all(2),
                  //  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xFF4116B4),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  )),
            ]),
          ),
          Container(
            margin: const EdgeInsets.only(top: 2, left: 20, right: 20),
            //padding: const EdgeInsets.only(bottom: 400),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFFF5F5F5),
              //color: Colors.orange,
            ),
            child: Column(children: [

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
                decoration: const InputDecoration(
                  fillColor: Color(0xFF3C10BB),
                 // contentPadding: EdgeInsets.fromLTRB(20, 0, 12, 0),
                  prefixIcon: Icon(
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
                  //primary: Colors.blue,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2)),
                  // Background Color
                ),
                onPressed: () {}, child: Text("Ver todos",
                style: TextStyle(
                  color: Color(0xFF8F90A6),
                ),),),
    ]),



              Container(
                margin: const EdgeInsets.only(
                    left: 10, right: 10, top: 1, bottom: 5),
                padding: const EdgeInsets.only(
                    left: 40, right: 40, top: 5, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      Text(
                        "Dermatite atópica",
                        style: TextStyle(
                          color: Color(0xFF4116B4),
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 12,
                      ),
                      const Text("Incluir",
                      style: TextStyle(
                          fontSize: 10,
                      ),),
                      SizedBox(
                        width: 1,
                        height: 1,
                        child:
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: Colors.green,
                          //fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: true,
                          shape: CircleBorder(),
                          onChanged: (value) {}
                        ),
                        /*Radio(
                              //fillColor: Color.white,
                              value: false,
                              groupValue: false,
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

                              onChanged: (value) {},
                            ),*/
                      ),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: AutoSizeText(
                        'Provavelmente seu Paciente tem dermatite atópica, que é uma doença genética e muito comum nas raças de pet populares de hoje.Lembre sempre de eliminar possível hipersensibilidade alimentar!',
                        style: TextStyle(
                          fontSize: 8,
                          color: Colors.grey,
                        ),
                        maxLines: 3,
                        textAlign: TextAlign.justify,
                      )),
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    ElevatedButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(
                            top: 3, right: 7, left: 7, bottom: 3),
                        //primary: Colors.blue,
                        backgroundColor: Color(0xFFFDF5E6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        // Background Color
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            MdiIcons.bookOpenBlankVariant,
                            color: Colors.red,
                            size: 12,
                          ),
                          Text(" salvar   ",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 7,
                              )),
                          SizedBox(
                            width: 1,
                            height: 1,
                            child:
                            Checkbox(
                              checkColor: Colors.white,
                              activeColor: Colors.green,
                              //fillColor: MaterialStateProperty.resolveWith(getColor),
                              value: true,
                              shape: CircleBorder(),
                              onChanged: (value) {},
                            ),
                            /*Radio(
                              //fillColor: Color.white,
                              value: false,
                              groupValue: false,
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

                              onChanged: (value) {},
                            ),*/
                          ),
                        ],
                      ),
                    ),
                  ]),
                  Row(
                    children: [
                      Text(
                        "Esta informação foi útil para você? ",
                        style: TextStyle(
                          color: Color(0xFF12EC1A),
                            fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Text(
                        "Deixe seu feedback ",
                        style: TextStyle(
                          color: Color(0xFF12EC1A),
                            fontSize: 10,
                        ),
                      ),
                      Icon(
                        MdiIcons.thumbUp,
                        color: Color(0xFFC7C9D9),
                        size: 14,
                      ),
                      Icon(
                        MdiIcons.thumbUpOutline,
                        color: Color(0xFFC7C9D9),
                        size: 14,
                      ),
                    ],
                  ),

                ]),
              ),
              Container(

                margin: const EdgeInsets.only(
                    left: 10, right: 10, top: 1),
                padding: const EdgeInsets.only(
                    left: 40, right: 40, top: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  children:[

                 Row(
                 children: [
                  Text("Sinais clínicos",
                    style: TextStyle(
                      color: Color(0xFF59616E),
                      fontWeight: FontWeight.bold,
                        fontSize: 10,
                    ),),



                ],),
                Row(
                  children: [
                    Flexible(
                        child: AutoSizeText(
                          'Eritema, Prurido, Alopecia, Otite externa, Blefarite, Prurido antes de aparecer as lesões, lambe as patas e lambe outras partes do corpo excessivamente',
                          style: TextStyle(
                            fontSize: 8,
                            color: Color(0xFF59616E),
                          ),
                          maxLines: 3,
                          textAlign: TextAlign.justify,
                        )),

                  ],),

      ]),

              ),
            Container(
              margin: EdgeInsets.only(left: 10,top: 5),
              child:
              Row(
                children: [
                  Text("Exames padrão ouro",
                    style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFF59616E),
                      fontWeight: FontWeight.bold,
                    ),),
                ],

              )
            ),
            Container(
                margin: const EdgeInsets.only(
                    left: 10, right: 10, top: 5),
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
                    children: [
                      Text("Pesquise os exames indicados",
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xFF59616E),
                        ),),
                      Icon(MdiIcons.chevronDown, color: Color(0xFF59616E), size: 10)
                    ],
                  ),

                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(
                    left: 10, right: 10, top: 5),
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
                      children: [
                        Text("Teste cutâneo intradérmico e prick",
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF59616E),
                          ),),
                        Text("Incluir",
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF59616E),
                          ),),

                        SizedBox(
                          width: 1,
                          height: 1,
                          child:
                          Checkbox(
                              checkColor: Colors.white,
                              activeColor: Colors.green,
                              //fillColor: MaterialStateProperty.resolveWith(getColor),
                              value: true,
                              shape: CircleBorder(),
                              onChanged: (value) {}
                          ),
                          /*Radio(
                              //fillColor: Color.white,
                              value: false,
                              groupValue: false,
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

                              onChanged: (value) {},
                            ),*/
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(MdiIcons.chevronDown, color: Color(0xFF59616E), size: 18)
                      ],
                    ),

                  ],
                ),
              ),
            Container(
                margin: const EdgeInsets.only(
                    left: 10, right: 10, top: 5),
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
                      children: [
                        Text("Teste sorológico ",
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF59616E),
                          ),),
                        Text("Incluir",
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF59616E),
                          ),),
                        SizedBox(
                          width: 1,
                          height: 1,
                          child:
                          Checkbox(
                              checkColor: Colors.white,
                              activeColor: Colors.green,
                              //fillColor: MaterialStateProperty.resolveWith(getColor),
                              value: true,
                              shape: CircleBorder(),
                              onChanged: (value) {}
                          ),
                          /*Radio(
                              //fillColor: Color.white,
                              value: false,
                              groupValue: false,
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

                              onChanged: (value) {},
                            ),*/
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(MdiIcons.chevronDown, color: Color(0xFF59616E), size: 18)
                      ],
                    ),

                  ],
                ),
              ),
            Container(
                  margin: EdgeInsets.only(left: 10,top: 5),
                  child:
                  Row(
                    children: [
                      Text("Exames padrão ouro",
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xFF59616E),
                          fontWeight: FontWeight.bold,
                        ),),
                    ],

                  )
              ),
            Container(
                margin: const EdgeInsets.only(
                    left: 10, right: 10, top: 5),
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
                      children: [
                        Text("Pesquise outros exames",
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF59616E),
                          ),),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(MdiIcons.chevronDown, color: Color(0xFF59616E), size: 18)
                      ],
                    ),

                  ],
                ),
              ),
            Container(
                margin: const EdgeInsets.only(
                    left: 10, right: 10, top: 5),
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
                      children: [
                        Text("Hemograma",
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF59616E),
                          ),),
                        Text("Incluir",
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF59616E),
                          ),),
                        SizedBox(
                          width: 1,
                          height: 1,
                          child:
                          Checkbox(
                              checkColor: Colors.white,
                              activeColor: Colors.green,
                              //fillColor: MaterialStateProperty.resolveWith(getColor),
                              value: true,
                              shape: CircleBorder(),
                              onChanged: (value) {}
                          ),
                          /*Radio(
                              //fillColor: Color.white,
                              value: false,
                              groupValue: false,
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

                              onChanged: (value) {},
                            ),*/
                        ),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(MdiIcons.chevronDown, color: Color(0xFF59616E), size: 18)
                      ],
                    ),

                  ],
                ),
              ),
            Container(
                margin: const EdgeInsets.only(
                    left: 10, right: 10, top: 5),
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
                      children: [
                        Text("Perfil bioquímico TGP, ALT, FA, Cr",
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF59616E),
                          ),),
                        Text("Incluir",
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF59616E),
                          ),),
                        SizedBox(
                          width: 1,
                          height: 1,
                          child:
                          Checkbox(
                              checkColor: Colors.white,
                              activeColor: Colors.green,
                              //fillColor: MaterialStateProperty.resolveWith(getColor),
                              value: true,
                              shape: CircleBorder(),
                              onChanged: (value) {}
                          ),
                          /*Radio(
                              //fillColor: Color.white,
                              value: false,
                              groupValue: false,
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

                              onChanged: (value) {},
                            ),*/
                        ),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(MdiIcons.chevronDown, color: Color(0xFF59616E), size: 18)
                      ],
                    ),

                  ],
                ),
              ),

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
                                const ConsultaPossiveisDiagnosticos()),
                          );
                        },
                        child: const Text(
                          'Voltar',
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
                                const ConsultaTratamentoSintomatologico()),
                          );
                        },
                        child: const Text(
                          'Próxima etapa',
                          style: TextStyle(color: Color(0xFF3C10BB)),
                        )),
                  ),
              ]),
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
                    child: Column(children: [
                      TabBar(indicatorColor: Colors.transparent, tabs: [
                        Tab(
                          icon: Icon(
                            MdiIcons.home,
                            color: Colors.grey,
                            size: 30,
                          ),
                        ),
                        Tab(
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ConsultaTratamentoSintomatologico()),
                              );
                            },
                            icon: Icon(
                              MdiIcons.stethoscope,
                              color: Colors.grey,
                              size: 30,
                            ),
                          ),
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
          )
        ])));
  }
}
