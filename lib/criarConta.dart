import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:vetadvisor/tutor/perfil.dart';
import 'termos.dart';

class CriarConta extends StatelessWidget {
  const CriarConta({super.key});

  @override
  Widget build(BuildContext context) {
    return const CriarContaPage();
  }
}

class CriarContaPage extends StatefulWidget {
  const CriarContaPage({Key? key}) : super(key: key);

  @override
  State<CriarContaPage> createState() => _CriarContaPageState();
}

/*class corDeFundo extends StatefulWidget {
  const corDeFundo({Key? key}) : super(key: key);

  @override
  State<corDeFundo> createState() => _corDeFundoState();
}

class _corDeFundoState extends State<corDeFundo> {
  @override
  Widget build(BuildContext context) {
    return Container(
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

    );
  }
}
*/
class _CriarContaPageState extends State<CriarContaPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: true,
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
                            Container(
                                padding:
                                const EdgeInsets.only(left: 50, right: 50, top: 10),
                                child: const Divider(
                                  color: Colors.white,
                                  thickness: 0.2,
                                  endIndent: 60,
                                  indent: 60,
                                )),
                            const Text(
                              'Crie sua conta',
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
                                  hintText: 'Confirme sua senha',
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
                                            builder: (context) => const Termos()),
                                      );
                                    },
                                    child: const Text('ENTRAR'))),
                            const Padding(padding: EdgeInsets.all(10.0)),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  // ChechBox colocado dentro de um Sized box
                                  // para remover o padding natural que o ele tem
                                  SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: Checkbox(
                                      value: true,

                                      activeColor: Colors.blue,
                                      //cor do v
                                      checkColor: Colors.black,
                                      // cor do quadrado qnd ativado
                                      fillColor: MaterialStateProperty.all(Colors.white),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5)),

                                      // deixar as bordas arredondadas

                                      // cor da borda do check

                                      onChanged: (Checkbox) {},

                                    ),
                                  ),
                                  const Padding(padding: EdgeInsets.all(5.0)),
                                  const Flexible(child: AutoSizeText(
                                      'Os presentes termos, a seguir, regulamentam o uso da plataforma, VETADVISOR por qualquer pessoa física ou juridica. Política de privacidade',
                                      maxLines: 4,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Inter Variable Font',
                                        color: Colors.white,
                                      )
                                  )
                                  ),


                                ]
                            ),
                            const Padding(padding: EdgeInsets.all(10.0)),
                            const Divider(
                              color: Colors.white,
                              thickness: 0.2,
                              endIndent: 5,
                              indent: 30,),
                           IconButton( onPressed: () {
                             Navigator.push(
                               context,
                               MaterialPageRoute(
                                   builder: (context) => const Termos ()),
                             );
                           },
                               icon: Icon(MdiIcons.chevronDown, color: Colors.white, size: 40.0)
                           ),

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


        ));
  }
}
