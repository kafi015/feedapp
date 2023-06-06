import 'package:feedapp/ui/screens/login_screen.dart';
import 'package:feedapp/ui/screens/varification_screen.dart';
import 'package:feedapp/ui/widgets/app_elevatedbutton.dart';
import 'package:feedapp/ui/widgets/app_textformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../Data/number.dart';
import '../widgets/appbar_home_icon_button.dart';

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

  TextEditingController nameETController = TextEditingController();
  TextEditingController emailETController = TextEditingController();
  TextEditingController passETController = TextEditingController();
  TextEditingController confirmPassETController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  phoneAuth() {
    _auth.verifyPhoneNumber(
      phoneNumber: MobileNumber.countryCode + MobileNumber.mobileNumber,
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
        VarificationScreen.verifyId = varificationId;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VarificationScreen(
                    role: _dropDownValue,
                    name: nameETController.text,
                    mobile: emailETController.text,
                    pass: passETController.text)));
      },
      codeAutoRetrievalTimeout: (String varificationId){

      },
    );
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const AppBarHomeIconButton(),
        title: const Text("Register"),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * .02,
                ),
                Image.asset(
                  "assets/register.png",
                  scale: height * 0.004,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Welcome Onboard!",
                  style: TextStyle(
                      fontSize: height * .035,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: height * .03,
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
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: height * .013,
                ),
                SizedBox(
                  height: height * 0.08,

                  child: AppTextFormField(
                    controller: nameETController,
                    hintText: "Enter your name",
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Enter your name";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height * .013,
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
                      hintText: "Enter your email"),
                ),
                SizedBox(
                  height: height * .013,
                ),
                SizedBox(
                  height: height * 0.08,

                  child: AppTextFormField(
                    controller: passETController,
                    hintText: "Password",
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Enter password more than 6 letter";
                      }
                      if ((value?.length ?? 0) < 6) {
                        return "Enter password more than 6 letter";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height * .013,
                ),
                SizedBox(
                  height: height * 0.08,

                  child: AppTextFormField(
                      controller: confirmPassETController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Enter password more than 6 letter";
                        }
                        if (passETController.text !=
                            confirmPassETController.text) {
                          return "Password does not match!";
                        }
                        return null;
                      },
                      hintText: "Confirm password"),
                ),
                SizedBox(
                  height: height * .04,
                ),
                AppElevatedButton(
                  text: "Register",
                  textColor: Colors.white,
                  buttonColor: Colors.blue,
                  onTap: () async {
                    //_formKey.currentState!.validate()
                    if (_formKey.currentState!.validate()) {
                      phoneAuth();
                    }
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.05,bottom: height * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account ? ",
                        style: TextStyle(fontSize: height * 0.023),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LogInScreen()));
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                color: Colors.blue, fontSize: height * 0.023),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
