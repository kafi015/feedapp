import 'package:feedapp/ui/widgets/app_elevatedbutton.dart';
import 'package:feedapp/ui/widgets/app_textformfield.dart';
import 'package:feedapp/ui/widgets/appbar_home_icon_button.dart';
import 'package:flutter/material.dart';

import '../../widgets/enter_sell_info_text.dart';

class EnterSellInfoScreen extends StatefulWidget {
  const EnterSellInfoScreen({Key? key}) : super(key: key);

  @override
  State<EnterSellInfoScreen> createState() => _EnterSellInfoScreenState();
}

class _EnterSellInfoScreenState extends State<EnterSellInfoScreen> {
  late double height;
  late double width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: const AppBarHomeIconButton(),
        title: const Text("Sell info"),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: width * 0.05, right: width * 0.05, top: height * 0.02),
              padding: EdgeInsets.only(
                  left: width * 0.02, right: width * 0.02, top: height * 0.02),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 1),
                borderRadius: BorderRadius.circular(34.0),
              ),
              child: Column(
                children: [
                  EnterSellInfoText(
                    width: width,
                    height: height,
                    textEnglish: 'Date',
                    textBangla: 'দিন',
                  ),
                  AppTextFormField(
                      controller: TextEditingController(), hintText: "Enter date"),
                  const SizedBox(
                    height: 10,
                  ),
                  EnterSellInfoText(
                    width: width,
                    height: height,
                    textEnglish: 'Customer Name',
                    textBangla: 'ক্রেতার নাম',
                  ),
                  AppTextFormField(
                      controller: TextEditingController(), hintText: "Enter name"),
                  const SizedBox(
                    height: 10,
                  ),
                  EnterSellInfoText(
                    width: width,
                    height: height,
                    textEnglish: 'Total Amount',
                    textBangla: 'মোট মূল্য',
                  ),
                  AppTextFormField(
                      controller: TextEditingController(),
                      hintText: "Enter amount"),
                  const SizedBox(
                    height: 10,
                  ),
                  EnterSellInfoText(
                    width: width,
                    height: height,
                    textEnglish: 'Paid Amount',
                    textBangla: 'পরিশোধ করেছেন',
                  ),
                  AppTextFormField(
                      controller: TextEditingController(),
                      hintText: "Enter paid amount"),
                  const SizedBox(
                    height: 10,
                  ),
                  EnterSellInfoText(
                    width: width,
                    height: height,
                    textEnglish: 'Due Amount',
                    textBangla: 'বাকি রয়েছে',
                  ),
                  AppTextFormField(
                      controller: TextEditingController(),
                      hintText: "Enter due amount"),
                  const SizedBox(
                    height: 10,
                  ),
                  EnterSellInfoText(
                    width: width,
                    height: height,
                    textEnglish: 'Note',
                    textBangla: 'কবে পরিশোধ করবেন?',
                  ),
                  AppTextFormField(
                      controller: TextEditingController(), hintText: "Enter note"),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            SizedBox(height: height *0.05,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: AppElevatedButton(text: "Submit", textColor: Colors.white, buttonColor: Colors.blue, onTap: (){}),
            ),
          ],
        ),
      ),
    );
  }
}
