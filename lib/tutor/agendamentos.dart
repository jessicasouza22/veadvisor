import 'package:flutter/cupertino.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:vetadvisor/termos.dart';

class Agendamentos extends StatelessWidget {
  const Agendamentos({super.key});

  @override
  Widget build(BuildContext context) {
    return const AgendamentosPage();
  }
}

class AgendamentosPage extends StatefulWidget {
  const AgendamentosPage({Key? key}) : super(key: key);

  @override
  State<AgendamentosPage> createState() => _AgendamentosPageState();
}

class _AgendamentosPageState extends State<AgendamentosPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
       // body: Scaffold(
        home: Container(
            child: CustomScrollView(
                slivers: [
                SliverFillRemaining(
                hasScrollBody: true,
                child:
                Container(
                  color: Colors.white,

                        //padding: const EdgeInsets.only(left: 30, right: 30),
                        child: SingleChildScrollView(
                          child: Column(
                              children: [
                                // appBar:
                               AppBar(
                                    toolbarHeight: 100,
                                    elevation: 50,
                                    backgroundColor: Color(0xFF0E02B7),
                                    title: Text(
                                      "Olá ----- ",

                                      style: TextStyle(),
                                    ),
                                    // elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(30),
                                      ),
                                    ),

                                    actions: [
                                      Expanded(

                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 40),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  IconButton(onPressed: () {
                                                    print("clicado na seta");
                                                  },
                                                      icon: Icon(
                                                          Icons.arrow_back)),
                                                  Text(
                                                    "Olá ----- ",

                                                    style: TextStyle(),
                                                  ),
                                                  IconButton(onPressed: () {
                                                    print(
                                                        "clicado no notificacao");
                                                  },
                                                      icon: Icon(
                                                          Icons.doorbell)),
                                                ]
                                                ,

                                              )))
                                    ]
                                ),
                                Padding(padding: EdgeInsets.only(top: 10)),
                                Center(
                                   // crossAxisAlignment: CrossAxisAlignment.center,
                                  child: Row(
                                  children: [
                                    Padding(padding: EdgeInsets.only(left: 10)),
                                    Icon(Icons.circle,
                                    size: 12,
                                    color: Colors.green),
                                    Padding(padding: EdgeInsets.only(left: 10)),
                                    Text("Cães",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),),
                                    Padding(padding: EdgeInsets.only(left: 10)),
                                    Icon(Icons.circle,
                                        size: 12,
                                        color: Colors.grey),
                                    Padding(padding: EdgeInsets.only(left: 10)),
                                    Text("Gatos",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),),
                                    Padding(padding: EdgeInsets.only(left: 10)),
                                    Icon(Icons.circle,
                                        size: 12,
                                        color: Colors.grey),
                                    Padding(padding: EdgeInsets.only(left: 10)),
                                    Text("Pets exóticos",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),),
                                  ],
                                )
                                ),

                                const Padding(padding: EdgeInsets.only(top: 20)),
                                Material(

                                  child: Container(
                                    padding: EdgeInsets.only(left: 50, right: 50),
                                  decoration: const BoxDecoration(

                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(17)),
                                  ),
                                  child: TextFormField(

                                   // obscureText: true,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      //fillColor: Colors.orange,
                                      prefixIcon: Icon(Icons.search),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(17),
                                        borderSide: const BorderSide(
                                          color: Color(0xFF3C10BB),
                                          width: 1.0,
                                        ),
                                      ),
                                     // icon: ,
                                      hintText: "Digite os sintomas do seu pet",
                                    ),

                                  ),

                                ),
                                ),
                              ]
                          ),
                        ))),
        ]
            ),
    ),
    );
  }
}
