import 'package:feedapp/ui/screens/set_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../widgets/app_elevatedbutton.dart';

class ForgotVarification extends StatefulWidget {
  const ForgotVarification({Key? key}) : super(key: key);

  @override
  State<ForgotVarification> createState() => _ForgotVarificationState();
}

class _ForgotVarificationState extends State<ForgotVarification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: const Text("Verification"),
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
              const SizedBox(height: 10,),
              Image.asset(
                "assets/varification.png",
                scale: 2,
              ),
              const SizedBox(
                height: 28,
              ),
              const Text(
                "OTP VERIFICATION REGISTER",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Enter the OTP sent to - ",style: TextStyle(fontSize: 18),),
                  Text(
                    " +8801234567890",
                    style: TextStyle(color: Colors.blue,fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
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
                  onCompleted: (v) {
                  },
                  onChanged: (value) {
                    setState(() {

                    });
                  },
                  beforeTextPaste: (text) {
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  }, appContext: context,
                ),
              ),

              const SizedBox(
                height: 16,
              ),
              const Text(
                "00:120 Sec",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don’t receive code ? ",style: TextStyle(fontSize: 18),),
                  InkWell(
                      onTap: () {},
                      child: const Text(
                        "Re-send",
                        style: TextStyle(color: Colors.blue,fontSize: 18),
                      )),
                ],
              ),
              const SizedBox(
                height: 150,
              ),


              AppElevatedButton(
                text: "Submit",
                textColor: Colors.white,
                buttonColor: Colors.blue,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const SetPasswordScreen()));

                },
              ),

            ],
          ),
        ),
      ),
    );

  }
}
