import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
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
        appBar: AppBar(
          title: Text("VBOOK"),
          backgroundColor: Colors.red,
        ),
        body: Container(
          color: Colors.grey.shade200,
          child: FirebaseAnimatedList(
            query: dref,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              var x = snapshot;
              //fechData(x);
              return Stack(
                children: [
                  Container(
                      height: 100,
                      padding: EdgeInsets.only(top: 10, bottom: 10, left: 20),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 350,
                                  height: 32,
                                  child: Text(
                                    snapshot.child("title").value.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ),
                                SizedBox(
                                  width: 270.0,
                                  height: 28,
                                  child: Text(
                                    snapshot.child("authors").value.toString(),
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

                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow.shade600,
                                        size: 16,
                                      ),
                                      Text(
                                        snapshot
                                            .child("average_rating")
                                            .value
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                      Text(
                                        '/ 5.0',
                                        style: TextStyle(
                                            color: Colors.grey[500],
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
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
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11),
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
                  SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: MaterialButton(
                      onPressed: () {
                        String bookID =
                            snapshot.child("bookID").value.toString();
                        String authors =
                            snapshot.child("authors").value.toString();
                        String average_rating =
                            snapshot.child("average_rating").value.toString();
                        String language_code =
                            snapshot.child("language_code").value.toString();
                        String num_pages =
                            snapshot.child("num_pages").value.toString();
                        String publication_date =
                            snapshot.child("publication_date").value.toString();
                        String publisher =
                            snapshot.child("publisher").value.toString();
                        String book_title =
                            snapshot.child("title").value.toString();
                        String ratings_count =
                            snapshot.child("ratings_count").value.toString();
                        String isbn13 =
                            snapshot.child("isbn13").value.toString();
                        String text_reviews_count = snapshot
                            .child("text_reviews_count")
                            .value
                            .toString();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BookDetailsForm(
                                  bookId: bookID,
                                  authors: authors,
                                  averageRating: average_rating,
                                  languageCode: language_code,
                                  numPages: num_pages,
                                  publicationDate: publication_date,
                                  publisher: publisher,
                                  bookTitle: book_title,
                                  ratingsCount: ratings_count,
                                  textReviewsCount: text_reviews_count,
                                  isbn13: isbn13)),
                        );
                      },
                    ),
                  ),
                ],
              );
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
        ));
  }
}
