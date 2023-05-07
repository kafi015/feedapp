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
        title: const Text("Register"),
        centerTitle: true,
        actions:  [
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios),
          ),
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width * .05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               SizedBox(
                height: height* .04,
              ),
              Image.asset(
                "assets/register.png",
                scale: height* 0.002,
              ),
              const SizedBox(
                height: 18,
              ),
               Text(
                "Welcome Onboard!",
                style: TextStyle(
                    fontSize: height* .035,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
               SizedBox(
                height: height* .04,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: width* .05),
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
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(value,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                      ),
                    );
                  }).toList(),
                ),
              ),
               SizedBox(
                height: height* .013,
              ),
              AppTextFormField(
                  controller: TextEditingController(),
                  hintText: "Enter your name"),
              SizedBox(
                height: height* .013,
              ),
              AppTextFormField(
                  controller: TextEditingController(),
                  hintText: "Enter your mobile"),
              SizedBox(
                height: height* .013,
              ),
              AppTextFormField(
                  controller: TextEditingController(), hintText: "Password"),
              SizedBox(
                height: height* .013,
              ),
              AppTextFormField(
                  controller: TextEditingController(),
                  hintText: "Confirm password"),
              SizedBox(
                height: height* .04,
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
               SizedBox(
                height: height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text("Already have an account ? ",style: TextStyle(fontSize: height*0.023),),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LogInScreen()));
                      },
                      child:  Text(
                        "Sign In",
                        style: TextStyle(color: Colors.blue,fontSize: height*0.023),
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
