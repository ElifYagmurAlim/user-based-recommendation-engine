import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nnn/models/books.dart';
import 'package:nnn/screens/home/localwidgets/bookdetailswidgets/book_details_form_screen.dart';

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
        shrinkWrap: true,
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
            Animation<double> animation, int index) {
          var x = snapshot;
          //fechData(x);
          return Container(
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 20),
              margin: EdgeInsets.symmetric(vertical: 1),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Container(
                child: Stack(
                  children: [
                    Row(
                      children: [
                        // Container(
                        //   width: 320,
                        //   child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 350,
                              child: Text(
                                snapshot.child("title").value.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                SizedBox(width: 4),
                                Icon(
                                  Icons.person,
                                  size: 20,
                                ),
                                SizedBox(width: 4),
                                SizedBox(
                                  width: 270.0,
                                  child: Text(
                                    snapshot.child("authors").value.toString(),
                                    style:
                                        TextStyle(color: Colors.grey.shade600),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
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
                                  SizedBox(width: 4),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow.shade600,
                                        size: 20,
                                      ),
                                      Text(
                                        snapshot
                                            .child("average_rating")
                                            .value
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '/ 5.0',
                                        style: TextStyle(
                                            color: Colors.grey[500],
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        " (" +
                                            snapshot
                                                .child("text_reviews_count")
                                                .value
                                                .toString() +
                                            " reviews)",
                                        style: TextStyle(
                                            color: Colors.orange,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
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
                    SizedBox(
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () {
                          print("object");
                        },
                      ),
                    ),
                  ],
                ),
              ));
          // return Container(
          //     margin: EdgeInsets.all(8),
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(12), color: Colors.green),
          //     child: ListTile(
          //       contentPadding: EdgeInsets.all(16),
          //       title: Text(snapshot.child("title").value.toString()),
          //       subtitle: Text(
          //         snapshot.child("authors").value.toString(),
          //         style: TextStyle(color: Colors.white),
          //       ),
          //       trailing: IconButton(
          //         icon: Icon(
          //           Icons.keyboard_arrow_right,
          //           color: Colors.white,
          //           size: 32,
          //         ),

          //         onPressed: () {
          //           var y = snapshot.child("bookID").value.toString();
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //                 builder: (context) => BookDetailsForm(y: y)),
          //           );
          //           print(snapshot.child("title").value.toString());
          //           print(snapshot.child("bookID").value.toString());
          //         },
          //       ),
          //     ));
        },
      ),
    );
  }
}
