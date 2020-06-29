import 'package:flutter/widgets.dart';

class Movie {
  String name;
  String about;
  String director;
  String img;
  int rating;

  Movie(
      {@required this.name,
      @required this.about,
      @required this.director,
      @required this.img,
      @required this.rating});
}
