import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nnn/models/books.dart';
import 'package:nnn/screens/home/localwidgets/bookdetailswidgets/book_details_form_screen.dart';

class RecommendationFormScreen extends StatefulWidget {
  const RecommendationFormScreen(
      {Key? key, required this.lateargs, required this.imagePaths})
      : super(key: key);
  final List<Book> lateargs;
  final List<String> imagePaths;
  @override
  _RecommendationFormScreenState createState() =>
      _RecommendationFormScreenState();
}

class _RecommendationFormScreenState extends State<RecommendationFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("VBOOK"),
          backgroundColor: Colors.orange.shade600,
        ),
        body: ListView.builder(
          itemCount: widget.lateargs.length - 1,
          itemBuilder: (context, index) {
            return Stack(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10, left: 20),
                    margin: EdgeInsets.symmetric(vertical: 1),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Container(
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 350,
                                height: 32,
                                child: Text(
                                  widget.lateargs[index].title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ),
                              SizedBox(
                                width: 270.0,
                                height: 28,
                                child: Text(
                                  widget.lateargs[index].authors,
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
                                      rating: double.parse(widget
                                          .lateargs[index].average_rating),
                                      direction: Axis.horizontal,
                                      itemCount: 5,
                                      unratedColor: Colors.grey.shade700,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 1.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.yellow.shade800,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      widget.lateargs[index].average_rating,
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
                        ],
                      ),
                    )),
                SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: MaterialButton(
                    onPressed: () {
                      print(widget.lateargs[index].language_code);
                      String bookID = widget.lateargs[index].bookID;
                      String authors = widget.lateargs[index].authors;
                      String average_rating =
                          widget.lateargs[index].average_rating;
                      String language_code =
                          widget.lateargs[index].language_code;
                      String publication_date =
                          widget.lateargs[index].publication_date;
                      String publisher = widget.lateargs[index].publisher;
                      String book_title = widget.lateargs[index].title;
                      String ratings_count =
                          widget.lateargs[index].ratings_count;
                      String isbn13 = widget.lateargs[index].isbn13;
                      String text_reviews_count =
                          widget.lateargs[index].text_reviews_count;
                      String imagePath = widget.imagePaths[index];
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
        ));
  }
}
