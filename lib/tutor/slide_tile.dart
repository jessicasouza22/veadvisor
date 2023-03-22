import 'package:flutter/material.dart';
import 'package:vetadvisor/logado.dart';

class SlideTile extends StatelessWidget {

  final String image;
  final bool activePage;

  const SlideTile({super.key, required this.image, required this.activePage});
 //necessario para chamar as imagens




  @override
  Widget build(BuildContext context) {
    return  Container(
     // margin: EdgeInsets.all(10),
     // padding: EdgeInsets.only(top:100, bottom: 100, left: 500, right: 300),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(this.image), //chamo as imagens aqui
          //para a imagem ocupar toda tela
          fit: BoxFit.cover
        )
        //color: Colors.blue,
      ),
    );
  }

}
