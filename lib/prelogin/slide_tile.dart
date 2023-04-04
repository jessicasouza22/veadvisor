import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vetadvisor/prelogin/logado.dart';

class SlideTile extends StatelessWidget {

  final String image;
  //final bool activePage;

  const SlideTile({super.key, required this.image});
  //necessario para chamar as imagens




  @override
  Widget build(BuildContext context) {
    int _indexCarrousel = 0;
    return  CarouselSlider(

        items: [
          AnimatedContainer(

              duration: const Duration(milliseconds: 1000),
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

          )
          ], options: CarouselOptions(
      height: 120,
      onPageChanged: (index, resource) {
        _indexCarrousel++;
        print(_indexCarrousel);
      },
      // aspectRatio: 16 / 9,
      //viewportFraction: 0.8,
      //initialPage: 0,
      //enableInfiniteScroll: true,
      //reverse: false,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 4),
      autoPlayAnimationDuration:
      Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      // enlargeFactor: 0.3,
      //onPageChanged: callbackFunction,
      scrollDirection: Axis.horizontal,
    ),
    );
  }

}
