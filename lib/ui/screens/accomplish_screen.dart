import 'package:flutter/material.dart';

class AccomplishScreen extends StatelessWidget {
  const AccomplishScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: const Text("Accomplish"),
        centerTitle: true,
        actions:  [
          Image.asset("assets/logo.PNG",scale: 5,),
        ],
      ),



      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Image.asset("assets/success_message.PNG"),
            ),
            SizedBox(height: 60,),
            InkWell(
                onTap: () {},
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
