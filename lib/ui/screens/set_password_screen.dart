import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedapp/ui/screens/pass_change_message.dart';
import 'package:feedapp/ui/widgets/appbar_logo.dart';
import 'package:flutter/material.dart';

import '../../Data/network_utils.dart';
import '../../Data/urls.dart';
import '../../main.dart';
import '../utils/snakbar_message.dart';
import '../widgets/app_elevatedbutton.dart';
import '../widgets/app_textformfield.dart';
import '../widgets/appbar_home_icon_button.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({Key? key, required this.email}) : super(key: key);

  final String email;

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  late double height;
  late double width;
  String _email = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController passETController = TextEditingController();
  TextEditingController confirmPassETController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _email = widget.email;
  }

  Future<void> updatePasword(String pass) async {

    final response = await NetworkUtils().updateMethode(Urls.updateUserPassInfo(_email), body: {
      "password": pass
    });

    if(response != null)
      {
        showSnackBarMessage(MyApp.globalKey.currentContext!, "Pasword Updated Successfully",Colors.blue);
      }
    else
      {
        showSnackBarMessage(MyApp.globalKey.currentContext!, "Pasword Update Request Failed",Colors.red);
      }

  }


  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const AppBarHomeIconButton(),
        title: const Text("Verification"),
        centerTitle: true,
        actions:  [
          AppBarLogo(height: height)
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width * 0.05),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 SizedBox(
                  height:  height* .04,
                ),
                Center(
                  child: Image.asset(
                    "assets/varification.png",
                    scale:  height* .004,
                  ),
                ),
                SizedBox(
                  height:  height* .08,
                ),
                 Padding(
                  padding: EdgeInsets.only(left:  width* .04),
                  child: Text(
                    "New Password",
                    style: TextStyle(
                        fontSize:  height* .023,
                        color: Colors.grey,
                    ),
                  ),
                ),
                 SizedBox(
                  height:  height* .01,
                ),
                SizedBox(
                  height: height * 0.08,
                  child: AppTextFormField(
                      controller: passETController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Enter password more than 6 letter";
                        }
                        if ((value?.length ?? 0) < 6) {
                          return "Enter password more than 6 letter";
                        }
                        return null;
                      },
                      hintText: "New Password"),
                ),

                 SizedBox(
                  height:  height* .04,
                ),

                 Padding(
                  padding: EdgeInsets.only(left:  width* .04),
                  child: Text(
                    "Confirm Password",
                    style: TextStyle(
                        fontSize:  height* .023,
                        color: Colors.grey,
                    ),
                  ),
                ),
                 SizedBox(
                  height:  height* .01,
                ),
                SizedBox(
                  height: height * 0.08,
                  child: AppTextFormField(
                      controller: confirmPassETController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Enter password more than 6 letter";
                        }
                        if (passETController.text !=
                            confirmPassETController.text) {
                          return "Password does not match!";
                        }
                        return null;
                      },
                      hintText: "Confirm Password"),
                ),

                 SizedBox(
                  height:  height* .12,
                ),


                AppElevatedButton(
                  text: "Submit",
                  textColor: Colors.white,
                  buttonColor: Colors.blue,
                  onTap: () {

                    if(_formKey.currentState!.validate())
                      {
                        try
                            {
                              FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
                              firebaseFirestore.collection('users').get().then((doucment)
                              {
                                for(var docs in doucment.docs)
                                {
                                  if(docs.get('mobile') == _email)
                                  {
                                    firebaseFirestore.collection('users').doc(docs.id.toString()).update({
                                      'pass' : passETController.text,
                                    });

                                    break;
                                  }
                                }
                              }
                              );
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const PassChangeMessage()));
                            }catch(e)
                    {
                      showSnackBarMessage(context, 'Network Error!',Colors.red);
                    }

                      }

                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
