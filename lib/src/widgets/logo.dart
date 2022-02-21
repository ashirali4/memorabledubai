import 'package:flutter/material.dart';
class AppLogo extends StatelessWidget {
  final double height;
  const AppLogo({Key? key,this.height=250}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Image.asset('assets/logo-white.png'),
    );
  }
}
