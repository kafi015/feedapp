
import 'package:flutter/material.dart';

class DashboardButton extends StatelessWidget {
  const DashboardButton({
    Key? key, required this.text, required this.onTap,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(

          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffE8F3FB),
            side: const BorderSide(
                width: 1,
                color: Colors.blue
            ),
            elevation: 15,

          ),
          onPressed: onTap,
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0,bottom: 20.0),
            child: Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 28,color: Colors.blue),
            ),
          )),
    );
  }
}