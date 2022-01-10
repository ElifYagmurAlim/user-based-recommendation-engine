import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RecommendationFormScreen extends StatefulWidget {
  const RecommendationFormScreen({Key? key}) : super(key: key);

  @override
  _RecommendationFormScreenState createState() =>
      _RecommendationFormScreenState();
}

class _RecommendationFormScreenState extends State<RecommendationFormScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> deleteUser(String userId) {
    String userid = _auth.currentUser!.uid;
    return users
        .doc(userId)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  String getUserBookTitles() {
    String userid = _auth.currentUser!.uid;
    var userData =
        FirebaseFirestore.instance.collection('library').doc(userid).get();
    return userid.toString();
  }

  Future getData(url) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.body;
    } else
      print("err");
  }

  Future getTitle(String title) async {
    var data = await getData('http://10.0.2.2:5000/jsondata?title=' + title);
    var decodedData = jsonDecode(data);
    print(decodedData['query']);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        onPressed: () {
          String title = "Twilight";
          getTitle(title);
          getUserBookTitles();
        },
      ),
    );
  }
}
