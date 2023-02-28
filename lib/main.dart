import 'package:flutter/material.dart';

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

              Padding(
                  padding: const EdgeInsets.all(10.0)),
              Center(child:
              Container(
                padding: EdgeInsets.only(top:0.1, bottom: 0.1),
                height: 90,
                width: 90,
                //color: Colors.greenAccent,
                child: Image(
                  image: AssetImage('imagens/logo1.png'),

                ),
              ),
              ),

              Container(
                padding: EdgeInsets.only(top:0.1, bottom: 0.1),
                height: 90,
                width: 90,
                child: Image(
                  image: AssetImage('imagens/logo2.png'),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top:0.1, bottom: 0.1),
                  child: Divider(

                    height: 100,
                    color: Colors.white,
                    thickness: 0.2,
                    indent: 120,
                    endIndent: 120,


                  )
              ),




              const Text(
                'Crie sua conta',
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white
                ),
              ),


              Padding(
                  padding: const EdgeInsets.all(15.0)),
              //codigo para o textFiel de email
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
              Padding(
                  padding: const EdgeInsets.all(15.0)),
              // codigo textField senha
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
              Padding(
                  padding: const EdgeInsets.all(15.0)),
              //codigo do textField confirme a senha

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


              Padding(
                  padding: const EdgeInsets.all(15.0)),


              ElevatedButton(



                  onPressed: () {},
                  child: Text('ENTRAR')),




            ],

          ),
        ),

      ),);

  }
}
