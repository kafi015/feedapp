import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    Key? key, this.obscure, required this.controller, required this.hintText,
  }) : super(key: key);

  final bool? obscure;
  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure ?? false,
      obscuringCharacter: '*',

      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(34.0),
          borderSide: const BorderSide(width: 2,color: Colors.blue),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(34.0),
          borderSide: const BorderSide(width: 2,color: Colors.blue),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}