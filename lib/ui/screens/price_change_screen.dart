import 'package:feedapp/ui/widgets/app_textformfield.dart';
import 'package:flutter/material.dart';

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

    MyAlertDialog(context) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return Expanded(
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(34.0),
                    side: BorderSide(
                        width: 3,
                        color: Colors.blue
                    )
                ),
                title: Text("মূল্য পরিবর্তন",style: TextStyle(color: Colors.blue),),
                content: AppTextFormField(controller: TextEditingController(),hintText: "",),
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
                        child: Text("Done")),
                  ),

                ],
              ),
            );
          });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: Container(
          color: Colors.blue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                elevation: 0,
                leading: Icon(Icons.home),
                title: Text("Price Change"),
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
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.grey),
                    suffixIcon: Icon(Icons.search),
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
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 30),
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Text(
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
              margin: EdgeInsets.only(top: 20),
              elevation: 10,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(34.0),
                side: BorderSide(width: 1, color: Colors.blue),
              ),
              child: ListTile(
                title: Text(
                  "প্রোটিন-এ সি আই",
                  style: TextStyle(color: Colors.blue),
                ),
                trailing: InkWell(
                    onTap: () {
                      MyAlertDialog(context);
                    },
                    child: Text(
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


