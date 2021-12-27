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
//  List<Book> books = [];

//   fechData(DataSnapshot x) {
// // DatabaseReference ref = FirebaseDatabase.instance.ref();
//     books.add(Book(
//         authors: x.child("authors").value.toString(),
//         average_rating: x.child("average_rating").value.toString(),
//         bookID: x.child("bookID").value.toString(),
//         isbn: x.child("isbn").value.toString(),
//         language_code: x.child("language_code").value.toString(),
//         num_pages: x.child("num_pages").value.toString(),
//         publication_date: x.child("publication_date").value.toString(),
//         publisher: x.child("publisher").value.toString(),
//         ratings_count: x.child("ratings_count").value.toString(),
//         text_reviews_count: x.child("text_reviews_count").value.toString(),
//         title: x.child("title").value.toString(),
//         isbn13: x.child("isbn13").value.toString()));
//   }

//   fgetData() {
//     for (var i = 0; i < books.length; i++) {
//       print(books[i].title);
//     }
//   }

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
      // body: SafeArea(
      //     child: FirebaseAnimatedList(
      //   query: dref,
      //   itemBuilder: (BuildContext context, DataSnapshot snapshot,
      //       Animation<double> animation, int index) {
      //     var x = snapshot;
      //     fechData(x);
      //     return ListTile(
      //       subtitle: Text(books[0].title.toString()),
      //     );
      //   },
      // )
      // ),
    );
  }
}
