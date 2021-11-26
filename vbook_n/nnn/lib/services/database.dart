import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nnn/models/user.dart';

class VbookDatabase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> createUser(CurrentUser user) async {
    String retVal = "error";

    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      users.add({
        'email': user.email,
        'userName': user.userName,
      });
      //       FirebaseFirestore.instance.collection('users').add({
      //   'email': user.email,
      //   'userName': user.userName,
      // });
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }
}
