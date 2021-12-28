import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AddToLibForm extends StatefulWidget {
  const AddToLibForm({Key? key}) : super(key: key);

  @override
  _AddToLibFormState createState() => _AddToLibFormState();
}

class _AddToLibFormState extends State<AddToLibForm> {
  bool _isVisible = true;
  double updateRate = 2.5;
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

  @override
  Widget build(BuildContext context) {
    return Visibility(
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
                    glowColor: Colors.orange,
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
                    height: 20,
                  ),
                  Text(
                    "Rating: " + updateRate.toString(),
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
                  //updateRate
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
    );
  }
}
