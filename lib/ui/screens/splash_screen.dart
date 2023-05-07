import 'package:feedapp/ui/widgets/app_elevatedbutton.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late double height;
  late double width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/splash_screen.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height * 0.12,),
            Image.asset("assets/logo.png",scale: 2,),
            SizedBox(height: height * 0.3,),
            const Text("Welcome!",style: TextStyle(fontSize: 32,color: Colors.white,fontWeight: FontWeight.w600),),
             SizedBox(height: height * 0.01,),
            const Text("Thanks for visit IP feed mobile app.\nBuy your desire things.",style: TextStyle(fontSize: 18,color: Colors.white),),
            SizedBox(height: height * 0.1,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: AppElevatedButton(text: "Cool, let's go", textColor: Colors.blue, buttonColor: Colors.white, onTap: (){}),
            ),
            SizedBox(height: height * 0.03,),
            const Text("Buy.Convince",style: TextStyle(fontSize: 32,color: Colors.white,fontWeight: FontWeight.w600),),
          ],
        ),
      ),

    );
  }
}
