import 'package:feedapp/ui/screens/pass_change_message.dart';
import 'package:feedapp/ui/widgets/appbar_logo.dart';
import 'package:flutter/material.dart';

import '../widgets/app_elevatedbutton.dart';
import '../widgets/app_textformfield.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
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
        title: const Text("Verification"),
        centerTitle: true,
        actions:  [
          AppBarLogo(height: height)
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               SizedBox(
                height:  height* .04,
              ),
              Center(
                child: Image.asset(
                  "assets/varification.png",
                  scale:  height* .002,
                ),
              ),
              SizedBox(
                height:  height* .08,
              ),
               Padding(
                padding: EdgeInsets.only(left:  width* .04),
                child: Text(
                  "New Password",
                  style: TextStyle(
                      fontSize:  height* .023,
                      color: Colors.grey,
                  ),
                ),
              ),
               SizedBox(
                height:  height* .01,
              ),
              AppTextFormField(
                  controller: TextEditingController(),
                  hintText: "New Password"),

               SizedBox(
                height:  height* .04,
              ),

               Padding(
                padding: EdgeInsets.only(left:  width* .04),
                child: Text(
                  "Confirm Password",
                  style: TextStyle(
                      fontSize:  height* .023,
                      color: Colors.grey,
                  ),
                ),
              ),
               SizedBox(
                height:  height* .01,
              ),
              AppTextFormField(
                  controller: TextEditingController(),
                  hintText: "Confirm Password"),

               SizedBox(
                height:  height* .12,
              ),


              AppElevatedButton(
                text: "Submit",
                textColor: Colors.white,
                buttonColor: Colors.blue,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const PassChangeMessage()));
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
