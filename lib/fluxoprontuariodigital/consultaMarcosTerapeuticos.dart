// 2.9 Marcos Terapeuticos


import 'package:auto_size_text/auto_size_text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:vetadvisor/fluxoprontuariodigital/consultaPrognosticos.dart';


class ConsultaMarcosTerapeuticos extends StatelessWidget {
  const ConsultaMarcosTerapeuticos ({super.key});

  @override
  Widget build(BuildContext context) {
    return const ConsultaMarcosTerapeuticosPage();
  }
}

class ConsultaMarcosTerapeuticosPage extends StatefulWidget {
  const ConsultaMarcosTerapeuticosPage({Key? key}) : super(key: key);

  @override
  State<ConsultaMarcosTerapeuticosPage> createState() => _ConsultaMarcosTerapeuticosState();
}

class _ConsultaMarcosTerapeuticosState extends State<ConsultaMarcosTerapeuticosPage> {
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
        body: SingleChildScrollView(
            child: Column(children: [

              const Text(
                "Marcos terapêuticos",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF4116B4), fontWeight: FontWeight.bold),
              ),
              const Padding(padding: EdgeInsets.all(5)),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(child: AutoSizeText(
                ' Defina as melhorias que você espera que o seu paciente alcance por periodo',
                maxLines: 2,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color(0xFF59616E),

                ),),)]),

              Container(
                margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                //padding: const EdgeInsets.only(bottom: 240),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  //color: Colors.orange,
                ),

                child:  Row(
                  children: [
                    Flexible(child: AutoSizeText(
                    'Ausência de dor quando pega na região do ouvido de 2 a 5 dias',
                    maxLines: 2,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0xFF59616E),

                    ),),),])),
              const Padding(padding: EdgeInsets.all(5)),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
               // padding: const EdgeInsets.only(bottom: 240),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  //color: Colors.orange,
                ),

                child:   Row(
                  children: [
                     Flexible(child: AutoSizeText(
                  'Ausência de dor quando pega na região do ouvido de 2 a 5 dias',
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xFF59616E),

                  ),),),])),
              const Padding(padding: EdgeInsets.all(5)),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                //padding: const EdgeInsets.only(bottom: 240),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  //color: Colors.orange,
                ),

                child:   Row(
                  children: [
                    Flexible(child: AutoSizeText(
                  'Ausência de dor quando pega na região do ouvido de 2 a 5 dias',
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xFF59616E),

                  ),),),]),),
              const Padding(padding: EdgeInsets.all(5)),


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
                  const Text("Adicionar novo tópico ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF4116B4),
                      fontWeight: FontWeight.bold,

                    ),),
                ],
              ),
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
                                const ConsultaPrognosticcos()),
                          );
                        },
                        child: const Text(
                          'Próxima etapa',
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
