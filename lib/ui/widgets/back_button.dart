import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Padding(
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        child: Icon(Icons.arrow_back_ios),
      ),
    );
  }
}