import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nnn/services/database.dart';

class RecommendationFormScreen extends StatefulWidget {
  const RecommendationFormScreen({Key? key}) : super(key: key);

  @override
  _RecommendationFormScreenState createState() =>
      _RecommendationFormScreenState();
}

class _RecommendationFormScreenState extends State<RecommendationFormScreen> {
  @override
  void initState() {
    super.initState();
    getBookList();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  CollectionReference bookCollection =
      FirebaseFirestore.instance.collection('library');
  List list = [];
  List list2 = [];
  List list3 = [];
  String id = "";
  getBookList() async {
    dynamic result = await VbookDatabase().getBookData();
    dynamic result2 = await VbookDatabase().getUserId();
    if (result == null && result2 == null) {
      print("error");
    } else {
      list = result;
      list2 = result2;
      id = "";
      for (int i = 0; i < list.length - 1; i++) {
        if (_auth.currentUser!.uid == list2[i]) {
          getTitle(list[i]);
        }
      }
    }
  }

  Future getData(url) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.body;
    } else
      print("missing");
  }

  Future getTitle(String title) async {
    var data = await getData('http://10.0.2.2:5000/jsondata?title=' + title);
    var decodedData = jsonDecode(data);
    if (id == "") {
      id += decodedData['query'].toString();
    } else
      id += ", " + decodedData['query'].toString();
    return decodedData['query'];
  }

  Future getBooks(String item) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref();

// Get the Stream
    Stream<DatabaseEvent> stream = ref.onValue;

// Subscribe to the stream!
    stream.listen((DatabaseEvent event) {
      print('Event Type: ${event.type}'); // DatabaseEventType.value;
      print('Snapshot: ${event.snapshot.child(item).value}'); // DataSnapshot
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            MaterialButton(
              color: Colors.white,
              onPressed: () {
                List<String> asd = id.split(',');
                asd.toSet().toList();
                for (var item in asd) {
                  getBooks(item);
                }
              },
            ),
          ],
        ));
  }
}
