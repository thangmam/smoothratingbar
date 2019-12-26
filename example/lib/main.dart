import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rating bar demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
            child: SmoothStarRating(
          rating: rating,
          size: 65,
          filledIconData: Icons.star,
          halfFilledIconData: Icons.star_half,
          defaultIconData: Icons.star_border,
          starCount: 5,
          allowHalfRating: false,
          spacing: 2.0,
          onRatingChanged: (value) {
            setState(() {
              rating = value;
            });
          },
        )),
      ),
    );
  }
}
