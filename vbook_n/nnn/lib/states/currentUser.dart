// ignore_for_file: file_names, unused_local_variable, avoid_print, await_only_futures, prefer_typing_uninitialized_variables
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nnn/screens/home/home_screen.dart';

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

  Future<String> logOut() async {
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

  Future<String> registerUser(String email, String password) async {
    String retVal = "Error";
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      retVal = "Success";
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        retVal =
            'Registeration Success! Please verify your email address to continue';
      } else {
        retVal = 'Account Creation Failed. Something Went Wrong.';
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        retVal = 'The email is invalid.';
      } else if (e.code == 'weak-password') {
        retVal = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        retVal = 'The account already exists for that email.';
      } else {
        retVal = e.code;
      }
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> loginUser(String email, String password) async {
    String retVal = "";
    try {
      UserCredential authCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = FirebaseAuth.instance.currentUser;
      if (authCredential.user != null && user!.emailVerified) {
        _uid = authCredential.user!.uid;
        _email = authCredential.user!.email!;
        retVal = "Success";
      } else {
        retVal = 'Verify Your Email Address';
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        retVal = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        retVal = 'Wrong password provided for that user.';
      }
    } catch (e) {
      print(e);
    }
    return retVal;
  }
}
