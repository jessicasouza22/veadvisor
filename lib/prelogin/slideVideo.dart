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
    return Container();
  }
}
