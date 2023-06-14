import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedapp/ui/screens/admin_dashboard.dart';
import 'package:feedapp/ui/screens/employee_dashboard.dart';
import 'package:feedapp/ui/screens/login_screen.dart';
import 'package:feedapp/ui/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


Future<void> main()
async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      navigatorKey: MyApp.globalKey,
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final email = FirebaseAuth.instance.currentUser?.email;

            FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
            firebaseFirestore.collection('users').get().then((doucment)
            {
              for(var docs in doucment.docs)
              {
                if(docs.get('mobile') == email)
                {
                  LogInScreen.role = docs.get('role');
                  setState(() {});
                  break;
                }
              }
            }
            );

            if(LogInScreen.role == 'Admin')
              {
                return const AdminDashboard();
              }
            else if(LogInScreen.role == 'Employee')
            {
              return const EmployeeDashboard();
            }
            else
              {
                return const SplashScreen();
              }
          } else {
            return const SplashScreen();
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