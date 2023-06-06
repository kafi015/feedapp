import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedapp/ui/screens/admin_dashboard.dart';
import 'package:feedapp/ui/screens/employee_dashboard.dart';
import 'package:feedapp/ui/utils/snakbar_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Password Provided is too weak')));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Email Provided already Exists')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  // static signupUserWithPhone(String role, String name, String mobile,
  //     String pass, BuildContext context) async {
  //   try {
  //     UserCredential userCredential = await FirebaseAuth.instance.verifyPhoneNumber(
  //       phoneNumber: '+44 7123 123 456',
  //       verificationCompleted: (PhoneAuthCredential credential) {},
  //       verificationFailed: (FirebaseAuthException e) {},
  //       codeSent: (String verificationId, int? resendToken) {},
  //       codeAutoRetrievalTimeout: (String verificationId) {},
  //     );
  //
  //     await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
  //     await FirebaseAuth.instance.currentUser!.updateEmail(mobile);
  //     await FirestoreServices.saveUser(
  //         role, name, mobile, pass, userCredential.user!.uid);
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text('Registration Successful')));
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text('Password Provided is too weak')));
  //     } else if (e.code == 'email-already-in-use') {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text('Email Provided already Exists')));
  //     }
  //   } catch (e) {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text(e.toString())));
  //   }
  // }



  static signinUser(String email, String password, String role, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

       // print("role rolerolerolerolerolerolerolerolerolerolerolerolerolerolerolerolerolerolerolerolerole");
       // print(role);


      if(role == 'Employee')
        {
          showSnackBarMessage(context, 'You are Logged in',Colors.blue);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => EmployeeDashboard()), (route) => false);
        }
      else if(role == 'Admin')
        {
          showSnackBarMessage(context, 'You are Logged in',Colors.blue);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => AdminDashboard()), (route) => false);
        }
      else
        {
          showSnackBarMessage(context, 'LogIn error!',Colors.red);
        }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('No user Found with this Email')));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Password did not match')));
      }
    }
  }
}
