import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:nnn/models/book.dart';

class HomeFormScreen extends StatefulWidget {
  const HomeFormScreen({Key? key}) : super(key: key);

  @override
  _HomeFormScreenState createState() => _HomeFormScreenState();
}

class _HomeFormScreenState extends State<HomeFormScreen> {
  DatabaseReference dref = FirebaseDatabase.instance.ref();
  fechData() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FirebaseAnimatedList(
        query: dref,
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
            Animation<double> animation, int index) {
          var x = snapshot.value.toString();
          fechData();

          return ListTile(
            subtitle: Text(snapshot.value.toString()),
          );
        },
      )),
    );
  }
}
