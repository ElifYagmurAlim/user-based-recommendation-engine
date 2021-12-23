import 'package:cloud_firestore/cloud_firestore.dart';

class Book {
  String authors;
  String average_rating;
  String bookID;
  String isbn;
  String language_code;
  String num_pages;
  String publication_date;
  String publisher;
  String ratings_count;
  String text_reviews_count;
  String title;

  Book(
      {required this.authors,
      required this.average_rating,
      required this.bookID,
      required this.isbn,
      required this.language_code,
      required this.num_pages,
      required this.publication_date,
      required this.publisher,
      required this.ratings_count,
      required this.text_reviews_count,
      required this.title});
}
