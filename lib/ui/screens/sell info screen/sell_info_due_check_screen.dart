import 'package:flutter/material.dart';

import '../../widgets/appbar_home_icon_button.dart';
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
        lastDate: DateTime(2101));

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const AppBarHomeIconButton(),
        title: const Text("Sell Info"),
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
      body: Column(
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
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                     CustomerInfoUpdateScreen(customerId: '',)));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(34.0),
                          side: const BorderSide(color: Colors.blue, width: 1),
                        ),
                        child: const Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Customer's Name",
                                style:
                                    TextStyle(fontSize: 24, color: Colors.blue),
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.blue,
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Total due",
                                style:
                                    TextStyle(fontSize: 24, color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
