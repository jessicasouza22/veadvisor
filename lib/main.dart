import 'package:flutter/material.dart';
import 'package:vetadvisor/tutor/perfil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF3C10BB),
        body: SafeArea(
          child: Column(
            children: [

              const Padding(
                  padding: EdgeInsets.all(10.0)),

              Center(
                child: Container(
                  padding: EdgeInsets.only(top:0, bottom: 0),
                  child: const Image(
                    image: AssetImage('imagens/logo1.png'),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top:10, bottom: 0),
                //height: 90,
                //width: 90,
                child: const Image(
                  image: AssetImage('imagens/logo2.png'),
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(left:50, right: 50, top: 10),
                  child: const Divider(
                    color: Colors.white,
                    thickness: 1,
                  )
              ),
              const Text(
                'Crie sua conta',
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white
                ),
              ),

              const Padding(
                  padding: EdgeInsets.all(10.0)),

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
              const Padding(
                  padding: EdgeInsets.all(15.0)),
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
              const Padding(
                  padding: EdgeInsets.all(15.0)),
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
                    hintText: 'Confirme sua senha',
                  ),
                ),
              ),

              const Padding(
                  padding: EdgeInsets.all(10.0)),
              Builder(
                builder: (context) =>

              ElevatedButton(
                  onPressed: () {},
                  child: const Text('ENTRAR'))),
            ],

          ),
        ),
      )
    );
  }
}
