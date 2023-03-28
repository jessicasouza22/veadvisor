// Home Geral OK
 import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:vetadvisor/helper.dart';
import 'package:vetadvisor/prelogin/logado.dart';
import 'package:vetadvisor/teste02.dart';
import 'package:vetadvisor/recursos/Constants.dart';
import 'package:vetadvisor/fluxoprontuariodigital/perfil.dart';
import 'termos.dart';
import 'logado.dart';




class Login extends StatelessWidget {
  const Login({super.key});





  @override
  Widget build(BuildContext context) {
    return const LoginPage();
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {

  @override
  initState() {


    super.initState();

  }

  String get name => 'foo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('imagens/homeGeral.png'),
                      //fit: BoxFit.fifll,
                      //colorFilter: new ColorFilter.mode(Cores.azulSafe.withOpacity(1), BlendMode.dstATop))
              ),
              ),


        child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: true,
                child:
                Container(
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
                            Container(
                                padding:
                                const EdgeInsets.only(left: 50, right: 50, top: 10),
                                child: const Divider(
                                  color: Colors.white,
                                  thickness: 0.2,
                                  endIndent: 60,
                                  indent: 60,
                                )),
                            Text(
                              Constants.bemVindo,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 30.0, color: Colors.white),
                            ),
                            const Padding(padding: EdgeInsets.all(10.0)),
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(17)),
                              ),
                              child: TextFormField(
                                obscureText: true,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  //fillColor: Colors.orange,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(17),
                                    borderSide: const BorderSide(
                                      color: Color(0xFF3C10BB),
                                      width: 1.0,
                                    ),
                                  ),
                                  hintText: 'E-mail',
                                ),
                              ),
                            ),
                            const Padding(padding: EdgeInsets.all(15.0)),
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(17)),
                              ),
                              child: TextFormField(
                                obscureText: true,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  //fillColor: Colors.orange,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(17),
                                    borderSide: const BorderSide(
                                      color: Color(0xFF3C10BB),
                                      width: 1.0,
                                    ),
                                  ),
                                  hintText: 'Senha',
                                ),
                              ),
                            ),
                            const Padding(padding: EdgeInsets.all(15.0)),

                            Builder(
                                builder: (context) => ElevatedButton(
                                    style: TextButton.styleFrom(
                                      padding: const EdgeInsets.only(
                                          top: 10, right: 80, left: 80, bottom: 10),
                                      primary: Colors.blue,
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30.0)),
                                      // Background Color
                                    ),
                                    onPressed: () {


                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const Logado()),

                                      );
                                    },
                                    child: const Text('ENTRAR'))),
                            const Padding(padding: EdgeInsets.all(10.0)),


                            const Divider(
                              color: Colors.white,
                              thickness: 0.2,
                              endIndent: 5,
                              indent: 30,),


                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // ChechBox colocado dentro de um Sized box
                                // para remover o padding natural que o ele tem
                                SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Radio(
                                    //fillColor: Color.white,
                                    value: false,
                                    groupValue: false,

                                    onChanged: (value) {},
                                  ),
                                ),
                                const Padding(padding: EdgeInsets.all(5.0)),
                                const Flexible(child: AutoSizeText(
                                  'Quero receber novidades, promoções e ofertas personalizadas da VetAdvisor',
                                  textAlign: TextAlign.justify,
                                  maxLines: 4,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Inter Variable Font',
                                    color: Colors.white,
                                  ),
                                ))

                              ],
                            ),

                          ],
                        ),
                      )


                    )



                ),
              )
            ],


          )


        ))
    );
  }




}
