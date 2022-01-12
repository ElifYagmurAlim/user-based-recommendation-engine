// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, deprecated_member_use
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nnn/models/books.dart';
import 'package:nnn/screens/home/localwidgets/home_form_screen.dart';
import 'package:nnn/screens/home/localwidgets/library_form_screen.dart';
import 'package:nnn/screens/home/localwidgets/profile_form_screen.dart';
import 'package:nnn/screens/home/localwidgets/recommendation_form_screen.dart';
import 'package:nnn/services/database.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, analytics}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  PageController pageController = PageController();
  String username = ' ';

  void onTapped(int index) {
    setState(() {
      getBookList();
      _selectedIndex = index;
    });

    pageController.jumpToPage(index);
  }

  Future<String> fechData() async {
    dynamic result = await VbookDatabase().getData();
    if (result == null) {
      print("error");
    } else {
      username = result.toString();
    }
    return username;
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  CollectionReference bookCollection =
      FirebaseFirestore.instance.collection('library');
  List list = [];
  List list2 = [];
  List<Book> recBookList = [];
  String lateargs = "";
  String id = "";
  int counter = 0;
  List<String> imagePaths = [];
  getBookList() async {
    dynamic result = await VbookDatabase().getBookData();
    dynamic result2 = await VbookDatabase().getUserId();
    if (result == null && result2 == null) {
      print("error");
    } else {
      list = result;
      list2 = result2;
      id = "";
      counter = 0;
      for (int i = 0; i < list.length - 1; i++) {
        if (_auth.currentUser!.uid == list2[i]) {
          getTitle(list[i], list2.length - 1);
        }
      }
    }
  }

  Future getData(url) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      counter += 10;
      return response.body;
    } else
      print("missing");
  }

  Future getTitle(String title, int listLength) async {
    var data = await getData('http://10.0.2.2:5000/jsondata?title=' + title);
    var decodedData = jsonDecode(data);
    if (id == "") {
      id += decodedData['query'].toString();
    } else
      id += ", " + decodedData['query'].toString();
    //return decodedData['query'];
    if (listLength == counter) {
      var item;
      recBookList.clear();
      if (listLength == counter) {}
      List<String> queryResult = id.split(',');

      queryResult = queryResult.toSet().toList();

      DatabaseReference ref = FirebaseDatabase.instance.ref();

// Get the Stream
      Stream<DatabaseEvent> stream = ref.onValue;

// Subscribe to the stream!
      stream.listen((DatabaseEvent event) {
        for (item in queryResult) {
          print(event.snapshot.child(item).child("title").value);
          imagePaths.add(
              event.snapshot.child(item).child("image_url").value.toString());
          Book book = Book(
              userId: "",
              authors:
                  event.snapshot.child(item).child("authors").value.toString(),
              average_rating: event.snapshot
                  .child(item)
                  .child("average_rating")
                  .value
                  .toString(),
              bookID: event.snapshot.child("book_id").value.toString(),
              isbn: event.snapshot.child("isbn").value.toString(),
              isbn13: event.snapshot.child("isbn13").value.toString(),
              language_code:
                  event.snapshot.child("language_code").value.toString(),
              num_pages: event.snapshot.child("num_pages").value.toString(),
              publication_date:
                  event.snapshot.child("publication_date").value.toString(),
              publisher: event.snapshot.child("publisher").value.toString(),
              ratings_count:
                  event.snapshot.child("ratings_count").value.toString(),
              text_reviews_count: event.snapshot
                  .child(item)
                  .child("work_text_reviews_count")
                  .value
                  .toString(),
              title:
                  event.snapshot.child(item).child("title").value.toString());

          recBookList.add(book);
        }
        // DataSnapshot
      });
    }

    return recBookList;
  }

  List<Book> ffncs() {
    getBookList();
    if (recBookList.isEmpty) {
      Book book = Book(
        userId: "",
        authors: "",
        average_rating: "",
        bookID: "",
        isbn: "",
        isbn13: "",
        language_code: "",
        num_pages: "",
        publication_date: "",
        publisher: "",
        ratings_count: "",
        text_reviews_count: "",
        title: "",
      );
      imagePaths.add("");
      recBookList.add(book);
    }

    return recBookList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          Container(
            color: Colors.red,
            child: HomeFormScreen(),
          ),
          Container(
            color: Colors.green,
            child: RecommendationFormScreen(
              imagePaths: imagePaths,
              lateargs: ffncs(),
            ),
          ),
          Container(
            color: Colors.blue,
            child: LibraryFormScreen(),
          ),
          Container(
            color: Colors.orange,
            child: ProfileFormScreen(),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: ('Home'),
              activeIcon: Icon(Icons.home)),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_border_outlined),
              label: 'Recommendation',
              activeIcon: Icon(Icons.star)),
          BottomNavigationBarItem(
              icon: Icon(Icons.book_outlined),
              label: 'Your Library',
              activeIcon: Icon(Icons.book)),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Profile',
              activeIcon: Icon(Icons.account_circle))
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.grey[900],
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        onTap: onTapped,
      ),
    );
  }
}
