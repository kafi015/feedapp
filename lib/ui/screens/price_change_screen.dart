import 'dart:convert';

import 'package:feedapp/Data/models/product_indo_model.dart';
import 'package:feedapp/Data/network_utils.dart';
import 'package:feedapp/ui/widgets/app_textformfield.dart';
import 'package:flutter/material.dart';
import '../../Data/urls.dart';
import '../utils/snakbar_message.dart';
import '../widgets/appbar_home_icon_button.dart';
import 'package:http/http.dart' as http;

class PriceChangeScreen extends StatefulWidget {
  const PriceChangeScreen({Key? key}) : super(key: key);

  @override
  State<PriceChangeScreen> createState() => _PriceChangeScreenState();
}

class _PriceChangeScreenState extends State<PriceChangeScreen> {
  late double height;
  late double width;

  TextEditingController priceChangeETController = TextEditingController();

  ProductInfoModel _productInfoModel = ProductInfoModel();
  bool inProgress = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPrizeInfo();
  }

  Future<void> getPrizeInfo() async {
    inProgress = true;
    setState(() {});

    final respone = await NetworkUtils().getMethod(Urls.productInfoUrl);
    if (respone != null) {
      _productInfoModel = ProductInfoModel.fromJson(respone);
    } else {
      showSnackBarMessage(context, "Unable to fetch data");
    }

    inProgress = false;
    setState(() {});
  }

  Future<Data> updatePrice(String price,String sId) async {
    final http.Response response = await http.patch(
      Uri.parse('${Urls.baseUrl}/updateProduct/$sId'),
      headers: <String, String>{
        'Content-type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'price': price,
      }),
    );

    if(response.statusCode == 200)
      {
        priceChangeETController.clear();
        Navigator.of(context).pop();

        showSnackBarMessage(context, "Price Updated Successfully");
        getPrizeInfo();
        return Data.fromJson(json.decode(response.body));
      }
    else
      {
        Navigator.of(context).pop();
        showSnackBarMessage(context, "Failed", Colors.red);
        throw Exception('Failed to update.');
      }

  }




    @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    myAlertDialog(context, String productId) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(34.0),
                  side: const BorderSide(width: 3, color: Colors.blue)),
              title: Text(
                "মূল্য পরিবর্তন ",
                style: TextStyle(color: Colors.blue),
              ),
              content: AppTextFormField(
                controller: priceChangeETController,
                hintText: "",
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {
                        setState(() {
                          updatePrice(priceChangeETController.text, productId);
                          // priceChangeETController.clear();
                          // Navigator.pop(context);
                          // getPrizeInfo();
                        });
                      },
                      child: const Text("Done")),
                ),
              ],
            );
          });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: Container(
          color: Colors.blue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                elevation: 0,
                leading: const AppBarHomeIconButton(),
                title: const Text("Price Change"),
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
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: const TextStyle(color: Colors.grey),
                    suffixIcon: const Icon(Icons.search),
                    suffixIconColor: Colors.blue,
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(34.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 30),
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 5, bottom: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                child: const Text(
                  "Edit Price",
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: inProgress
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: _productInfoModel.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    elevation: 10,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(34.0),
                      side: const BorderSide(width: 1, color: Colors.blue),
                    ),
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          _productInfoModel.data?[index].name ?? "Unknown",
                          style: const TextStyle(color: Colors.blue),
                        ),
                      ),
                      trailing: InkWell(
                          onTap: () {
                            setState(() {
                              priceChangeETController.text = _productInfoModel.data?[index].price ?? '';
                              myAlertDialog(context,
                                  _productInfoModel.data?[index].sId ?? '');
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              _productInfoModel.data?[index].price ?? "00",
                              style: const TextStyle(color: Colors.blue),
                            ),
                          )),
                    ),
                  );
                },
              ),
      ),
    );
  }
}

