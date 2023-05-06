import 'package:flutter/material.dart';

import '../widgets/app_elevatedbutton.dart';
import '../widgets/app_textformfield.dart';

class ForgotPasswprdScreen extends StatefulWidget {
  const ForgotPasswprdScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswprdScreen> createState() => _ForgotPasswprdScreenState();
}

class _ForgotPasswprdScreenState extends State<ForgotPasswprdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: const Text("Forget Password?"),
        centerTitle: true,
        actions:  [
          Image.asset("assets/logo.PNG",scale: 5,),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Image.asset(
                  "assets/forgot_password.png",
                  scale: 2,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Center(
                child: const Text(
                  "Forgot\nPassword?",
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              const Text(
                "Don’t worry ! It happens. Please enter the phone number we will send the OTP in this phone number.",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                   ),
              ),

              const SizedBox(
                height: 40,
              ),
              AppTextFormField(
                  controller: TextEditingController(),
                  hintText: "Enter the phone number"),
              const SizedBox(
                height: 80,
              ),

              AppElevatedButton(
                text: "Continue",
                textColor: Colors.white,
                buttonColor: Colors.blue,
                onTap: () {
                },
              ),

            ],
          ),
        ),
      ),
    );

  }
}
