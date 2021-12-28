import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nnn/models/books.dart';
import 'package:nnn/models/library.dart';
import 'package:nnn/models/user.dart';

class VbookDatabase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  Future<String> createUser(CurrentUser user) async {
    String retVal = "error";
    List<RatedBook> ratedBooks = [];
    try {
      userCollection.doc(_auth.currentUser!.uid).set({
        'userID': _auth.currentUser!.uid,
        'email': user.email,
        'userName': user.userName,
        //'userLibrary': ratedBooks,
      }).then((value) => print("Success!"));
      retVal = "Success";
      //       FirebaseFirestore.instance.collection('users').add({
      //   'email': user.email,
      //   'userName': user.userName,
      // });
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> getData() async {
    String retVal = "error";
    try {
      DocumentSnapshot ds =
          await userCollection.doc(_auth.currentUser!.uid).get();
      String _userName = ds.get("userName");
      // List<dynamic> asd = ds.get("as");
      // print(asd[0].toString());
      return _userName;
    } catch (e) {
      print(e.toString());
    }

    return retVal;
  }

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> deleteUser(String userId) {
    return users
        .doc(userId)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }
}
