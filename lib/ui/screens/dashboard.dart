import 'package:feedapp/ui/screens/login_screen.dart';
import 'package:feedapp/ui/screens/sell%20info%20screen/client_list_screen.dart';
import 'package:feedapp/ui/screens/sell%20info%20screen/enter_sell_info.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar_logo.dart';
import '../widgets/dashboard_button.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
        title: const Text("Dashboard"),
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.08,
            ),
            DashboardButton(text: 'Adminstrator', onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const LogInScreen()));
            },),
            SizedBox(
              height: height * 0.08,
            ),
            DashboardButton(text: 'দাম পরিবর্তন', onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const LogInScreen()));

            },),
            SizedBox(
              height: height * 0.08,
            ),
            DashboardButton(text: 'বেচা-কেনার তথ্য', onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const EnterSellInfoScreen()));

            },),
            SizedBox(
              height: height * 0.08,
            ),
            DashboardButton(text: 'ক্রেতার তথ্য', onTap: () {
            //  Navigator.push(context, MaterialPageRoute(builder: (context)=> const LogInScreen()));
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const ClientListScreen()));

            },),
          ],
        ),
      ),
    );
  }
}


