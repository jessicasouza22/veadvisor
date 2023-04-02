//Termos de serviço tutor
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:vetadvisor/recursos/Constants.dart';
import 'package:vetadvisor/fluxoprontuariodigital/perfil.dart';
import 'criarConta.dart';

class Termos extends StatelessWidget {
  const Termos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomScrollView(
            slivers: [
            //hasScrollBody: true,
          SliverFillRemaining(
            child:
            Container(


                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      //stops: [0.1, 0.3, 0.7, 1],
                      colors: <Color>[
                        Colors.blue,
                        Color(0xFF0E02B7),
                        Color(0xFF0E02B7),
                        Color(0xFF0E02B7),
                        Color(0xFF0E02B7),
                        Color(0xFF0E02B7),
                        //Color(0xFF4116B4),
                        //Color(0xFFF9F9F9),

                        Color(0xFF4756EF),
                        Color(0xFFDB51FD),
                      ],
                    )),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: SingleChildScrollView(
                      child: Column(

                          children: [
                      const Padding(padding: EdgeInsets.all(10.0)),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 50, right: 120, left: 120),
                      child: const Image(
                        image: AssetImage('imagens/logo1.png'),
                      ),
                    ),
                  ),
                  Container(
                    padding:
                    const EdgeInsets.only(top: 15, right: 120, left: 120),
                    child: const Image(
                      image: AssetImage('imagens/logo2.png'),
                    ),
                  ),

                  const Padding(padding: EdgeInsets.all(15.0)),
                  Container(
                    padding: EdgeInsets.only(bottom: 20),
                    //color: Colors.white,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Padding(
                        padding: EdgeInsets.all(15),

                    child: //Flexible(child:
                    Column(
                        children: [
                           Flexible(child: AutoSizeText(
                              Constants.termo03,
                              maxLines: 15,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                //fontSize: 16,
                                fontFamily: 'Inter Variable Font',
                                color: Color(0xFF59616E),
                              )
                          ),
                           ),

                          const Padding(padding: EdgeInsets.all(10.0)),
                          const Divider(
                            color: Color(0xFF59616E),
                            thickness: 0.2,
                            endIndent: 5,
                            indent: 30,),
                          IconButton(onPressed: () {
                            Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => const Termos ()),
                            );
                          },
                              icon: Icon(
                                  MdiIcons.chevronDown,

                                  color: Color(0xFF6F767E),
                                  size: 40.0)
                          ),


                      Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ChechBox colocado dentro de um Sized box
                        // para remover o padding natural que o ele tem
                        SizedBox(
                          width: 70,
                          height: 24,
                          child: Radio(
                            //fillColor: Color.white,
                            value: false,
                            groupValue: false,

                            onChanged: (value) {},
                          ),
                        ),
                       // const Padding(padding: EdgeInsets.all(2)),
                        const Flexible(child: AutoSizeText(
                          'Quero receber novidades, promoções e ofertas personalizadas da VetAdvisor.',
                          textAlign: TextAlign.justify,
                          maxLines: 2,
                          style: TextStyle(
                            //fontSize: 12,
                            fontFamily: 'Inter Variable Font',
                            color: Color(0xFF6F767E),
                          ),
                        ))

                      ],
                    ),
                          const Padding(padding: EdgeInsets.all(15.0)),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // ChechBox colocado dentro de um Sized box
                              // para remover o padding natural que o ele tem
                              SizedBox(
                                width: 70,
                                height: 24,
                                child: Radio(
                                  //fillColor: Color.white,
                                  value: false,
                                  groupValue: false,

                                  onChanged: (value) {},
                                ),
                              ),
                              // const Padding(padding: EdgeInsets.all(2)),
                              const Flexible(child: AutoSizeText(
                                'Aceito e concordo com os termos e condições',
                                textAlign: TextAlign.justify,
                                maxLines: 2,
                                style: TextStyle(
                                  //fontSize: 12,
                                  fontFamily: 'Inter Variable Font',
                                  color: Color(0xFF6F767E),
                                ),
                              ))

                            ],
                          ),
                          const Padding(padding: EdgeInsets.all(15.0)),
                          Builder(
                              builder: (context) => ElevatedButton(
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.only(
                                        top: 10, right: 80, left: 80, bottom: 10),
                                    primary: Colors.blue,
                                    backgroundColor: Color(0xFF6F767E), //F5F5F5
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30.0)),
                                    // Background Color
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Termos()),
                                    );
                                  },
                                  child: const Text('Aceitar e Finalizar',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Inter Variable Font',
                                    color: Color(0xFF4116B4),// 0xFF0E02B7)
                                  )


                              )),
                          ),

                        ]
                    ),
                  ),
                  ),

                    ],


                  ),
                )


            )


        ),
      )
      ],

    )));

  }
}
