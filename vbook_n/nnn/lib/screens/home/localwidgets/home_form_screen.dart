import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:nnn/models/books.dart';

class HomeFormScreen extends StatefulWidget {
  const HomeFormScreen({Key? key}) : super(key: key);

  @override
  _HomeFormScreenState createState() => _HomeFormScreenState();
}

class _HomeFormScreenState extends State<HomeFormScreen> {
  DatabaseReference dref = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FirebaseAnimatedList(
        query: dref,
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
            Animation<double> animation, int index) {
          var x = snapshot;
          //fechData(x);
          return Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: Colors.green),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                title: Text(snapshot.child("title").value.toString()),
                subtitle: Text(
                  snapshot.child("bookID").value.toString(),
                  style: TextStyle(color: Colors.green),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.white,
                    size: 32,
                  ),
                  onPressed: () {
                    print(snapshot.child("title").value.toString());
                    print(snapshot.child("bookID").value.toString());
                  },
                ),
              ));
        },
      ),
    );
  }
}
