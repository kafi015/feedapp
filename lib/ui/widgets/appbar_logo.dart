import 'package:flutter/material.dart';

import '../screens/dashboard.dart';

class AppBarLogo extends StatelessWidget {
  const AppBarLogo({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const Dashboard()));
      },
      child: Image.asset(
        "assets/logo.png",
        scale: height/150,
      ),
    );
  }
}