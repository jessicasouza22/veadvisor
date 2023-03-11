import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:vetadvisor/termos.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return const MenuPage();
  }
}

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //backgroundColor: Color(0xFF0E02B7),
       drawer: Drawer(
            backgroundColor: Color(0xFF0E02B7),
            child: ListView(
              children: [
                // aqui ele está dividindo o menu em duas partes
                UserAccountsDrawerHeader(
                  decoration: new BoxDecoration(
                    color: Color(0xFF0E02B7),
                  ),
                  currentAccountPicture: Image.asset('imagens/user.png'),
                  accountName: Text("Davies"),
                  accountEmail: Text("davies@gmail.com"),
                ),
                Row(
                  children: [
                    Builder(
                      builder: (context) => IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Termos()),
                          );
                        },
                        icon: Icon(MdiIcons.bellOffOutline,
                            color: Colors.white, size: 20),
                      ),
                    ),
                    Text(
                      "Notificações",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Builder(
                      builder: (context) => IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Termos()),
                          );
                        },
                        icon: Icon(MdiIcons.stethoscope,
                            color: Colors.white, size: 20),
                      ),
                    ),
                    Text(
                      "Minhas consultas",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Builder(
                      builder: (context) => IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Termos()),
                          );
                        },
                        icon: Icon(MdiIcons.calendarClockOutline,
                            color: Colors.white, size: 20),
                      ),
                    ),
                    Text(
                      "Agendar consulta",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Builder(
                      builder: (context) => IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Termos()),
                          );
                        },
                        icon: Icon(MdiIcons.stethoscope,
                            color: Colors.white, size: 20),
                      ),
                    ),
                    Text(
                      "Ver procedimentos",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Builder(
                      builder: (context) => IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Termos()),
                          );
                        },
                        icon: Icon(MdiIcons.stethoscope,
                            color: Colors.white, size: 20),
                      ),
                    ),
                    Text(
                      "Dicas de cuidados",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Builder(
                      builder: (context) => IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Termos()),
                          );
                        },
                        icon: Icon(MdiIcons.cartMinus,
                            color: Colors.white, size: 20),
                      ),
                    ),
                    Text(
                      "Ofertas",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Builder(
                      builder: (context) => IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Termos()),
                          );
                        },
                        icon: Icon(MdiIcons.bottleTonicPlusOutline,
                            color: Colors.white, size: 20),
                      ),
                    ),
                    Text(
                      "Telemedicina",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Builder(
                      builder: (context) => IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Termos()),
                          );
                        },
                        icon: Icon(MdiIcons.bottleTonicPlusOutline,
                            color: Colors.white, size: 20),
                      ),
                    ),
                    Text(
                      "Add novo pet",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Builder(
                      builder: (context) => IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Termos()),
                          );
                        },
                        icon: Icon(MdiIcons.bottleTonicPlusOutline,
                            color: Colors.white, size: 20),
                      ),
                    ),
                    Text(
                      "Suporte técnico",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Builder(
                      builder: (context) => IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Termos()),
                          );
                        },
                        icon: Icon(MdiIcons.bottleTonicPlusOutline,
                            color: Colors.white, size: 20),
                      ),
                    ),
                    Text(
                      "Sair da conta",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                Divider(
                  color: Colors.white,
                  thickness: 0.2,
                  endIndent: 28,
                  indent: 18,
                )
              ],
            )),

        // a partir daqui que comecou a mostrar a msg que estourou


        appBar: AppBar(

          backgroundColor: Color(0xFF0E02B7),
          title: Text(
            "Olá ----- ",

            style: TextStyle(),
          ),
          actions: [
            Builder(
              builder: (context) => IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Termos()),
                  );
                },
                padding:
                    const EdgeInsets.only(bottom: 10, right: 300, left: 50, top: 10),
                icon: Icon(MdiIcons.arrowLeft, color: Colors.white, size: 20),
              ),
            ),

         /*   Builder(
              builder: (context) => IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Termos()),
                  );
                },
                //padding: const EdgeInsets.only(bottom: 25, left: 300, right: 50,top: 20),
                icon: Icon(MdiIcons.bellOffOutline,
                    color: Colors.white, size: 20),
              ),
            ),*/
          ],
        ),

        /*body: Container(
          // padding: EdgeInsets.only(bottom: 10, left: 200, right: 200),
            decoration: new BoxDecoration(
              color: Colors.orange,
              //borderRadius: BorderRadius.only(
              //topLeft: const Radius.circular(40.0),
              //topRight: const Radius.circular(40.0),
            ),
            child: Row(
              children: [

                /*   const Padding(padding: EdgeInsets.all(15.0)),
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
                      hintText: 'Digite os sintomas do seu pet',
                    ),
                  ),
                ),
                const Icon(
                    MdiIcons.magnify, color: Colors.black, size: 40.0),
*/
                /*   Builder(
                       builder: (context) => ElevatedButton(
                           style: TextButton.styleFrom(
                             padding: const EdgeInsets.only(
                                 top: 10, right:20, left: 20, bottom: 10),
                             primary: Colors.blue,
                             backgroundColor:  Color(0xFF3C10BB),
                             shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(30.0)),
                             // Background Color
                           ),
                           onPressed: () {
                             Navigator.push(
                               context,
                               MaterialPageRoute(
                                   builder: (context) => const Menu()),
                             );
                           },
                           child: const Text('IR'))),*/

         */
      ),
    );
  }
}
