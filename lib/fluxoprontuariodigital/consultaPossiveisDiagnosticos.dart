// 2.5

// 2.12


import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:vetadvisor/fluxoprontuariodigital/consultaPacienteEmConsulta.dart';
import 'package:vetadvisor/fluxoprontuariodigital/perfil.dart';



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
      body: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
          //padding: const EdgeInsets.only(bottom: 400),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xFFF5F5F5),
            //color: Colors.orange,
          ),
          child: Column(children: [


            const Text("Possíveis diagnósticos",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF4116B4),
                  fontWeight: FontWeight.bold
              ),),

              TextFormField(
              //para senha: obscureText: true,

              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
              ),
              decoration: InputDecoration(
                  fillColor: const Color(0xFF3C10BB),
                  prefixIcon: const Icon(Icons.search, size: 18,),

                  // icon: ,
                  hintText: "Possíveis diagnósticos",
                  ),
            ),
            Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
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
                          Text("Alérgia comum em cães da raça shih tzu",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                            ),),
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

            const Text("Ver todos"),


            Container(
                //padding: const EdgeInsets.all(1),
                //  margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xFF4116B4),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 16,
                )),


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


          ]),
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
    );
  }
}
