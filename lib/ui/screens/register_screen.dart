import 'package:feedapp/ui/screens/login_screen.dart';
import 'package:feedapp/ui/screens/varification_screen.dart';
import 'package:feedapp/ui/widgets/app_elevatedbutton.dart';
import 'package:feedapp/ui/widgets/app_textformfield.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>['Admin', 'Employee'];

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {


  String _dropDownValue = list.first;

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                "assets/register.png",
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: DropdownButton<String>(
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  underline: Container(
                    height: 2,
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.circular(34.5),
                  isExpanded: true,
                  value: _dropDownValue,
                  onChanged: (String? value) async {

                    setState(() {
                      _dropDownValue = value!.trim();
                    });
                  },

                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text("\t\t\t"+value,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                    );
                  }).toList(),
                ),
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
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VarificationScreen()));
                },
              ),
              const SizedBox(
                height: 22,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account ? ",style: TextStyle(fontSize: 18),),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LogInScreen()));
                      },
                      child: const Text(
                        "Sign In",
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
