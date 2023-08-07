// Home Geral OK
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:vetadvisor/prelogin/criarConta.dart';
import 'package:vetadvisor/recursos/Constants.dart';





class Login extends StatelessWidget {
  const Login({super.key});


  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vet Advisor',

      home: LoginPage(),
    );
    return const LoginPage();
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _senha = TextEditingController();


  @override
  initState() {
    super.initState();
  }

  String get name => 'foo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Column(
            children: [
              Expanded(child: Container(

                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('imagens/homeGeral.png'),
                      fit: BoxFit.fitWidth,
                      //colorFilter: new ColorFilter.mode(Cores.azulSafe.withOpacity(1), BlendMode.dstATop))
                    ),
                  ),


                  child: SingleChildScrollView(
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
                              style: const TextStyle(fontSize: 30.0, color: Colors.white),
                            ),
                            const Padding(padding: EdgeInsets.all(10.0)),
                            Form(
                                key: _formKey,
                                child: Stack(
                                    children: [


                                      Column(
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(Radius.circular(17)),
                                            ),
                                            child: TextFormField(
                                              controller: _email,
                                              //obscureText: true,
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
                                              validator: (text){
                                                if(text == null || text.isEmpty){
                                                  return "Por favor, digite o seu e-mail.";
                                                }
                                              },
                                            ),
                                          ),
                                          const Padding(padding: EdgeInsets.all(15.0)),
                                          Container(
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(Radius.circular(17)),
                                            ),
                                            child: TextFormField(
                                              controller: _senha,
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
                                              validator: (text){
                                                if(text == null || text.isEmpty){
                                                  return "Por favor, digite a sua senha.";
                                                }
                                              },
                                            ),
                                          ),
                                        ],
                                      )
                                    ]
                                )
                            ),

                            const Padding(padding: EdgeInsets.all(10.0)),
                             const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Esqueci minha senha", style: (TextStyle(
                                    color: Colors.white
                                )
                                ),
                                ),
                                Padding(padding: EdgeInsets.only(left: 5)),
                                Icon(Icons.arrow_circle_right_outlined,
                                color: Colors.white,)
                              ],
                            ),
                            
                            const Padding(padding: EdgeInsets.all(10.0)),

                            Padding(
                                padding: EdgeInsets.only(left: 30, right: 30),
                                child: Column(
                                  children: [
                                    SocialLoginButton(
                                        borderRadius: 90,
                                        height: 40,
                                        backgroundColor: Colors.white,
                                        textColor: Colors.blue,
                                        buttonType: SocialLoginButtonType.generalLogin,
                                        onPressed: () async {

                                          if (_formKey.currentState!.validate()) {

                                            try {

                                              final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                                  email: _email.text,
                                                  password: _senha.text
                                              );

                                            } on FirebaseAuthException catch (e) {

                                              if (e.code == 'user-not-found') {
                                                _dialogErro("Usuário não encontrado");
                                              } else if (e.code == 'wrong-password') {
                                                _dialogErro("Usuário ou senha inválidos");
                                              }
                                            }
                                          }

                                        }
                                        ),
                                    const Padding(padding: EdgeInsets.all(10.0)),

                                    const Text("ou", style: TextStyle(
                                        color: Colors.white
                                    )
                                    ),
                                    const Padding(padding: EdgeInsets.all(10.0)),
                                    SocialLoginButton(
                                      borderRadius: 90,
                                      height: 40,
                                      buttonType: SocialLoginButtonType.google,
                                      mode: SocialLoginButtonMode.multi,
                                      onPressed: () {},
                                    ),
                                    const Padding(padding: EdgeInsets.all(10.0)),
                                    SocialLoginButton(
                                      borderRadius: 90,
                                      height: 40,
                                      buttonType: SocialLoginButtonType.apple,
                                      mode: SocialLoginButtonMode.multi,
                                      onPressed: () {},
                                    ),
                                    const Padding(padding: EdgeInsets.all(10.0)),
                                    Center(
                                      child: SocialLoginButton(
                                        borderRadius: 90,
                                        height: 40,
                                        buttonType: SocialLoginButtonType.facebook,
                                        mode: SocialLoginButtonMode.multi,
                                        onPressed: () {},
                                      ),
                                    )
                                  ],
                                )


                            ),

                            const Padding(padding: EdgeInsets.all(10.0)),

                             const Row(
                              children: [
                                Text(
                                  "Ainda não é cadastrado? Junte-se a nós,", style: TextStyle(
                                  color: Colors.white,
                                ),
                                ),
                              ],
                            ),

                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const CriarConta()),
                                );
                              },
                              child: const Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Cadastre-se agora", style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 5)),
                                  Icon(Icons.arrow_circle_right_outlined,
                                    color: Colors.white,)
                                ],
                              ),
                            ),


                            const Padding(padding: EdgeInsets.all(10.0)),

                          ],
                        )
                    ),
                  )
              ))
            ],
          )
    );
  }

  Future<void> _dialogErro(String mensagem) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          backgroundColor: Colors.white.withOpacity(0.9),

          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(mensagem),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Fechar"),
              onPressed: () async {

                Navigator.of(context).pop();
              },
            ),

          ],
        );
      },
    );
  }


}
