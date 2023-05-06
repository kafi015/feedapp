import 'package:feedapp/ui/screens/pass_change_message.dart';
import 'package:flutter/material.dart';

import '../widgets/app_elevatedbutton.dart';
import '../widgets/app_textformfield.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: const Text("Verification"),
        centerTitle: true,
        actions:  [
          Image.asset("assets/logo.png",scale: 5,),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Image.asset(
                  "assets/varification.png",
                  scale: 2,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  "New Password",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              AppTextFormField(
                  controller: TextEditingController(),
                  hintText: "New Password"),

              const SizedBox(
                height: 30,
              ),

              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  "Confirm Password",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              AppTextFormField(
                  controller: TextEditingController(),
                  hintText: "Confirm Password"),

              const SizedBox(
                height: 150,
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
