import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethods {
  uploadUserInfo(dataMap) {
    FirebaseFirestore.instance.collection("users").add(dataMap);
  }

  getUserByUsername(username) async {}
}
