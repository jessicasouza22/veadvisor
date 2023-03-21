import 'package:flutter/material.dart';

class SlideTile extends StatelessWidget {

 final String image;
 //necessario para chamar as imagens

 //const SlideTile ({Key key, this.image}) : super(key: key);
 const SlideTile({Key key, this.image}) : super(key: key);

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
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('image', image));
    properties.add(StringProperty('image', image));
  }
}
