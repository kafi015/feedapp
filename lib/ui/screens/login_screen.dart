import 'package:feedapp/ui/screens/admin_dashboard.dart';
import 'package:feedapp/ui/screens/forgot_password_screen.dart';
import 'package:feedapp/ui/screens/register_screen.dart';
import 'package:feedapp/ui/widgets/app_elevatedbutton.dart';
import 'package:feedapp/ui/widgets/app_textformfield.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar_home_icon_button.dart';
import '../widgets/appbar_logo.dart';
import 'employee_dashboard.dart';

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

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: const AppBarHomeIconButton(),
          title: const Text("LogIn"),
          centerTitle: true,
          actions: [
            AppBarLogo(height: height),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .05),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * .04,
                ),
                Center(
                  child: Image.asset(
                    "assets/login.png",
                    scale: height * 0.003,
                  ),
                ),
                SizedBox(
                  height: height * .06,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "LogIn Details",
                    style: TextStyle(
                        fontSize: height * .03,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: height * .04,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * .05),
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
                          child: Text(
                            value,
                            style: TextStyle(
                                fontSize: height * .025,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: height * .02,
                ),
                AppTextFormField(
                    controller: TextEditingController(),
                    hintText: "Enter your phone number"),
                SizedBox(
                  height: height * .02,
                ),
                AppTextFormField(
                    controller: TextEditingController(), hintText: "Password"),
                SizedBox(
                  height: height * .04,
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
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: Colors.blueGrey, fontSize: height * .022),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .04,
                ),
                AppElevatedButton(
                  text: "Login",
                  textColor: Colors.white,
                  buttonColor: Colors.blue,
                  onTap: () {
                    if (_dropDownValue == "Admin") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AdminDashboard()));
                    } else if (_dropDownValue == "Employee") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EmployeeDashboard()));
                    }
                  },
                ),
                SizedBox(
                  height: height * .07,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have any account? ",
                      style: TextStyle(fontSize: height * 0.023),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RegistrationScreen()));
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                              color: Colors.blue, fontSize: height * 0.023),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
