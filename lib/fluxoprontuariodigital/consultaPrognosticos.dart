// 2.10 Consulta Prognosticos


import 'package:auto_size_text/auto_size_text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:vetadvisor/fluxoprontuariodigital/consultaMarcosTerapeuticos.dart';
import 'package:vetadvisor/fluxoprontuariodigital/consultaResumoDaConsulta.dart';


class ConsultaPrognosticcos extends StatelessWidget {
  const ConsultaPrognosticcos ({super.key});

  @override
  Widget build(BuildContext context) {
    return const ConsultaPrognosticcosPage();
  }
}

class ConsultaPrognosticcosPage extends StatefulWidget {
  const ConsultaPrognosticcosPage({Key? key}) : super(key: key);

  @override
  State<ConsultaPrognosticcosPage> createState() => _ConsultaPrognosticcosState();
}

class _ConsultaPrognosticcosState extends State<ConsultaPrognosticcosPage> {
  set value(String? value) {}

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
                                              context) => const ConsultaPrognosticcos()),
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
        body: SingleChildScrollView(
          child: Column(children: [
            const Padding(padding: EdgeInsets.all(5)),
            const Text(
              "Prognóstico",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF4116B4), fontWeight: FontWeight.bold),
            ),
            const Padding(padding: EdgeInsets.all(5)),

             Padding(
                 padding: EdgeInsets.only(right: 40, left: 40),
                 child:
                 Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Flexible(child: AutoSizeText(
              'Defina o prognóstico do paciente com base no quadro clínico',
              maxLines: 2,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Color(0xFF59616E),

              ),),),])),
            const Padding(padding: EdgeInsets.all(5)),

          Padding(
              padding: EdgeInsets.only(right: 40, left: 26),
              child: Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  //fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: true,
                  shape: CircleBorder(),
                  onChanged: (value) {},
                ),

                Container(
                  //margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                  padding: const EdgeInsets.only(left: 15, right: 110, bottom: 10, top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0XFFC5E8C6),
                  ),
                  child: Text("Prognóstico Favorável"),
                ),

              ],
            )),
          Padding(
              padding: EdgeInsets.only(right: 40, left: 26),
              child: Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  //fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: true,
                  shape: CircleBorder(),
                  onChanged: (value) {},
                ),

                Container(
                  //margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                  padding: const EdgeInsets.only(left: 15, right: 90, bottom: 10, top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0XFFF8DACC),
                  ),
                  child: Text("Prognóstico desfavorável"),
                ),

              ],
            )),
          Padding(
              padding: EdgeInsets.only(right: 40, left: 26),
              child: Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  //fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: true,
                  shape: CircleBorder(),
                  onChanged: (value) {},
                ),


                    Container(
                  //margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0XFFF2B9CD),
                  ),
                  child: const Text("Prognóstico desfavorável e reservado"),
                ),

              ],
              )),

            const Padding(padding: EdgeInsets.all(5)),

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
                              const ConsultaResumoDaConsulta()),
                        );
                      },
                      child: const Text(
                        'Finalizar e ir para o resumo',
                        style: TextStyle(color: Color(0xFF3C10BB)),
                      ),),
                  ),
                ]),
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
        ));

  }
}
