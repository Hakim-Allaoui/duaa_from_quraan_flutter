import 'package:flutter/material.dart';

class MainBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[Color(0XFF001729), Color(0XFF002D4E)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              Expanded(child: Image.asset('assets/images/decoretop.png')),
              Expanded(child: Image.asset('assets/images/decoretop.png')),
              Expanded(child: Image.asset('assets/images/decoretop.png')),
              Expanded(child: Image.asset('assets/images/decoretop.png')),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: <Widget>[
              Expanded(child: Image.asset('assets/images/decorebottom.png')),
              Expanded(child: Image.asset('assets/images/decorebottom.png')),
              Expanded(child: Image.asset('assets/images/decorebottom.png')),
              Expanded(child: Image.asset('assets/images/decorebottom.png')),
            ],
          ),
        ),
      ],
    );
  }
}
