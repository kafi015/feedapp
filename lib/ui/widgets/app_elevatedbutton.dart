import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    Key? key, required this.text, required this.textColor, required this.buttonColor, required this.onTap, this.bottomPadding, this.topPadding,
  }) : super(key: key);

  final String text;
  final Color textColor, buttonColor;
  final VoidCallback onTap;
  final double? bottomPadding;
  final double? topPadding;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(

        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            padding:  EdgeInsets.only(bottom: bottomPadding ?? 10,top: topPadding ?? 10)),
        child: Text(text,style: TextStyle(color: textColor,fontSize: 18),),
      ),
    );
  }
}