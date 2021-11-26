import 'package:cloud_firestore/cloud_firestore.dart';

class CurrentUser {
  String userID;
  String email;
  String userName;

  CurrentUser(
      {required this.userID, required this.email, required this.userName});

  void add(Map map) {}
}
