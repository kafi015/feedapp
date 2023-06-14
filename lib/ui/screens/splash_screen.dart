import 'package:feedapp/ui/screens/login_screen.dart';
import 'package:feedapp/ui/widgets/app_elevatedbutton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage("assets/splash_screen.png"),
          //     fit: BoxFit.fill,
          //   ),
          // ),
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                  child: Image.asset(
                "assets/splash/background.png",
                fit: BoxFit.fitWidth,
              )),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: width * 0.65,
                  child: Image.asset(
                    "assets/splash/pen tool.png",
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: height * 0.2,
                child: Image.asset(
                  "assets/splash/Ellipse 4.png",
                  scale: width*0.0025,
                ),
              ),
              Positioned(
                left: 0,
                top: height * 0.25,
                child: RotationTransition(
                  turns: const AlwaysStoppedAnimation(0.5),
                  child: Image.asset(
                    "assets/splash/Ellipse 4.png",
                    scale: width*0.004,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: height * 0.40,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/splash/Ellipse 2.png"),
                      fit: BoxFit.fill,
                    ),
              ),
              ),
              Image.asset(
                "assets/splash/Ellipse 3.png",
                fit: BoxFit.fitWidth,
                scale: width * 0.003,
              ),
              Positioned(
                left: width * 0.10,
                top:  height * 0.07,
                child: Image.asset(
                  "assets/splash/Ellipse 8.png",
                  fit: BoxFit.fitWidth,
                  scale: width * 0.002,
                ),
              ),
              Positioned(
                right: width * 0.10,
                top:  height * 0.09,
                child: Image.asset(
                  "assets/splash/Ellipse 9.png",
                  fit: BoxFit.fitWidth,
                 // scale: width * 0.002,
                ),
              ),
              Positioned(
                right: width * 0.37,
                top:  height * 0.20,
                child: Image.asset(
                  "assets/splash/ipfeed-logo 1.png",
                  fit: BoxFit.fitWidth,
                 // scale: width * 0.002,
                ),
              ),
              Positioned(
                right: width * 0.445,
                top:  height * 0.45,
                child: Image.asset(
                  "assets/splash/Ellipse 6.png",
                  fit: BoxFit.fitWidth,
                 // scale: width * 0.002,
                ),
              ),
              Positioned(
                left: width * 0.18,
                top:  height * 0.53,
                child: Image.asset(
                  "assets/splash/Ellipse 7.png",
                  fit: BoxFit.fitWidth,
                 // scale: width * 0.002,
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.6,
                  ),
                  Text(
                    "Welcome!",
                    style: TextStyle(
                        fontSize: height * 0.05,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: height * 0.008,
                  ),
                  Text(
                    "Thanks for visit IP feed mobile app.\nBuy your desire things.",
                    style: GoogleFonts.cormorant(
                        fontSize: height * 0.02, color: Colors.white,
                        fontWeight: FontWeight.w300
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: AppElevatedButton(
                        bottomPadding: 15,
                        topPadding: 15,
                        text: "Cool, let's go",
                        textColor: Colors.blue,
                        buttonColor: Colors.white,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LogInScreen()));
                        }),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Text(
                    "Buy.Convince",
                    style: TextStyle(
                        fontSize: height * 0.038,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                ],
              ),

            ],
          ),

        ),
      ),
    );
  }
}
