import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:nnn/models/books.dart';
import 'package:nnn/models/rating.dart';
import 'package:nnn/models/user.dart';

class VbookDatabase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  CollectionReference rateCollection =
  FirebaseFirestore.instance.collection('ratings');
  CollectionReference bookCollection =
  FirebaseFirestore.instance.collection('library');
  Future<String> createUser(CurrentUser user) async {
    String retVal = "error";

    try {
      userCollection.doc(_auth.currentUser!.uid).set({
        'userID': _auth.currentUser!.uid,
        'email': user.email,
        'userName': user.userName,
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
  Future<String> createRatings(Rate rate) async {
            String retVal = "error";
            try {
              rateCollection.doc().set({
                'userID': _auth.currentUser!.uid,
                'isbn': rate.isbn,
                'bookRate': rate.bookRate,
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
  Future<String> createBooks(Book book) async {
    String retVal = "error";
    try {
      bookCollection.doc().set({
        'userID': _auth.currentUser!.uid,
        'bookTitle': book.title,
        'bookAuthor':book.authors ,
        'rating': book.average_rating,
        'text_reviews_count': book.text_reviews_count,

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