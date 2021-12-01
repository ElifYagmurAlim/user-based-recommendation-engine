import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProfileFormScreen extends StatefulWidget {
  const ProfileFormScreen({
    Key? key,
  }) : super(key: key);

  @override
  _ProfileFormScreenState createState() => _ProfileFormScreenState();
}

class _ProfileFormScreenState extends State<ProfileFormScreen> {
  final double coverHeight = 256;
  final double profileHeight = 128;

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return Scaffold(
      //appBar: buildAppBar(context),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[],
      ),
    );
  }
}
