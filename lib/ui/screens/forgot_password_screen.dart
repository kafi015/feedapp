import 'package:feedapp/ui/screens/forgot_varification.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: const Text("Forget Password?"),
        centerTitle: true,
        actions:  [
          AppBarLogo(height: height),
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width * .05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               SizedBox(
                height: height* .04,
              ),
              Center(
                child: Image.asset(
                  "assets/forgot_password.png",
                  scale: height* .002,
                ),
              ),
               SizedBox(
                height: height* .04,
              ),
               Center(
                child: Text(
                  "Forgot\nPassword?",
                  style: TextStyle(
                      fontSize: height* .04,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
               SizedBox(
                height: height* .04,
              ),
              Text(
                "Don’t worry ! It happens. Please enter the phone number we will send the OTP in this phone number.",
                style: TextStyle(
                    fontSize: height* .021,
                    color: Colors.black,
                   ),
              ),

               SizedBox(
                height: height* .04,
              ),
              AppTextFormField(
                  controller: TextEditingController(),
                  hintText: "Enter the phone number"),
               SizedBox(
                height: height* .1,
              ),

              AppElevatedButton(
                text: "Continue",
                textColor: Colors.white,
                buttonColor: Colors.blue,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const ForgotVarification()));
                },
              ),

            ],
          ),
        ),
      ),
    );

  }
}
