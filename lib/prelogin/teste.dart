import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class Teste extends StatelessWidget {
  const Teste({super.key});

  @override
  Widget build(BuildContext context) {
    return const TestePage();
  }
}

class TestePage extends StatefulWidget {
  const TestePage({Key? key}) : super(key: key);

  @override
  State<TestePage> createState() => _TestePageState();
}

class _TestePageState extends State<TestePage> {
  // teste 02 do video

  late VideoPlayerController _controllerV;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initSate() {
   _controllerV = VideoPlayerController.asset("videos/borboletas.mp4");
   // _controllerV = VideoPlayerController.network("https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4");
    _initializeVideoPlayerFuture = _controllerV.initialize();
    _controllerV.setLooping(true);
    _controllerV.setVolume(1.0);
    super.initState();
  }

  @override
  void dispose() {
    _controllerV.dispose();
    super.dispose();
  }

  //do video
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Container(
          // tentando fazer a parte de video de outra forma

          child: Column(
              children: [
                FutureBuilder(
                    future: _initializeVideoPlayerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState ==
                          ConnectionState.done) {
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
                FloatingActionButton(onPressed: () {
                  setState() {
                    if (_controllerV.value.isPlaying) {
                      _controllerV.pause();
                    } else {
                      _controllerV.play();
                    }
                    ;
                  }
                })
              ]
          ),
        )

    );
  }
}
