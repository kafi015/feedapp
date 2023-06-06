import 'package:feedapp/Data/network_utils.dart';
import 'package:feedapp/ui/screens/accomplish_screen.dart';
import 'package:feedapp/ui/widgets/app_elevatedbutton.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../Data/services/function/auth_functions.dart';
import '../../Data/urls.dart';
import '../utils/snakbar_message.dart';
import '../widgets/appbar_home_icon_button.dart';

class VarificationScreen extends StatefulWidget {
  const VarificationScreen({Key? key, required this.name, required this.mobile, required this.pass, required this.role}) : super(key: key);

  final String role;
  final String name;
  final String mobile;
  final String pass;

  @override
  State<VarificationScreen> createState() => _VarificationScreenState();
}

class _VarificationScreenState extends State<VarificationScreen> {
  late double height;
  late double width;

   String role = '';
   String name = '';
   String mobile = '';
   String pass = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    role = widget.role;
    name = widget.name;
    mobile = widget.mobile;
    pass = widget.pass;
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
                onTap: () async{
                  AuthServices.signupUser(
                      role, name, mobile, pass, context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
