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
        //  Center(
           //     child: Image(
               //   image: AssetImage('imagens/logo1.png'),
               // ),
              //),

           child: Column(

          children:[
              TextField(

                obscureText: true,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color(0xFF3C10BB),
                      width: 1.0,
                    ),
                  ),
                  labelText: 'E-mail',
//contentPadding: EdgeInsets.all(50),
                ),
              ),

              Center(
                child: Image(
                  image: AssetImage('imagens/logo2.png'),
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
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


            ],

            ),
          ),

        ),
      );

  }
}

