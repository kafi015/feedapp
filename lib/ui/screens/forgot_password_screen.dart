import 'package:feedapp/Data/number.dart';
import 'package:feedapp/ui/screens/forgot_varification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Data/network_utils.dart';
import '../../Data/urls.dart';
import '../utils/snakbar_message.dart';
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

  TextEditingController mobileETController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<dynamic> userList = [];
  bool isNumberExist = false;

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

  final FirebaseAuth _auth = FirebaseAuth.instance;

  phoneAuth(String userId) {
    _auth.verifyPhoneNumber(
      phoneNumber: MobileNumber.countryCode + MobileNumber.mobileNumber,
        timeout: const Duration(seconds: 120),
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
        ForgotVarification.verifyId = varificationId;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ForgotVarification(id: userId,)));
        },
        codeAutoRetrievalTimeout: (String varificationId){

    },
    );
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery
        .of(context)
        .size
        .height;
    width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: AppBarLogo(height: height),
        title: const Text("Forget Password ?"),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * .04,
                ),
                Center(
                  child: Image.asset(
                    "assets/forgot_password.png",
                    scale: height * .004,
                  ),
                ),
                SizedBox(
                  height: height * .04,
                ),
                Center(
                  child: Text(
                    "Forgot\nPassword?",
                    style: TextStyle(
                        fontSize: height * .04,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: height * .04,
                ),
                Text(
                  "Don’t worry ! It happens. Please enter the phone number we will send the OTP in this phone number.",
                  style: TextStyle(
                    fontSize: height * .021,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: height * .04,
                ),
                SizedBox(
                  height: height * 0.08,
                  child: AppTextFormField(
                      controller: mobileETController,
                      keyBoardType: TextInputType.phone,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Enter your mobile number";
                        }
                        if (value!.length < 11) {
                          return "Mobile number must be 11 digit";
                        }
                        if (value.length > 11) {
                          return "Mobile number must be 11 digit";
                        }
                        return null;
                      },
                      hintText: "Enter the phone number"),
                ),
                SizedBox(
                  height: height * .1,
                ),
                AppElevatedButton(
                  text: "Continue",
                  textColor: Colors.white,
                  buttonColor: Colors.blue,
                  onTap: () {


                    if (_formKey.currentState!.validate()) {
                      if (userList.isNotEmpty) {
                        for (var item in userList) {
                          if (mobileETController.text == item['number']) {

                            phoneAuth(item['_id']);

                            isNumberExist = true;
                            break;
                          }
                        }
                        if (!isNumberExist) {
                          showSnackBarMessage(
                              context, "Number doesn't exist.", Colors.red);
                        }
                      }
                      else {
                        showSnackBarMessage(
                            context, "Please Check your internet connection",
                            Colors.red);
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
