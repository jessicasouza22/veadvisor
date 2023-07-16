//Termos de serviço tutor
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:vetadvisor/fluxoprontuariodigital/cadastreOPet.dart';
import 'package:vetadvisor/fluxoprontuariodigital/perfilPaciente.dart';
import 'package:vetadvisor/recursos/Constants.dart';
import 'package:vetadvisor/fluxoprontuariodigital/perfil.dart';
import 'package:vetadvisor/recursos/menuIniciar.dart';
import 'criarConta.dart';


class Termos extends StatefulWidget {
  @override
  State<Termos> createState() => _Termos();
}

class _Termos extends State<Termos> {

  bool _aceito = false;
  bool _queroReceber = false;

  var db = FirebaseFirestore.instance;
  var idDocumentoFirebase = "";

  @override
  initState() {


    db.collection("usuarios").where("email", isEqualTo: "wallace_sjm@msn.com").get().then(
          (querySnapshot) {

        for (var docSnapshot in querySnapshot.docs) {

          idDocumentoFirebase = docSnapshot.id;
          setState(() {
            _aceito = docSnapshot.data()["termos"];
            _queroReceber = docSnapshot.data()["novidades"];
          });

          // print('${docSnapshot.id} => ${docSnapshot.data()}');

        }
      },
      onError: (e) => print("Error completing: $e"),
    );


    super.initState();

  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        body: Container(

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
                    const EdgeInsets.only(right: 120, left: 120),
                    child: const Image(
                      image: AssetImage('imagens/logo2.png'),
                    ),
                  ),

                          const Padding(padding: EdgeInsets.all(15.0)),
                          Expanded(
                            child:  Container(


                              padding: EdgeInsets.only(bottom: 10),
                              //color: Colors.white,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(15))),
                              child: Padding(
                                  padding: EdgeInsets.all(15),
                                  child: //Flexible(child:
                                  Column(
                                      children: [

                                        Flexible(
                                          child: SingleChildScrollView(
                                            child: AutoSizeText(
                                              Constants.termo03,
                                              maxLines: 15,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontFamily: 'Inter Variable Font',
                                                color: Color(0xFF59616E),
                                              )
                                            ),
                                          )
                                        ),

                                        const Padding(padding: EdgeInsets.all(10.0)),

                                        const Divider(

                                            color: Color(0xFF59616E),
                                            thickness: 0.2,
                                            endIndent: 5,
                                            indent: 30),

                                        IconButton(onPressed: () {
                                          Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) => Termos ()),
                                          );
                                        },
                                            icon: const Icon(
                                                MdiIcons.chevronDown,
                                                color: Color(0xFF6F767E),
                                                size: 40.0)),

                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            // ChechBox colocado dentro de um Sized box
                                            // para remover o padding natural que o ele tem
                                            SizedBox(
                                              width: 70,
                                              height: 24,
                                              child: Checkbox(
                                                //fillColor: Color.white,
                                                value: _queroReceber,
                                                onChanged: (bool? value) {

                                                  setState(() {
                                                    _queroReceber = value!;
                                                  });



                                                },
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
                                              child: Checkbox(
                                                //hoverColor: Colors.grey,
                                                //activeColor: Colors.blue,

                                                value: _aceito,

                                                onChanged: (bool? value) {

                                                  setState(() {
                                                    _aceito = value!;
                                                  });




                                                },
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

                                        Padding(
                                            padding: EdgeInsets.only(left: 40, right: 40),
                                              child: SocialLoginButton(
                                                borderRadius: 90,
                                                height: 40,
                                                text: ("Aceitar e Finalizar"),

                                                backgroundColor: const Color(0xFFC1CBD7), //F
                                                textColor: const Color(0xFF4116B4),
                                                buttonType: SocialLoginButtonType.generalLogin,
                                                onPressed: () {


                                                  if(_aceito) {

                                                    final atualizaTermos = db.collection("usuarios").doc(idDocumentoFirebase);
                                                    atualizaTermos.update({"novidades" : _queroReceber, "termos" : _aceito}).then((value) => null);

                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) => const Perfil()),
                                                    );
                                                  } else {
                                                    //mostrarAlerta();
                                                    _showAlertDialog(context);

                                                  }




                                                }
                                        )
                                        ),


                                      ]
                                  )
                              ),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.all(15.0)),


                        ],
                      ),


                )

            ),


      );

  }

  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Atenção'),
        content: const Text('Você precisa aceitar os termos e condições antes de prosseguir'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(

            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),

        ],
      ),
    );
  }

  void mostrarAlerta() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context)
        {
          return Container(
            // padding: EdgeInsets.only(left: 10, top: 10),
              margin: EdgeInsets.only(left: 30, right: 30, top: 200,bottom: 300),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(children: [

                Padding(padding: EdgeInsets.all(10)),

                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      SizedBox(
                          height: 70,
                          width: 70,
                          child:
                          Image.asset("imagens/starreagendamento02.png")
                      ),

                    ]),
                Padding(padding: EdgeInsets.all(7)),

                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          padding: EdgeInsets.all(12),
                          // margin:  EdgeInsets.only(left: 30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: const Color(0xff7DC168),),
                          child:
                          Icon(MdiIcons.check,
                            size: 30,
                            color: Colors.white,
                          )),

                    ]),

                Padding(padding: EdgeInsets.all(7)),

                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Sua consulta foi\nreagendada com sucesso",
                        style: TextStyle(
                          color: Color(0xff4116B4),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          //textAlign: TextAlign.center,

                        ),)

                    ]),

                Padding(padding: EdgeInsets.all(7)),

                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Builder(
                        builder: (context) => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              backgroundColor: Colors.white),
                          onPressed: () {

                          },
                          child: const Text(
                            'Veja o resumo da consulta',
                            style: TextStyle(color: Color(0xFF3C10BB)),
                          ),),
                      ),
                    ]),
                //  Text('Atenção'),



              ]));
        },
      );
    });
  }

}
