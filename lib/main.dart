import 'package:feedapp/ui/screens/accomplish_screen.dart';
import 'package:feedapp/ui/screens/login_screen.dart';
import 'package:feedapp/ui/screens/register_screen.dart';
import 'package:feedapp/ui/screens/varification_screen.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
     // home: RegistrationScreen(),
      home: LogInScreen(),
    );
  }
}
