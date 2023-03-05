import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:vetadvisor/tutor/perfil.dart';
import 'criarConta.dart';

class Termos extends StatelessWidget {
  const Termos({Key? key}) : super(key: key);

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

                                const Padding(padding: EdgeInsets.all(15.0)),
                                Container(
                                  padding: EdgeInsets.only(top: 550),
                                  color: Colors.white,
                                  child: //Flexible(child:
                                  Text(

                                      'TERMOS E CONDIÇÕES GERAIS DE USO PARA USUÁRIOS E PROFISSIONAIS: PERFIL BÁSICO VETZCO SERVIÇOS ONLINE E SOFTWARE LTDA. (“VETADVISOR”), pessoa jurídica de direito privado, inscrita no CNPJ sob o no 00.000.000/0001-00, endereço eletrônico vetadvisor.com.br, com sede na Rua XXXX , 100, apt. 00, Maringá, Rio grande do Sul/RS e CEP: 00.000-000, é criadora e titular da propriedade intelectual sobre software, website, aplicativos, conteúdos e demais ativos relacionados à plataforma digital VETADVISOR. Os presentes termos e condições, a seguir, regulamentam o uso da plataforma VETADVISOR por qualquer pessoa física ou jurídica.',
                                      maxLines: 4,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Inter Variable Font',
                                        color: Colors.black,
                                      )
                                  )
                                 // ),
                                )

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
