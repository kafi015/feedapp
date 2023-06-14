import 'package:flutter/material.dart';

class AppBarLogo extends StatelessWidget {
  const AppBarLogo({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0,top: 5.0,bottom: 5.0),
      child: InkWell(
        onTap: (){
        },
        child: Image.asset(
          "assets/logo.png",
          scale: height/200,
        ),
      ),
    );
  }
}