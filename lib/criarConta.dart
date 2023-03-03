import 'package:flutter/material.dart';
import 'package:vetadvisor/tutor/perfil.dart';

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

class _CriarContaPageState extends State<CriarContaPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                //stops: [0.1, 0.3, 0.7, 1],
                colors: <Color>[

                  Color(0xFF0E02B7),

                  Color(0xFF4116B4),
                  //Color(0xFFF9F9F9),
                  Color(0xFF4756EF),
                  Color(0xFFDB51FD),



                ],
              )),
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.all(10.0)),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 100, right: 150, left: 150),
                      child: const Image(
                        image: AssetImage('imagens/logo1.png'),
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(top: 15, right: 150, left: 150),
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
                    width: 300,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: TextFormField(
                      obscureText: true,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        //fillColor: Colors.orange,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
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
                    width: 300,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: TextFormField(
                      obscureText: true,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        //fillColor: Colors.orange,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
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
                    //TIRAR WIDTH
                    width: 300,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: TextFormField(
                      obscureText: true,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        //fillColor: Colors.orange,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Color(0xFF3C10BB),
                            width: 1.0,
                          ),
                        ),
                        hintText: 'Confirme sua senha',
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(10.0)),
                  Builder(
                      builder: (context) => ElevatedButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.only(
                                top: 10, right: 50, left: 50, bottom: 10),
                            primary: Colors.blue,
                            backgroundColor: Colors.white,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            // Background Color
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Perfil()),
                            );
                          },
                          child: const Text('ENTRAR'))),
                  Row(


                    children: [
                      Expanded(child:
                    /* Container(
                       //margin: new EdgeInsets.symmetric(horizontal: 10),

                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),

                      child:*/
                      Checkbox(
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



                      //),
                      Text(
                          'Os presentes termos, a seguir, \n'
                              'regulamentam o uso da plataforma, VETADVISOR \n'
                          'por qualquer pessoa física ou juridica. Política de \n'
                          'privacidade',
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'Inter Variable Font',
                          color: Colors.white,

                          )),

                    ]
                  ),


              Row(

                children: [
                  //alignment: Alignment.
                  Radio(
                    //fillColor: Color.white,
                    value: false,
                    groupValue: false,

                    onChanged: (value) {},
                  ),
                  Text(
                      'Quero receber novidades, promoções e ofertas personalizadas da VetAdvisor',
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'Inter Variable Font',
                    color: Colors.white,
                  ),
                  ),
                  ],
              ),
                ],
              ),
            ),
          ),
        ));
  }
}
