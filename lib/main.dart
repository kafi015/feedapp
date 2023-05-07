import 'package:feedapp/ui/screens/accomplish_screen.dart';
import 'package:feedapp/ui/screens/adminstrator_screen.dart';
import 'package:feedapp/ui/screens/dashboard.dart';
import 'package:feedapp/ui/screens/login_screen.dart';
import 'package:feedapp/ui/screens/pass_change_message.dart';
import 'package:feedapp/ui/screens/price_change_screen.dart';
import 'package:feedapp/ui/screens/register_screen.dart';
import 'package:feedapp/ui/screens/sell%20info%20screen/sell_info_due_check_screen.dart';
import 'package:feedapp/ui/screens/splash_screen.dart';
import 'package:feedapp/ui/screens/varification_screen.dart';
import 'package:flutter/material.dart';

import 'ui/screens/forgot_password_screen.dart';
import 'ui/screens/set_password_screen.dart';

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
     // home: SellInfoDueCheckScreen(),
      home: SplashScreen(),
    );
  }
}
