import 'dart:async';
import 'dart:developer';

import 'package:feedapp/Data/number.dart';
import 'package:feedapp/ui/widgets/app_elevatedbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../Data/services/function/auth_functions.dart';
import '../../main.dart';
import '../utils/snakbar_message.dart';
import '../widgets/appbar_home_icon_button.dart';
import '../widgets/back_button.dart';

class VarificationScreen extends StatefulWidget {
  const VarificationScreen(
      {Key? key,
      required this.name,
      required this.mobile,
      required this.pass,
      required this.role})
      : super(key: key);

  final String role;
  final String name;
  final String mobile;
  final String pass;
  static String verifyId = "";

  @override
  State<VarificationScreen> createState() => _VarificationScreenState();
}

class _VarificationScreenState extends State<VarificationScreen> {
  late double height;
  late double width;
  bool inProgress = false;

  String role = '';
  String name = '';
  String mobile = '';
  String pass = '';
  String smsCode = "";
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    role = widget.role;
    name = widget.name;
    mobile = widget.mobile;
    pass = widget.pass;
    startTimer();
  }

  late Timer _timer;
  int _start = 120;

  void startTimer() {
    _start = 120;
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  phoneAuth() {
    try {
      _auth.verifyPhoneNumber(
        phoneNumber: MobileNumber.countryCode + MobileNumber.mobileNumber,
        timeout: const Duration(seconds: 120),
        verificationCompleted: (PhoneAuthCredential credential) {
          // var result = await _auth.signInWithCredential(credential);
          // User? user = result.user;
          // if(user != null)
          //   {
          //     Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotVarification(id: '')));
          //   }
        },
        verificationFailed: (FirebaseAuthException exception) {
          // print(exception);
        },
        codeSent: (String varificationId, int? resendToken) {
          VarificationScreen.verifyId = varificationId;
          startTimer();
        },
        codeAutoRetrievalTimeout: (String varificationId) {},
      );
    } catch (e) {
      log('Error: $e');
      showSnackBarMessage(context, 'Network error', Colors.red);
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const AppBarHomeIconButton(),
        title: const Text("Verification"),
        centerTitle: true,
        actions: const [
          AppBackButton(),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * .05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * .04,
              ),
              Image.asset(
                "assets/varification.png",
                scale: height * .004,
              ),
              SizedBox(
                height: height * .06,
              ),
              Text(
                "OTP VERIFICATION REGISTER",
                style: TextStyle(
                    fontSize: height * .03,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: height * .04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Enter the OTP sent to - ",
                    style: TextStyle(fontSize: height * .023),
                  ),
                  Text(
                    MobileNumber.countryCode + MobileNumber.mobileNumber,
                    style:
                        TextStyle(color: Colors.blue, fontSize: height * .023),
                  ),
                ],
              ),
              SizedBox(
                height: height * .04,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * .01),
                child: PinCodeTextField(
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.blue,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeColor: Colors.blue,
                    activeFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    selectedColor: Colors.blue,
                    inactiveColor: Colors.blue,
                    inactiveFillColor: Colors.white,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.white,
                  enableActiveFill: true,
                  onCompleted: (v) {},
                  onChanged: (value) {
                    setState(() {
                      smsCode = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                  appContext: context,
                ),
              ),
              SizedBox(
                height: height * .03,
              ),
              Text(
                _start.toString(),
                style: TextStyle(
                  fontSize: height * .024,
                  color: Colors.red,
                ),
              ),
              SizedBox(
                height: height * .04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t receive code ? ",
                    style: TextStyle(fontSize: height * .023),
                  ),
                  _start > 0
                      ? Text(
                          'Re-send',
                          style: TextStyle(
                              color: Colors.grey, fontSize: height * .023),
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              startTimer();
                            });
                          },
                          child: Text(
                            "Re-send",
                            style: TextStyle(
                                color: Colors.blue, fontSize: height * .023),
                          )),
                ],
              ),
              SizedBox(
                height: height * .1,
              ),
              AppElevatedButton(
                      text: "Submit",
                      textColor: Colors.white,
                      buttonColor: Colors.blue,
                      onTap: () async {

                        try {

                          if (smsCode.isEmpty) {
                            showSnackBarMessage(
                                context, "Please Enter OTP", Colors.red);
                          } else if (smsCode == '112233') {
                            // PhoneAuthCredential credential =
                            //      PhoneAuthProvider.credential(
                            //          verificationId: VarificationScreen.verifyId,
                            //          smsCode: smsCode);
                            // await auth.signInWithCredential(credential);
                            AuthServices.signupUser(role, name, mobile, pass,
                                MyApp.globalKey.currentContext!);
                          } else {
                            showSnackBarMessage(
                                context, "Wrong OTP", Colors.red);
                          }

                        } catch (e) {
                          showSnackBarMessage(context, "Wrong OTP", Colors.red);
                        }
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
