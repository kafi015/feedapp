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
        title: Text("Dashboard"),
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.08,
            ),
            DashboardButton(text: 'Adminstrator', onTap: () {},),
            SizedBox(
              height: height * 0.08,
            ),
            DashboardButton(text: 'দাম পরিবর্তন', onTap: () {},),
            SizedBox(
              height: height * 0.08,
            ),
            DashboardButton(text: 'বেচা-কেনার তথ্য', onTap: () {},),
            SizedBox(
              height: height * 0.08,
            ),
            DashboardButton(text: 'ক্রেতার তথ্য', onTap: () {},),
          ],
        ),
      ),
    );
  }
}


