import 'package:flutter/material.dart';

class SlideTile extends StatelessWidget {
 SlideTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(top:100, bottom: 100, left: 500, right: 300),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        //color: Colors.blue,
      ),
    );
  }
}
