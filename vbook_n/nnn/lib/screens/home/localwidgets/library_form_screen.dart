import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nnn/screens/home/localwidgets/bookdetailswidgets/book_details_form_screen.dart';
import 'package:nnn/services/database.dart';

class LibraryFormScreen extends StatefulWidget {
  const LibraryFormScreen({Key? key}) : super(key: key);

  @override
  _LibraryFormScreenState createState() => _LibraryFormScreenState();
}

class _LibraryFormScreenState extends State<LibraryFormScreen> {
  final Stream<QuerySnapshot> books =
      FirebaseFirestore.instance.collection('library').snapshots();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("VBOOK"),
          backgroundColor: Colors.green[700],
        ),
        body: Container(
          child: StreamBuilder<QuerySnapshot>(
            stream: books,
            builder: (
              BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot,
            ) {
              if (snapshot.hasError) {
                return Text('Error');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('Loading');
              }
              final data = snapshot.requireData;
              return ListView.builder(
                itemCount: data.size,
                itemBuilder: (context, index) {
                  if ("${data.docs[index]['userID']}" ==
                      _auth.currentUser!.uid) {
                    return Container(
                      height: 120,
                      padding: EdgeInsets.only(top: 10, bottom: 10, left: 20),
                      margin: EdgeInsets.symmetric(vertical: 1),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 320,
                                  height: 32,
                                  child: Text(
                                    data.docs[index]['bookTitle'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ),
                                SizedBox(
                                  width: 270.0,
                                  height: 28,
                                  child: Text(
                                    data.docs[index]['bookAuthor'],
                                    style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 12),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2),
                                  child: Row(
                                    children: [
                                      RatingBarIndicator(
                                        itemSize: 20,
                                        rating: double.parse(
                                            data.docs[index]['rating']),
                                        direction: Axis.horizontal,
                                        itemCount: 5,
                                        unratedColor: Colors.grey.shade700,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 1.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.yellow.shade800,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        data.docs[index]['rating'],
                                        style: TextStyle(
                                            color: Colors.purple,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Container(
                          //   width: 320,
                          //   child:
                          Container(
                              margin: EdgeInsets.only(right: 8),
                              width: 42,
                              child: MaterialButton(
                                height: 120,
                                onPressed: () {
                                  String isbn = data.docs[index]['isbn13'];
                                  VbookDatabase().deleteBook(isbn);
                                },
                                child: Icon(
                                  Icons.delete_outline,
                                  color: Colors.blueGrey.shade700,
                                ),
                              ))
                        ],
                      ),
                    );
                  } else {
                    return SizedBox();
                  }
                },
              );
            },
          ),
        ));
  }
}
