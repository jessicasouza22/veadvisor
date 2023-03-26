import 'package:flutter/material.dart';
import 'package:vetadvisor/prelogin/logado.dart';

class SlideTile extends StatelessWidget {

  final String image;
  //final bool activePage;

  const SlideTile({super.key, required this.image});
  //necessario para chamar as imagens




  @override
  Widget build(BuildContext context) {
    return  AnimatedContainer(

      duration: Duration(milliseconds: 1000),
      curve: Curves.easeOutQuint,
     // margin: EdgeInsets.all(10),
       // margin: EdgeInsets.only( bottom: 100, right: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(

          image: AssetImage(this.image), //chamo as imagens aqui
          //para a imagem ocupar toda tela
          fit: BoxFit.cover
        ),
          boxShadow: [
          BoxShadow(
          color: Colors.black87,
          //blurRadius: blur,
         // offset: Offset(offset, offset)
          )
        ]
      )
        //color: Colors.blue,

    );
  }

}
