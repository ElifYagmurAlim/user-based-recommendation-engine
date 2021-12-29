import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
          backgroundColor: Colors.purple,
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
                    return Stack(
                      children: [
                        Container(
                            height: 120,
                            padding:
                                EdgeInsets.only(top: 10, bottom: 10, left: 20),
                            margin: EdgeInsets.symmetric(vertical: 1),
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Container(
                              child: Row(
                                children: [
                                  // Container(
                                  //   width: 320,
                                  //   child:
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 350,
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
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2),
                                        child: Row(
                                          children: [
                                            // RatingBar.builder(
                                            //   itemSize: 20,
                                            //   initialRating: double.parse(
                                            //       snapshot.child("average_rating").value.toString()),
                                            //   minRating: 0,
                                            //   direction: Axis.horizontal,
                                            //   allowHalfRating: true,
                                            //   itemCount: 5,
                                            //   ignoreGestures: true,
                                            //   updateOnDrag: false,
                                            //   unratedColor: Colors.black,
                                            //   itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                                            //   itemBuilder: (context, _) => Icon(
                                            //     Icons.star,
                                            //     color: Colors.yellow.shade400,
                                            //   ),
                                            //   onRatingUpdate: (rating) {
                                            //     print(rating);
                                            //   },
                                            // ),

                                            RatingBarIndicator(
                                              itemSize: 20,
                                              rating: double.parse(
                                                  data.docs[index]['rating']),
                                              direction: Axis.horizontal,
                                              itemCount: 5,
                                              unratedColor:
                                                  Colors.grey.shade700,
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
                                  //),
                                  // Container(
                                  //   child: IconButton(
                                  //     onPressed: () {},
                                  //     icon: Icon(
                                  //       Icons.keyboard_arrow_right,
                                  //       color: Colors.black,
                                  //       size: 40,
                                  //     ),
                                  //   ),
                                  // )
                                ],
                              ),
                            )),
                      ],
                    );
                  } else {
                    return Text("");
                  }
                },
              );
            },
          ),
        ));
  }
}
