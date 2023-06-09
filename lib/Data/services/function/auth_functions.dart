import 'package:feedapp/ui/screens/admin_dashboard.dart';
import 'package:feedapp/ui/screens/employee_dashboard.dart';
import 'package:feedapp/ui/utils/snakbar_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../ui/screens/accomplish_screen.dart';
import 'firebase_functions.dart';



class AuthServices {

  static signupUser(String role, String name, String mobile, String pass,
      BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: mobile, password: pass);

      await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      await FirebaseAuth.instance.currentUser!.updateEmail(mobile);
      await FirestoreServices.saveUser(
          role, name, mobile, pass, userCredential.user!.uid);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const AccomplishScreen()));

    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
       showSnackBarMessage(context, 'Email Provided already Exists',Colors.red);
      }
    } catch (e) {
      showSnackBarMessage(context, e.toString(),Colors.red);
    }
  }


  static signinUser(String email, String password, String role, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

       // print("role rolerolerolerolerolerolerolerolerolerolerolerolerolerolerolerolerolerolerolerolerole");
       // print(role);


      if(role == 'Employee')
        {
          showSnackBarMessage(context, 'You are Logged in',Colors.blue);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const EmployeeDashboard()), (route) => false);
        }
      else if(role == 'Admin')
        {
          showSnackBarMessage(context, 'You are Logged in',Colors.blue);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const AdminDashboard()), (route) => false);
        }
      else
        {
          showSnackBarMessage(context, 'LogIn error!',Colors.red);
        }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBarMessage(context, 'No user Found with this Email',Colors.red);
      } else if (e.code == 'wrong-password') {
        showSnackBarMessage(context, 'Password did not match',Colors.red);
      }
    }
  }
}
