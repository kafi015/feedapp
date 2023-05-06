import 'package:feedapp/ui/screens/register_screen.dart';
import 'package:feedapp/ui/widgets/app_elevatedbutton.dart';
import 'package:feedapp/ui/widgets/app_textformfield.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: const Text("LogIn"),
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
              Center(
                child: Image.asset(
                  "assets/register.PNG",
                  scale: 2,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              const Text(
                "LogIn Details",
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
                  hintText: "role, create dropdown"),
              const SizedBox(
                height: 16,
              ),
              AppTextFormField(
                  controller: TextEditingController(),
                  hintText: "Enter your phone number"),
              const SizedBox(
                height: 12,
              ),
              AppTextFormField(
                  controller: TextEditingController(),
                  hintText: "Password"),
              const SizedBox(
                height: 16,
              ),
              Container(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: (){

                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),

              AppElevatedButton(
                text: "Login",
                textColor: Colors.white,
                buttonColor: Colors.blue,
                onTap: () {
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don’t have any account? ",style: TextStyle(fontSize: 18),),
                  InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const RegistrationScreen()));

                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(color: Colors.blue,fontSize: 18),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );

  }
}
