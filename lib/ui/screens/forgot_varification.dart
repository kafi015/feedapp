import 'package:feedapp/ui/screens/set_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../widgets/app_elevatedbutton.dart';
import '../widgets/appbar_home_icon_button.dart';

class ForgotVarification extends StatefulWidget {
  const ForgotVarification({Key? key, required this.mobileNumber}) : super(key: key);

  final String mobileNumber;

  @override
  State<ForgotVarification> createState() => _ForgotVarificationState();
}

class _ForgotVarificationState extends State<ForgotVarification> {
  late double height;
  late double width;
  String mobileNumber = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mobileNumber = widget.mobileNumber;
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * .04,
              ),
              Image.asset(
                "assets/varification.png",
                scale: height * .002,
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
                    " +8801234567890",
                    style:
                        TextStyle(color: Colors.blue, fontSize: height * .023),
                  ),
                ],
              ),
              SizedBox(
                height: height * .04,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * .13),
                child: PinCodeTextField(
                  cursorColor: Colors.blue,
                  length: 4,
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
                    setState(() {});
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
                "00:120 Sec",
                style: TextStyle(
                  fontSize: height * .022,
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
                  InkWell(
                      onTap: () {},
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
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  SetPasswordScreen(mobileNumber: mobileNumber,)));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
