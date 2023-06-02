
import 'package:flutter/material.dart';

import '../../../Data/models/customer_info_model.dart';
import '../../../Data/network_utils.dart';
import '../../../Data/urls.dart';
import '../../utils/snakbar_message.dart';
import '../../widgets/app_elevatedbutton.dart';
import '../../widgets/app_textformfield.dart';
import '../../widgets/appbar_home_icon_button.dart';
import '../../widgets/enter_sell_info_text.dart';

class CustomerInfoUpdateScreen extends StatefulWidget {
  const CustomerInfoUpdateScreen({Key? key, required this.customerId})
      : super(key: key);

  final String customerId;

  @override
  State<CustomerInfoUpdateScreen> createState() =>
      _CustomerInfoUpdateScreenState();
}

class _CustomerInfoUpdateScreenState extends State<CustomerInfoUpdateScreen> {
  String customerId = '';

  late double height;
  late double width;
  CustomerInfoModel _customerInfoModel = CustomerInfoModel();


  TextEditingController cutomerNameEtController = TextEditingController();
  TextEditingController totalAmountEtController = TextEditingController();
  TextEditingController paidAmountEtController = TextEditingController();
  TextEditingController dueAmountEtController = TextEditingController();
  TextEditingController noteEtController = TextEditingController();
  TextEditingController dateEtController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  String date = '';
  String time = '';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2020, 8),
        lastDate: DateTime(2101));

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
       // dateEtController.text = "${selectedDate.toLocal()}".split(' ')[0];
        dateEtController.text = selectedDate.toString();
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    customerId = widget.customerId;
    getCustomerDetails();
  }

  Future<void> getCustomerDetails() async {
    try {
      final respone =
          await NetworkUtils().getMethod(Urls.updateCustomerInfo(customerId));
      if (respone != null) {
        List<dynamic> listResponse = [];

        listResponse.add(respone);

        _customerInfoModel = CustomerInfoModel.fromJson(listResponse);
      } else {
        showSnackBarMessage(context, "Unable to fetch data");
      }
    } catch (e) {
      //print(e);
    }

    cutomerNameEtController.text =
        _customerInfoModel.data?.first.name ?? 'Unknown';
    totalAmountEtController.text =
        _customerInfoModel.data?.first.total ?? 'Unknown';
    paidAmountEtController.text =
        _customerInfoModel.data?.first.paid ?? 'Unknown';
    dueAmountEtController.text =
        _customerInfoModel.data?.first.due ?? 'Unknown';
    noteEtController.text = _customerInfoModel.data?.first.note ?? 'Unknown';

    time = '${DateTime.now().toLocal()}'.split(' ')[1];
    dateEtController.text = "${_customerInfoModel.data?.first.date }";
    setState(() {

    });


  }

  Future<void> updatePrice(String date,String total, String paid, String due, String note) async {
    NetworkUtils().updateMethode(Urls.updateCustomerInfo(customerId), body: {

      "date": date,
      "total": total,
      "paid": paid,
      "due": due,
      "note": note
    });
    showSnackBarMessage(context, "Customer details Updated Successfully");
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
                          dateEtController.text.split(' ')[0],
                          style:
                              const TextStyle(fontSize: 24, color: Colors.grey),
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
                      hintText: "Enter name"),
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
                    keyBoardType: TextInputType.number,
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
                    keyBoardType: TextInputType.number,),
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
                      keyBoardType: TextInputType.number,
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
                      controller: noteEtController, hintText: "Enter note"),
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
                  text: "Update",
                  textColor: Colors.white,
                  buttonColor: Colors.blue,
                  onTap: () {
                    updatePrice(dateEtController.text.split(' ')[0], totalAmountEtController.text, paidAmountEtController.text, dueAmountEtController.text, noteEtController.text);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
