import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:nnn/models/books.dart';

class BookDetailsForm extends StatefulWidget {
  const BookDetailsForm({Key? key, this.y}) : super(key: key);
  final y;
  @override
  _BookDetailsFormState createState() => _BookDetailsFormState();
}

class _BookDetailsFormState extends State<BookDetailsForm> {
  functiondeneme() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref(widget.y);
    DatabaseEvent event = await ref.once();
    Text(event.snapshot.value.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: functiondeneme(),
    );
  }
}
