import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedapp/ui/screens/admin_dashboard.dart';
import 'package:feedapp/ui/screens/forgot_password_screen.dart';
import 'package:feedapp/ui/screens/register_screen.dart';
import 'package:feedapp/ui/screens/splash_screen.dart';
import 'package:feedapp/ui/widgets/app_elevatedbutton.dart';
import 'package:feedapp/ui/widgets/app_textformfield.dart';
import 'package:flutter/material.dart';
import '../../Data/network_utils.dart';
import '../../Data/services/function/auth_functions.dart';
import '../../Data/urls.dart';
import '../utils/snakbar_message.dart';
import '../widgets/appbar_home_icon_button.dart';
import '../widgets/appbar_logo.dart';
import 'employee_dashboard.dart';

const List<String> list = <String>['Admin', 'Employee'];

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);
  static String role = '';
  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  String _dropDownValue = list.first;
  late double height;
  late double width;

  bool isLogIn = false;

  TextEditingController mobileETController = TextEditingController();
  TextEditingController passETController = TextEditingController();

  List<dynamic> userList = [];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserInfo();
  }

  Future<void> getUserInfo() async {
    try {
      final respone = await NetworkUtils().getMethod(Urls.userInfoUrl);
      // print(respone);
      if (respone != null) {
        userList = respone;
      } else {}
    } catch (e) {
      //print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const SplashScreen()));
              },
              child: const Icon(Icons.home)),
          title: const Text("LogIn"),
          centerTitle: true,
          actions: [
            AppBarLogo(height: height),
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
                      "assets/login.png",
                      scale: height * 0.004,
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
                    height: height * .01,
                  ),
                  SizedBox(
                    height: height * 0.08,
                    child: AppTextFormField(
                        controller: mobileETController,
                        keyBoardType: TextInputType.phone,
                        onChanged: (value){
                          FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
                          firebaseFirestore.collection('users').get().then((doucment)
                          {
                            for(var docs in doucment.docs)
                            {
                              if(docs.get('mobile') == value)
                              {
                                LogInScreen.role = docs.get('role');
                                setState(() {});
                                print("role ajsdfnlaksdnfakjsdbnajjsdbfakjsdfnlaksdnfiajsdlasjkdnflkasdnflakjsdjfnalskjdnfaidff");
                                print(LogInScreen.role);
                                break;
                              }
                            }
                          }
                          );
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
                        hintText: "Enter your phone number"),
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  SizedBox(
                    height: height * 0.08,
                    child: AppTextFormField(
                        controller: passETController,
                        keyBoardType: TextInputType.phone,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return "Enter password more than 6 letter";
                          }
                          if ((value?.length ?? 0) < 6) {
                            return "Enter password more than 6 letter";
                          }
                          return null;
                        },
                        obscure: true,
                        hintText: "Password"),
                  ),
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
                    height: height * .03,
                  ),
                  AppElevatedButton(
                    bottomPadding: height * 0.01,
                    topPadding: height * 0.01,
                    text: "Login",
                    textColor: Colors.white,
                    buttonColor: Colors.blue,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {

                        if(LogInScreen.role == _dropDownValue)
                          {
                            AuthServices.signinUser(mobileETController.text, passETController.text,_dropDownValue, context);
                          }
                        else
                          {
                            showSnackBarMessage(context, 'You are not $_dropDownValue',Colors.red);
                          }

                      }
                    },
                  ),
                  SizedBox(
                    height: height * .05,
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
                  SizedBox(
                    height: height * .02,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
