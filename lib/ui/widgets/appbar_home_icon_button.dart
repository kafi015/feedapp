import 'package:flutter/material.dart';


class AppBarHomeIconButton extends StatelessWidget {
  const AppBarHomeIconButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap:(){
        },
        child: const Icon(Icons.home,size: 28,));
  }
}