import 'package:flutter/material.dart';
import '../../../Data/models/customer_info_model.dart';
import '../../../Data/network_utils.dart';
import '../../../Data/urls.dart';
import '../../../main.dart';
import '../../utils/snakbar_message.dart';
import '../../widgets/appbar_home_icon_button.dart';
import '../../widgets/back_button.dart';
import 'customer_info_update_screen.dart';

class SellInfoDueCheckScreen extends StatefulWidget {
  const SellInfoDueCheckScreen({Key? key}) : super(key: key);

  @override
  State<SellInfoDueCheckScreen> createState() => _SellInfoDueCheckScreenState();
}

class _SellInfoDueCheckScreenState extends State<SellInfoDueCheckScreen> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2020, 8),
        lastDate: DateTime.now());

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        getCustomerInfo();
      });
    }
  }

  bool inProgress = false;
  String dateCompare = '';
  CustomerInfoModel _customerInfoModel = CustomerInfoModel();

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
        dateCompare = '${selectedDate.toLocal()}'.split(' ').first;
      } else {
        showSnackBarMessage(MyApp.globalKey.currentContext!, "Unable to fetch data");
      }
    } catch (e) {
      //print(e);
    }

    inProgress = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const AppBarHomeIconButton(),
        title: const Text("Sell Info"),
        centerTitle: true,
        actions: const [
          AppBackButton(),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: ()async{
          await getCustomerInfo();
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.calendar_month,
                  color: Colors.blue,
                ),
                label: Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 10, right: 30, left: 20),
                  child: Text(
                    "${selectedDate.toLocal()}".split(' ')[0],
                    style: const TextStyle(fontSize: 24, color: Colors.grey),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(width: 1, color: Colors.blue),
                  backgroundColor: Colors.white,
                ),
                onPressed: () => _selectDate(context),
              ),
            ),
            Expanded(
              child: inProgress
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                      itemCount: _customerInfoModel.data?.length,
                      itemBuilder: (context, index) {
                        if (_customerInfoModel.data?[index].date == dateCompare) {
                          return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CustomerInfoUpdateScreen(
                                                customerId:
                                                    '${_customerInfoModel.data?[index].sId}',
                                              )));
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(34.0),
                                    side: const BorderSide(
                                        color: Colors.blue, width: 1),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          _customerInfoModel.data![index].name ??
                                              'Unknown',
                                          style: const TextStyle(
                                              fontSize: 24, color: Colors.blue),
                                        ),
                                      ),
                                      const Divider(
                                        thickness: 1,
                                        color: Colors.blue,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          _customerInfoModel.data?[index].due ??
                                              'Unknown',
                                          style: const TextStyle(
                                              fontSize: 24, color: Colors.blue),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ));
                        }
                        return Container();
                      }),
            )
          ],
        ),
      ),
    );
  }
}
