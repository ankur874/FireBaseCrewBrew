import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethods {
  uploadUserInfo(dataMap) {
    FirebaseFirestore.instance.collection("users").add(dataMap);
  }

  Future getUserByUsername(username) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("name", isEqualTo: username)
        .get();
  }

  createChatRoom(String chatRoomId,  chatRoomMap) {
    FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatRoomId)
        .set(chatRoomMap)
        .catchError((e) {
      print(e.toString());
    });
  }
}
