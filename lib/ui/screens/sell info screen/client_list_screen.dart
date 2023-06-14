import 'package:feedapp/ui/widgets/app_textformfield.dart';
import 'package:flutter/material.dart';

import '../../../Data/network_utils.dart';
import '../../../Data/urls.dart';
import '../../../main.dart';
import '../../utils/snakbar_message.dart';
import '../../widgets/appbar_logo.dart';
import '../../widgets/back_button.dart';
import 'customer_info_update_screen.dart';

class ClientListScreen extends StatefulWidget {
  const ClientListScreen({Key? key}) : super(key: key);

  @override
  State<ClientListScreen> createState() => _ClientListScreenState();
}

class _ClientListScreenState extends State<ClientListScreen> {
  late double height;
  late double width;

  TextEditingController searchName = TextEditingController();
  bool inProgress = false;
  List<dynamic> _foundCustomer = [];
  List<dynamic> _allCustomer = [];

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
        _allCustomer = respone;
        _foundCustomer = respone;
      } else {

        List<dynamic> list = [];
        _foundCustomer = list;
        showSnackBarMessage(MyApp.globalKey.currentContext!, "Unable to fetch data");
      }
    } catch (e) {
      //print(e);
    }

    inProgress = false;
    setState(() {});
  }

  void _runFilter(String value)
  {
    List<dynamic> result = [];
    if(value.isEmpty)
      {
        result = _allCustomer;
      }
    else
      {
        result = _allCustomer.where((customer) => customer['name'].toString().toLowerCase().contains(value.toLowerCase())).toList();
      }
    setState(() {
      _foundCustomer = result;
    });
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
        actions: const [
          AppBackButton(),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: ()async{
          await getCustomerInfo();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.04,
              ),
              AppTextFormField(
                  controller: searchName,
                  hintText: "Search the name",
                onChanged: (value) => _runFilter(value!),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Expanded(
                  child: inProgress
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                      itemCount: _foundCustomer.length,
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
                                                    customerId: '${_foundCustomer[index]['_id']}',
                                                  )));
                                    },
                                    child: Card(
                                      elevation: 10,
                                      shadowColor: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(34.0),
                                        side: const BorderSide(
                                            color: Colors.blue, width: 1),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Center(
                                            child: Text(
                                              '${_foundCustomer[index]['name']}',
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
      ),
    );
  }
}
