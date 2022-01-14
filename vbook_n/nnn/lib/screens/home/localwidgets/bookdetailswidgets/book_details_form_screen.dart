import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nnn/models/books.dart';
import 'package:nnn/models/ratings.dart';
import 'package:nnn/screens/home/home_screen.dart';
import 'package:nnn/services/database.dart';

class BookDetailsForm extends StatefulWidget {
  const BookDetailsForm({
    Key? key,
    required this.bookId,
    required this.authors,
    required this.averageRating,
    required this.languageCode,
    required this.publicationDate,
    required this.publisher,
    required this.bookTitle,
    required this.ratingsCount,
    required this.textReviewsCount,
    required this.isbn13,
    required this.imagePath,
  }) : super(key: key);
  final bookId;
  final authors;
  final averageRating;
  final languageCode;
  final publicationDate;
  final publisher;
  final bookTitle;
  final ratingsCount;
  final textReviewsCount;
  final isbn13;
  final imagePath;
  @override
  _BookDetailsFormState createState() => _BookDetailsFormState();
}

class _BookDetailsFormState extends State<BookDetailsForm> {
  bool _isVisible = true;
  double updateRate = 2.5;
  String userID = "";
  String isbn = "";
  String bookRate = "";
  String isbn13 = "";
  String bookTitle = "";
  String bookAuthor = "";
  String text_reviews_count = "";
  String imagePath = "";

  final FirebaseAuth auth = FirebaseAuth.instance;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void showRate(double rate) {
    setState(() {
      updateRate = rate;
    });
  }

  Future<String> addRate(String userID, String isbn, String bookRate) async {
    Rate rate = Rate(userID: "", isbn: "", bookRate: "");
    FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    String retVal = "Error";
    try {
      rate.userID = auth.currentUser!.uid;
      rate.isbn = isbn;
      rate.bookRate = bookRate;
      String _returnString = await VbookDatabase().createRatings(rate);
      if (_returnString == "Success") {
        retVal = "Success";
      }
    } catch (e) {
      print(e);
    }

    analytics.logEvent(name: 'rate', parameters: {
      'bookRate': bookRate,
    });
    return retVal;
  }

  Future<String> addBook(
    String userId,
    String title,
    String author,
    String rating,
    String text_reviews,
    String isbn13,
  ) async {
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
        title: "");
    String retVal = "Error";
    try {
      {
        book.userId = auth.currentUser!.uid;
        book.title = title;
        book.authors = author;
        book.average_rating = rating;
        book.text_reviews_count = text_reviews;
        book.isbn13 = isbn13;
      }
      String _returnString = await VbookDatabase().createBooks(book);
      if (_returnString == "Success") {
        retVal = "Success";
      }
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          toolbarHeight: 48,
        ),
        backgroundColor: Colors.grey.shade200,
        body: Stack(
          children: [
            Visibility(
                visible: _isVisible,
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5 - 136,
                      child: Image.network(
                        widget.imagePath,
                        scale: 1,
                        width: 300,
                        height: 300,
                      ),
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.5 + 64,
                        child: Card(
                          elevation: 1.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          color: Colors.white.withOpacity(0.5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 16),
                                child: Text(
                                  widget.bookTitle.toString(),
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.black),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "by ",
                                      style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Flexible(
                                        child: Text(
                                      widget.authors,
                                      style: TextStyle(
                                          color: Colors.green.shade700,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    )),
                                    Flexible(
                                        child: Text(
                                      " | ",
                                      style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 22),
                                    )),
                                    RatingBarIndicator(
                                      itemSize: 20,
                                      rating:
                                          double.parse(widget.averageRating),
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
                                      width: 10.0,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 18),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 60,
                                      margin: EdgeInsets.only(top: 20),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 18),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade400,
                                          borderRadius:
                                              BorderRadius.circular(9)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                'Rating',
                                                style: TextStyle(
                                                    color:
                                                        Colors.grey.shade800),
                                              ),
                                              SizedBox(
                                                height: 2,
                                              ),
                                              Text(
                                                widget.averageRating,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          VerticalDivider(
                                            color: Colors.grey.shade800,
                                            thickness: 1,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                'Text Reviews Count',
                                                style: TextStyle(
                                                    color:
                                                        Colors.grey.shade800),
                                              ),
                                              SizedBox(
                                                height: 2,
                                              ),
                                              Text(
                                                widget.textReviewsCount,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          VerticalDivider(
                                            color: Colors.grey.shade800,
                                            thickness: 1,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                'Language',
                                                style: TextStyle(
                                                    color:
                                                        Colors.grey.shade800),
                                              ),
                                              SizedBox(
                                                height: 2,
                                              ),
                                              Text(
                                                widget.languageCode,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                width: double.infinity,
                                margin: EdgeInsets.only(top: 30),
                                padding: EdgeInsets.symmetric(horizontal: 18),
                                child: TextButton(
                                  onPressed: () {
                                    showToast();
                                  },
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18))),
                                  child: Text(
                                    "Add to Library",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                )),
            Visibility(
              visible: !_isVisible,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 150, horizontal: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        children: [
                          Text(
                            "Please rate this book and add it to your completed books library.",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          RatingBar.builder(
                            initialRating: 2.5,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              showRate(rating);
                            },
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            updateRate.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 60),
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: TextButton(
                        onPressed: () {
                          addRate(auth.currentUser!.uid, widget.isbn13,
                              updateRate.toString());
                          addBook(
                              auth.currentUser!.uid,
                              widget.bookTitle,
                              widget.authors,
                              updateRate.toString(),
                              widget.textReviewsCount,
                              widget.isbn13);
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                              (route) => false);

                          //updateRateNavigator.pushAndRemoveUntil(
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18))),
                        child: Text(
                          "Add to Library",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: TextButton(
                        onPressed: () {
                          showToast();
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.grey.shade400,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18))),
                        child: Text(
                          "Back",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
