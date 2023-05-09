import 'package:feedapp/ui/widgets/app_textformfield.dart';
import 'package:flutter/material.dart';

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
                child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: height * 0.03),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CustomerInfoUpdateScreen()));
                          },
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(34.0),
                              side: const BorderSide(
                                  color: Colors.blue, width: 1),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Center(
                                  child: Text(
                                "আনিস মামা, খুপিবাড়ি",
                                style:
                                    TextStyle(fontSize: 24, color: Colors.blue),
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
