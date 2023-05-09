import 'package:flutter/material.dart';

import '../screens/dashboard.dart';

class AppBarHomeIconButton extends StatelessWidget {
  const AppBarHomeIconButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap:(){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const Dashboard()), (route) => false);
        },
        child: Icon(Icons.home,size: 28,));
  }
}