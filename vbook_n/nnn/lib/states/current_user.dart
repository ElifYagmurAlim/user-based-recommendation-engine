// ignore_for_file: file_names, unused_local_variable, avoid_print, await_only_futures, prefer_typing_uninitialized_variables
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class CurrentUser extends ChangeNotifier {
  var _uid;
  var _email;
  String get getUid => _uid;
  String get getEmail => _email;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> onStartUp() async {
    String retVal = "Error";

    try {
      User? firebaseUser = await _auth.currentUser;
      _uid = firebaseUser!.uid;
      _email = firebaseUser.email!;
      retVal = "Success";
    } catch (e) {
      print(e);
    }

    return retVal;
  }

  Future<String> signOut() async {
    String retVal = "Error";

    try {
      await _auth.signOut();
      _uid = null;
      _email = null;
      retVal = "Success";
    } catch (e) {
      print(e);
    }

    return retVal;
  }

  Future<String> signUpUser(String email, String password) async {
    String retVal = "Error";
    try {
      print(email);
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      retVal = "Success";
    } catch (e) {
      retVal = e.toString();
    }
    return retVal;
  }

  Future<String> loginUserWithEmail(String email, String password) async {
    String retVal = "Error";
    try {
      UserCredential authCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (authCredential.user != null) {
        _uid = authCredential.user!.uid;
        _email = authCredential.user!.email!;
        retVal = "Success";
      }
    } catch (e) {
      retVal = e.toString();
    }
    return retVal;
  }
}
