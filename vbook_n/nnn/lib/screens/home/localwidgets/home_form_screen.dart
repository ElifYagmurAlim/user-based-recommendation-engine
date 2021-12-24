import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:nnn/root/root.dart';
import 'package:nnn/states/currentUser_state.dart';
import 'package:provider/provider.dart';

class HomeFormScreen extends StatefulWidget {
  const HomeFormScreen({Key? key}) : super(key: key);

  @override
  _HomeFormScreenState createState() => _HomeFormScreenState();
}

class _HomeFormScreenState extends State<HomeFormScreen> {
<<<<<<< HEAD
  DatabaseReference dref = FirebaseDatabase.instance.ref();
  List<Book> books = [];
  fechData(DataSnapshot x) async {
//     DatabaseReference ref = FirebaseDatabase.instance.ref();
    books.add(Book(
        authors: x.child("authors").value.toString(),
        average_rating: x.child("average_rating").value.toString(),
        bookID: x.child("bookID").value.toString(),
        isbn: x.child("isbn").value.toString(),
        language_code: x.child("language_code").value.toString(),
        num_pages: x.child("num_pages").value.toString(),
        publication_date: x.child("publication_date").value.toString(),
        publisher: x.child("publisher").value.toString(),
        ratings_count: x.child("ratings_count").value.toString(),
        text_reviews_count: x.child("text_reviews_count").value.toString(),
        title: x.child("title").value.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FirebaseAnimatedList(
        query: dref,
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
            Animation<double> animation, int index) {
          DataSnapshot x = snapshot;
          fechData(x);
          print(books[0].title.toString());
          return ListTile(
            subtitle: Text(snapshot.value.toString()),
          );
        },
      )),
=======
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text("asd"),
        onPressed: () async {},
      ),
>>>>>>> parent of d94ccb5 (.)
    );
  }
}
