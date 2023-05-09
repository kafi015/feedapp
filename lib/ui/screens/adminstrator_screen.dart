import 'package:feedapp/ui/screens/price_change_screen.dart';
import 'package:feedapp/ui/screens/sell%20info%20screen/sell_info_due_check_screen.dart';
import 'package:feedapp/ui/widgets/app_elevatedbutton.dart';
import 'package:flutter/material.dart';
import '../widgets/appbar_logo.dart';
import '../widgets/dashboard_button.dart';
import 'dashboard.dart';

class AdminstratorScreen extends StatefulWidget {
  const AdminstratorScreen({Key? key}) : super(key: key);

  @override
  State<AdminstratorScreen> createState() => _AdminstratorScreenState();
}

class _AdminstratorScreenState extends State<AdminstratorScreen> {
  late double height;
  late double width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: AppBarLogo(height: height),
        title: const Text("Adminstrator"),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios),
          ),
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.08,
            ),
            DashboardButton(text: 'দাম পরিবর্তন', onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const PriceChangeScreen()));

            },),
            SizedBox(
              height: height * 0.08,
            ),
            DashboardButton(text: 'বেচা-কেনার তথ্য', onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const SellInfoDueCheckScreen()));
            },),
            SizedBox(
              height: height * 0.4,
            ),
            AppElevatedButton(text: "Back to Home", textColor: Colors.white, buttonColor: Colors.blue, onTap: (){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const Dashboard()), (route) => false);

            }),

          ],
        ),
      ),
    );
  }
}
