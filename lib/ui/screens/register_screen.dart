import 'package:feedapp/ui/widgets/app_elevatedbutton.dart';
import 'package:feedapp/ui/widgets/app_textformfield.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: const Text("Register"),
        centerTitle: true,
        actions: const [
          Icon(Icons.arrow_back_ios),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/register.PNG",
              scale: 2,
            ),
            const SizedBox(
              height: 18,
            ),
            const Text(
              "Welcome Onboard!",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 16,
            ),
            AppTextFormField(
                controller: TextEditingController(),
                hintText: "Enter your name"),
            const SizedBox(
              height: 12,
            ),
            AppTextFormField(
                controller: TextEditingController(),
                hintText: "Enter your mobile"),
            const SizedBox(
              height: 12,
            ),
            AppTextFormField(
                controller: TextEditingController(), hintText: "Password"),
            const SizedBox(
              height: 12,
            ),
            AppTextFormField(
                controller: TextEditingController(),
                hintText: "Confirm password"),
            const SizedBox(
              height: 22,
            ),
            AppElevatedButton(
              text: "Register",
              textColor: Colors.white,
              buttonColor: Colors.blue,
              onTap: () {},
            ),
            const SizedBox(
              height: 22,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account ? "),
                InkWell(
                    onTap: () {},
                    child: const Text(
                      "Sign In",
                      style: TextStyle(color: Colors.blue),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
