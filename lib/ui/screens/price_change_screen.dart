import 'package:feedapp/ui/widgets/app_textformfield.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar_home_icon_button.dart';

class PriceChangeScreen extends StatefulWidget {
  const PriceChangeScreen({Key? key}) : super(key: key);

  @override
  State<PriceChangeScreen> createState() => _PriceChangeScreenState();
}

class _PriceChangeScreenState extends State<PriceChangeScreen> {
  late double height;
  late double width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    myAlertDialog(context) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return Expanded(
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(34.0),
                    side: const BorderSide(width: 3, color: Colors.blue)),
                title: const Text(
                  "মূল্য পরিবর্তন",
                  style: TextStyle(color: Colors.blue),
                ),
                content: AppTextFormField(
                  controller: TextEditingController(),
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
                          Navigator.of(context).pop();
                        },
                        child: const Text("Done")),
                  ),
                ],
              ),
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
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.only(top: 20),
              elevation: 10,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(34.0),
                side: const BorderSide(width: 1, color: Colors.blue),
              ),
              child: ListTile(
                title: const Text(
                  "প্রোটিন-এ সি আই",
                  style: TextStyle(color: Colors.blue),
                ),
                trailing: InkWell(
                    onTap: () {
                      myAlertDialog(context);
                    },
                    child: const Text(
                      "০০০ টাকা",
                      style: TextStyle(color: Colors.blue),
                    )),
              ),
            );
          },
        ),
      ),
    );
  }
}
