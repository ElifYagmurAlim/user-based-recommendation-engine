import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nnn/models/library.dart';

class CurrentUser {
  String userID;
  String email;
  String userName;
  //UserLibrary userLibrary;
  CurrentUser({
    required this.userID,
    required this.email,
    required this.userName,
    // required this.userLibrary
  });
}
