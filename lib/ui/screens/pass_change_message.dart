import 'package:feedapp/ui/screens/login_screen.dart';
import 'package:flutter/material.dart';

class PassChangeMessage extends StatelessWidget {
  const PassChangeMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: const Text("Password Change"),
        centerTitle: true,
        actions:  [
          Image.asset("assets/logo.png",scale: 5,),
        ],
      ),



      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(child: Image.asset("assets/pass_change_message.png")),
            const SizedBox(height: 60,),
            InkWell(
                onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>const LogInScreen()));
                },
                child: const Text(
                  "Login to your account",
                  style: TextStyle(color: Colors.blue,fontSize: 24),
                )),
          ],
        ),
      ),
    );
  }
}
