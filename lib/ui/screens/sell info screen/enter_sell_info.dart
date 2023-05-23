import 'package:feedapp/ui/widgets/app_elevatedbutton.dart';
import 'package:feedapp/ui/widgets/app_textformfield.dart';
import 'package:feedapp/ui/widgets/appbar_home_icon_button.dart';
import 'package:flutter/material.dart';

import '../../../Data/network_utils.dart';
import '../../../Data/urls.dart';
import '../../utils/snakbar_message.dart';
import '../../widgets/enter_sell_info_text.dart';

class EnterSellInfoScreen extends StatefulWidget {
  const EnterSellInfoScreen({Key? key}) : super(key: key);

  @override
  State<EnterSellInfoScreen> createState() => _EnterSellInfoScreenState();
}

class _EnterSellInfoScreenState extends State<EnterSellInfoScreen> {
  late double height;
  late double width;

  TextEditingController cutomerNameEtController = TextEditingController();
  TextEditingController totalAmountEtController = TextEditingController();
  TextEditingController paidAmountEtController = TextEditingController();
  TextEditingController dueAmountEtController = TextEditingController();
  TextEditingController noteEtController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();
  String date = '';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2020, 8),
        lastDate: DateTime(2101));

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        date = "${selectedDate.toLocal()}".split(' ')[0];
      });
    }
  }

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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: width * 0.05,
                    right: width * 0.05,
                    top: height * 0.02),
                padding: EdgeInsets.only(
                    left: width * 0.02,
                    right: width * 0.02,
                    top: height * 0.02),
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
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton.icon(
                        icon: const Icon(
                          Icons.calendar_month,
                          color: Colors.blue,
                        ),
                        label: Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, bottom: 10, right: 50, left: 50),
                          child: Text(
                            "${selectedDate.toLocal()}".split(' ')[0],
                            style: const TextStyle(
                                fontSize: 24, color: Colors.grey),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          side: const BorderSide(width: 1, color: Colors.blue),
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () => _selectDate(context),
                      ),
                    ),
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
                      controller: cutomerNameEtController,
                      hintText: "Enter name",
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Enter customer name";
                        }
                        return null;
                      },
                    ),
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
                      controller: totalAmountEtController,
                      hintText: "Enter amount",
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Enter total amount";
                        }
                        return null;
                      },
                    ),
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
                      controller: paidAmountEtController,
                      hintText: "Enter paid amount",
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Enter paid amount";
                        }
                        return null;
                      },
                    ),
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
                      controller: dueAmountEtController,
                      hintText: "Enter due amount",
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Enter due amount";
                        }
                        return null;
                      },
                    ),
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
                      controller: noteEtController,
                      hintText: "Enter note",
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Enter your note";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: AppElevatedButton(
                    text: "Submit",
                    textColor: Colors.white,
                    buttonColor: Colors.blue,
                    onTap: () async {

                      if (_formKey.currentState!.validate()) {
                        final result = await NetworkUtils()
                            .postMethod(Urls.customerInfoUrl, body: {
                          "date": "${selectedDate.toLocal()}".split(' ')[0],
                          "name": cutomerNameEtController.text,
                          "total": totalAmountEtController.text,
                          "paid": paidAmountEtController.text,
                          "due": dueAmountEtController.text,
                          "note": noteEtController.text
                        });

                        if (result != null) {
                          cutomerNameEtController.clear();
                          totalAmountEtController.clear();
                          paidAmountEtController.clear();
                          dueAmountEtController.clear();
                          noteEtController.clear();
                          selectedDate = DateTime.now();
                          setState(() {

                          });
                          showSnackBarMessage(context,
                              "Customer Information  Saved!", Colors.blue);
                        } else {
                          showSnackBarMessage(context,
                              "Failed to save customer information! Try again.", Colors.red);
                        }
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
