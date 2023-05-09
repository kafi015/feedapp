import 'package:flutter/material.dart';

class EnterSellInfoText extends StatelessWidget {
  const EnterSellInfoText({
    Key? key,
    required this.width, required this.textEnglish, required this.textBangla, required this.height,
  }) : super(key: key);

  final double width;
  final double height;
  final String textEnglish, textBangla;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding:  EdgeInsets.only(left: width * 0.05),
          child: Text(textEnglish,style: TextStyle(color: Colors.blue,fontSize: height * 0.018),),
        ),
        const Spacer(),
        Padding(
          padding:  EdgeInsets.only(right: width * 0.07),
          child: Text(textBangla,style: TextStyle(color: Colors.blue,fontSize: height * 0.018),),
        ),
      ],
    );
  }
}
