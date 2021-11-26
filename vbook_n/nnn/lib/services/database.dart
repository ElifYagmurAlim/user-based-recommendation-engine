import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nnn/models/user.dart';

class VbookDatabase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> createUser(CurrentUser user) async {
    String retVal = "error";
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      users
          .add({
            'email': user.email,
            'userName': user.userName,
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }
}
