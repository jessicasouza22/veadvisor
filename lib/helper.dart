
import 'package:flutter/material.dart';



class CorDeFundo extends StatelessWidget {
  const CorDeFundo({super.key});

  @override
  Widget build(BuildContext context) {
    return const CorDeFundoPage();
  }
}

class CorDeFundoPage extends StatefulWidget {
  const CorDeFundoPage({Key? key}) : super(key: key);

  @override
  State<CorDeFundoPage> createState() => _CorDeFundoPageState();
}


class _CorDeFundoPageState extends State<CorDeFundoPage> {
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

    )
        )
  ]
        )
    )
    );
  }
}
