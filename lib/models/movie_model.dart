import 'package:flutter/widgets.dart';

class Movie {
  String name;
  String about;
  String director;
  String rating;

  Movie(
      {@required this.name,
      @required this.about,
      @required this.director,
      @required this.rating});
}
