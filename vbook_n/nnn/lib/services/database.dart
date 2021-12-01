import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nnn/models/user.dart';

class VbookDatabase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<String> createUser(CurrentUser user) async {
    String retVal = "error";

    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      users.doc(_auth.currentUser!.uid).set({
        'userID': _auth.currentUser!.uid,
        'email': user.email,
        'userName': user.userName
      }).then((value) => print("User Added"));

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
