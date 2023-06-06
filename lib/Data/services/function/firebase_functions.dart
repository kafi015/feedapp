import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  static saveUser(String role,String name,String mobile,String pass, uid) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set({'role': role, 'name': name, 'mobile': mobile, 'pass': pass});
  }
}
