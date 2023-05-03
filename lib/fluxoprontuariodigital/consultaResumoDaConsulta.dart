// 2.11 Resumo da nova consulta


import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:vetadvisor/fluxoprontuariodigital/consultaAtendimentoPaciente.dart';
import 'package:vetadvisor/fluxoprontuariodigital/consultaPrognosticos.dart';

import 'package:vetadvisor/recursos/Constants.dart';

class ConsultaResumoDaConsulta extends StatelessWidget {
  const ConsultaResumoDaConsulta({super.key});

  @override
  Widget build(BuildContext context) {
    return const ConsultaResumoDaConsultaPage();
  }
}

class ConsultaResumoDaConsultaPage extends StatefulWidget {
  const ConsultaResumoDaConsultaPage({Key? key}) : super(key: key);

  @override
  State<ConsultaResumoDaConsultaPage> createState() => _ConsultaResumoDaConsultaState();
}

class _ConsultaResumoDaConsultaState extends State<ConsultaResumoDaConsultaPage> {
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
        Container(
          margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
          //padding: const EdgeInsets.only(bottom: 400),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xFFF5F5F5),
            //color: Colors.orange,
          ),
          child: Column(children: [


            const Text("Resumo da consulta",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF4116B4),
              ),),


            Padding(
              padding: EdgeInsets.all(10),
            child:
            Text(
          " Anamnese",
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF59616E),
            fontWeight: FontWeight.bold,
          ),
        ),),
            Container(
          margin: const EdgeInsets.only(left: 10, right: 10, top: 1),
          padding: const EdgeInsets.only(left: 40, right: 40, top: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                const Icon(Icons.edit_note),
                Flexible(
                    child: AutoSizeText(
                      ' O motivo da consulta é que a fofa está coçando... ',
                      style: TextStyle(
                        fontSize: 8,
                        color: Color(0xFF59616E),
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.justify,
                    )),
                Icon(MdiIcons.chevronDown, color: Color(0xFF59616E), size: 18)

              ]),
        ),


            Padding(
              padding: EdgeInsets.all(10),
              child:
              Text(
                " Fatores de risco",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF59616E),
                  fontWeight: FontWeight.bold,
                ),
              ),),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 1),
              padding: const EdgeInsets.only(left: 40, right: 40, top: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    const Icon(Icons.edit_note),
                    Flexible(
                        child: AutoSizeText(
                          ' A mãe da fofa possui dermatite atópica... ',
                          style: TextStyle(
                            fontSize: 8,
                            color: Color(0xFF59616E),
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.justify,
                        )),
                    Icon(MdiIcons.chevronDown, color: Color(0xFF59616E), size: 18)

                  ]),
            ),


            Padding(
              padding: EdgeInsets.all(10),
              child:
              Text(
                " Prováveis diagnóstico",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF59616E),
                  fontWeight: FontWeight.bold,
                ),
              ),),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 1),
              padding: const EdgeInsets.only(left: 40, right: 40, top: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    const Icon(Icons.edit_note),
                    Flexible(
                        child: AutoSizeText(
                          ' Alérgia comum em cães da raça shih tzu... ',
                          style: TextStyle(
                            fontSize: 8,
                            color: Color(0xFF59616E),
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.justify,
                        )),
                    Icon(MdiIcons.chevronDown, color: Color(0xFF59616E), size: 18)

                  ]),
            ),


            Padding(
              padding: EdgeInsets.all(10),
              child:
              Text(
                " Exames solicitados",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF59616E),
                  fontWeight: FontWeight.bold,
                ),
              ),),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 1),
              padding: const EdgeInsets.only(left: 40, right: 40, top: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    const Icon(Icons.edit_note),
                    Flexible(
                        child: AutoSizeText(
                          ' Pesquise as doenças crônicas ',
                          style: TextStyle(
                            fontSize: 8,
                            color: Color(0xFF59616E),
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.justify,
                        )),
                    Icon(MdiIcons.chevronDown, color: Color(0xFF59616E), size: 18)

                  ]),
            ),


            Padding(
              padding: EdgeInsets.all(10),
              child:
              Text(
                " Tratamento prescrito",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF59616E),
                  fontWeight: FontWeight.bold,
                ),
              ),),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 1),
              padding: const EdgeInsets.only(left: 40, right: 40, top: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    const Icon(Icons.edit_note),
                    Flexible(
                        child: AutoSizeText(
                          ' Pesquise as doenças crônicas ',
                          style: TextStyle(
                            fontSize: 8,
                            color: Color(0xFF59616E),
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.justify,
                        )),
                    Icon(MdiIcons.chevronDown, color: Color(0xFF59616E), size: 18)

                  ]),
            ),



            Padding(
              padding: EdgeInsets.all(10),
              child:
              Text(
                " Marco terapêutico",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF59616E),
                  fontWeight: FontWeight.bold,
                ),
              ),),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 1),
              padding: const EdgeInsets.only(left: 40, right: 40, top: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    const Icon(Icons.edit_note),
                    Flexible(
                        child: AutoSizeText(
                          ' Pesquise as doenças crônicas ',
                          style: TextStyle(
                            fontSize: 8,
                            color: Color(0xFF59616E),
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.justify,
                        )),
                    Icon(MdiIcons.chevronDown, color: Color(0xFF59616E), size: 18)

                  ]),
            ),


            Padding(
              padding: EdgeInsets.all(10),
              child:
              Text(
                " Prognóstico",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF59616E),
                  fontWeight: FontWeight.bold,
                ),
              ),),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 1),
              padding: const EdgeInsets.only(left: 40, right: 40, top: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    const Icon(Icons.edit_note),
                    Flexible(
                        child: AutoSizeText(
                          ' Pesquise as doenças crônicas ',
                          style: TextStyle(
                            fontSize: 8,
                            color: Color(0xFF59616E),
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.justify,
                        )),
                    Icon(MdiIcons.chevronDown, color: Color(0xFF59616E), size: 18)

                  ]),
            ),










          ]),
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
                          const ConsultaAtendimentoPaciente()),
                    );
                  },
                  child: const Text(
                    'Finalizar',
                    style: TextStyle(color: Color(0xFF3C10BB)),
                  ),),
              ),
            ]),
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
