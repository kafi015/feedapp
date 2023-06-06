import 'package:feedapp/ui/screens/admin_dashboard.dart';
import 'package:feedapp/ui/screens/employee_dashboard.dart';
import 'package:feedapp/ui/screens/login_screen.dart';
import 'package:feedapp/ui/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Data/services/function/auth_functions.dart';

Future<void> main()
async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
     // home: PriceChangeScreen(),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if(LogInScreen.role == 'Admin')
              {
                return AdminDashboard();
              }
            else if(LogInScreen.role == 'Employee')
            {
              return EmployeeDashboard();
            }
            else
              {
                return SplashScreen();
              }
          } else {
            return SplashScreen();
          }
        },
      ),
    );
  }
}

/*
plugins {
    id 'com.android.application'
    id 'com.google.gms.google-services'

}
 */