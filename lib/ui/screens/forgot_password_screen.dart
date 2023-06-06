import 'package:feedapp/Data/number.dart';
import 'package:feedapp/ui/screens/forgot_varification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Data/network_utils.dart';
import '../../Data/urls.dart';
import '../utils/snakbar_message.dart';
import '../widgets/app_elevatedbutton.dart';
import '../widgets/app_textformfield.dart';
import '../widgets/appbar_logo.dart';

class ForgotPasswprdScreen extends StatefulWidget {
  const ForgotPasswprdScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswprdScreen> createState() => _ForgotPasswprdScreenState();
}

class _ForgotPasswprdScreenState extends State<ForgotPasswprdScreen> {
  late double height;
  late double width;

  TextEditingController emailETController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<dynamic> userList = [];
  bool isNumberExist = false;


  final FirebaseAuth _auth = FirebaseAuth.instance;

  phoneAuth(String email) {
    _auth.verifyPhoneNumber(
      phoneNumber: MobileNumber.countryCode + MobileNumber.mobileNumber,
        timeout: const Duration(seconds: 120),
        verificationCompleted: (PhoneAuthCredential credential) async{
        // var result = await _auth.signInWithCredential(credential);
        // User? user = result.user;
        // if(user != null)
        //   {
        //     Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotVarification(id: '')));
        //   }

        },
        verificationFailed: (FirebaseAuthException exception)
        {
         // print(exception);
        },
        codeSent: (String varificationId, int? resendToken){
        ForgotVarification.verifyId = varificationId;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ForgotVarification(email: email,)));
        },
        codeAutoRetrievalTimeout: (String varificationId){

    },
    );
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery
        .of(context)
        .size
        .height;
    width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: AppBarLogo(height: height),
        title: const Text("Forget Password ?"),
        centerTitle: true,
        actions: [

          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * .05),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * .04,
                ),
                Center(
                  child: Image.asset(
                    "assets/forgot_password.png",
                    scale: height * .004,
                  ),
                ),
                SizedBox(
                  height: height * .04,
                ),
                Center(
                  child: Text(
                    "Forgot\nPassword?",
                    style: TextStyle(
                        fontSize: height * .04,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: height * .04,
                ),
                Text(
                  "Don’t worry ! It happens. Please enter the phone number we will send the OTP in this phone number.",
                  style: TextStyle(
                    fontSize: height * .021,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: height * .04,
                ),
                SizedBox(
                  height: height * 0.08,
                  child: AppTextFormField(
                      controller: emailETController,
                      keyBoardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@gmail.com')) {
                          return 'Please Enter valid Email';
                        } else {
                          return null;
                        }
                      },
                      // validator: (value) {
                      //   if (value?.isEmpty ?? true) {
                      //     return "Enter your mobile number";
                      //   }
                      //   if (value!.length < 11) {
                      //     return "Mobile number must be 11 digit";
                      //   }
                      //   if (value.length > 11) {
                      //     return "Mobile number must be 11 digit";
                      //   }
                      //   return null;
                      // },
                      hintText: "Enter your email address"),
                ),
                SizedBox(
                  height: height * .1,
                ),
                AppElevatedButton(
                  text: "Continue",
                  textColor: Colors.white,
                  buttonColor: Colors.blue,
                  onTap: () async{
                    if (_formKey.currentState!.validate()) {
                      try {
                        await FirebaseAuth.instance.sendPasswordResetEmail(email: emailETController.text);
                        phoneAuth(emailETController.text);

                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Email doesn't exist!")));
                        }
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
