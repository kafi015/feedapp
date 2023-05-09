import 'package:feedapp/ui/screens/login_screen.dart';
import 'package:feedapp/ui/widgets/appbar_logo.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar_home_icon_button.dart';

class PassChangeMessage extends StatelessWidget {
  const PassChangeMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const AppBarHomeIconButton(),
        title: const Text("Password Change"),
        centerTitle: true,
        actions: [
          AppBarLogo(height: height),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(child: Image.asset("assets/pass_change_message.png")),
            SizedBox(
              height: height * 0.08,
            ),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LogInScreen()));
                },
                child: Text(
                  "Login to your account",
                  style:
                      TextStyle(color: Colors.blue, fontSize: height * 0.032),
                )),
          ],
        ),
      ),
    );
  }
}
