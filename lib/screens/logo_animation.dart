import 'package:flutter/material.dart';

class LogoAnimation extends StatelessWidget {

  final double height;

  LogoAnimation({@required this.height});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'logo',
      child: Container(
        height: height,
        child: Image.asset('images/logo.png'),
      ),
    );
  }
}
