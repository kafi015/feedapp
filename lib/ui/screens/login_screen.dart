import 'package:feedapp/ui/screens/forgot_password_screen.dart';
import 'package:feedapp/ui/screens/register_screen.dart';
import 'package:feedapp/ui/widgets/app_elevatedbutton.dart';
import 'package:feedapp/ui/widgets/app_textformfield.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>['Admin', 'Employee'];


class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {

  String _dropDownValue = list.first;
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
        title: const Text("LogIn"),
        centerTitle: true,
        actions: [
          Image.asset(
            "assets/logo.png",
            scale: height/200,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * .05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               SizedBox(
                height: height* .04,
              ),
              Center(
                child: Image.asset(
                  "assets/login.png",
                  scale: height* 0.002,
                ),
              ),
               SizedBox(
                height: height* .06,
              ),
               Text(
                "\t\tLogIn Details",
                style: TextStyle(
                    fontSize: height* .03,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
               SizedBox(
                height: height* .04,
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
                        child: Text("\t\t\t$value",style:  TextStyle(fontSize: height* .025,fontWeight: FontWeight.w600),),
                      );
                    }).toList(),
                ),
              ),
               SizedBox(
                height: height* .02,
              ),

              AppTextFormField(
                  controller: TextEditingController(),
                  hintText: "Enter your phone number"),
              SizedBox(
                height: height* .02,
              ),
              AppTextFormField(
                  controller: TextEditingController(), hintText: "Password"),
              SizedBox(
                height: height* .04,
              ),
              Container(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ForgotPasswprdScreen()));
                  },
                  child:  Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.blueGrey, fontSize: height* .022),
                  ),
                ),
              ),
               SizedBox(
                height: height* .04,
              ),
              AppElevatedButton(
                text: "Login",
                textColor: Colors.white,
                buttonColor: Colors.blue,
                onTap: () {},
              ),
               SizedBox(
                height: height* .07,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don’t have any account? ",
                    style: TextStyle(fontSize: 18),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const RegistrationScreen()));
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(color: Colors.blue, fontSize: 18),
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
