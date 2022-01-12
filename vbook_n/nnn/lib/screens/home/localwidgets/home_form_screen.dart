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
              return Stack(
                children: [
                  Container(
                      height: 100,
                      margin: EdgeInsets.symmetric(vertical: 1),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                                width: 72,
                                child: Image.network(snapshot
                                    .child("image_url")
                                    .value
                                    .toString())),
                            Container(
                              padding: EdgeInsets.only(
                                  top: 10, bottom: 10, left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 300,
                                    height: 32,
                                    child: Text(
                                      snapshot
                                          .child("original_title")
                                          .value
                                          .toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 270.0,
                                    height: 28,
                                    child: Text(
                                      snapshot
                                          .child("authors")
                                          .value
                                          .toString(),
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
                                                  .child(
                                                      "work_text_reviews_count")
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
                            )
                          ],
                        ),
                      )),
                  SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: MaterialButton(
                      onPressed: () {
                        String bookID =
                            snapshot.child("book_id").value.toString();
                        String authors =
                            snapshot.child("authors").value.toString();
                        String average_rating =
                            snapshot.child("average_rating").value.toString();
                        String language_code =
                            snapshot.child("language_code").value.toString();
                        String publication_date = snapshot
                            .child("original_publication_year")
                            .value
                            .toString();
                        String publisher =
                            snapshot.child("publisher").value.toString();
                        String book_title =
                            snapshot.child("original_title").value.toString();
                        String ratings_count =
                            snapshot.child("ratings_count").value.toString();
                        String isbn13 =
                            snapshot.child("isbn13").value.toString();
                        String text_reviews_count = snapshot
                            .child("work_text_reviews_count")
                            .value
                            .toString();
                        String imagePath =
                            snapshot.child("image_url").value.toString();
                        print(imagePath);
                        print("a");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BookDetailsForm(
                                  bookId: bookID,
                                  authors: authors,
                                  averageRating: average_rating,
                                  languageCode: language_code,
                                  publicationDate: publication_date,
                                  publisher: publisher,
                                  bookTitle: book_title,
                                  ratingsCount: ratings_count,
                                  textReviewsCount: text_reviews_count,
                                  isbn13: isbn13,
                                  imagePath: imagePath)),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }
}
