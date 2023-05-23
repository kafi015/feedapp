import 'package:feedapp/Data/models/customer_info_model.dart';
import 'package:feedapp/ui/widgets/app_textformfield.dart';
import 'package:flutter/material.dart';

import '../../../Data/network_utils.dart';
import '../../../Data/urls.dart';
import '../../utils/snakbar_message.dart';
import '../../widgets/appbar_logo.dart';
import 'customer_info_update_screen.dart';

class ClientListScreen extends StatefulWidget {
  const ClientListScreen({Key? key}) : super(key: key);

  @override
  State<ClientListScreen> createState() => _ClientListScreenState();
}

class _ClientListScreenState extends State<ClientListScreen> {
  late double height;
  late double width;

  CustomerInfoModel _customerInfoModel = CustomerInfoModel();
  bool inProgress = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCustomerInfo();
  }

  Future<void> getCustomerInfo() async {
    inProgress = true;
    setState(() {});

    try {
      final respone = await NetworkUtils().getMethod(Urls.customerInfoUrl);
      //print(respone);
      if (respone != null) {
        _customerInfoModel = CustomerInfoModel.fromJson(respone);
      } else {

        List<dynamic> list = [];
        _customerInfoModel = CustomerInfoModel.fromJson(list);
        showSnackBarMessage(context, "Unable to fetch data");
      }
    } catch (e) {
      //print(e);
    }

    inProgress = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: AppBarLogo(height: height),
        title: const Text("Client List"),
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.04,
            ),
            AppTextFormField(
                controller: TextEditingController(),
                hintText: "Search the name"),
            SizedBox(
              height: height * 0.04,
            ),
            Expanded(
                child: inProgress
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: _customerInfoModel.data!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: height * 0.03),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                             CustomerInfoUpdateScreen(
                                              customerId: _customerInfoModel.data?[index].sId ?? '',
                                            )));
                              },
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(34.0),
                                  side: const BorderSide(
                                      color: Colors.blue, width: 1),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Center(
                                      child: Text(
                                    '${_customerInfoModel.data?[index].name}',
                                    style: const TextStyle(
                                        fontSize: 24, color: Colors.blue),
                                  )),
                                ),
                              ),
                            ),
                          );
                        }))
          ],
        ),
      ),
    );
  }
}
