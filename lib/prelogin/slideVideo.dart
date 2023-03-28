import 'package:flutter/material.dart';
import 'package:vetadvisor/prelogin/logado.dart';
import 'package:video_player/video_player.dart';

class SlideVideo extends StatelessWidget {


  //final bool activePage;
  final String video;

   SlideVideo({super.key, required this.video});

  late VideoPlayerController _controllerV;
  late Future<void> _initializeVideoPlayerFuture;

  //necessario para chamar as imagens

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 1000),
      curve: Curves.easeOutQuint,

      /*decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: AssetImage(this.video), //chamo as imagens aqui
              //para a imagem ocupar toda tela
              fit: BoxFit.cover),
          boxShadow: [
            BoxShadow(
              color: Colors.black87,
            )
          ]),*/
      //color: Colors.blue,
      child: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return AspectRatio(
                aspectRatio: _controllerV.value.aspectRatio,
                child: VideoPlayer(_controllerV),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
