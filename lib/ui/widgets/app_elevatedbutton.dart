import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    Key? key, required this.text, required this.textColor, required this.buttonColor, required this.onTap,
  }) : super(key: key);

  final String text;
  final Color textColor, buttonColor;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(

        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            padding: const EdgeInsets.only(bottom: 20,top: 20)),
        child: Text(text,style: TextStyle(color: textColor),),
      ),
    );
  }
}