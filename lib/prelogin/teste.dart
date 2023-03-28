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
  void initState() {
   _controllerV = VideoPlayerController.asset("videos/cuidados.mp4");
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

         // padding: EdgeInsets.only(bottom: 200, top: 50, left: 50, right: 50),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Colors.amber,
          ),

          // tentando fazer a parte de video de outra forma
         child: SizedBox(

           width: double.infinity,
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
                    }

                    ),

               Padding(padding: EdgeInsets.only(top: 1, bottom: 100),
                   child:
               FloatingActionButton(onPressed: () {
                  setState(() {
                    if (_controllerV.value.isPlaying) {

                      _controllerV.pause();
                      print("pause");
                    } else {

                      _controllerV.play();
                      print("play");
                    }
                  }
                  );
                },
                   child: Icon(_controllerV.value.isPlaying ? Icons.pause : Icons.play_arrow),
                )
               )
              ]
          ),
        )
        )

    );
  }


}
