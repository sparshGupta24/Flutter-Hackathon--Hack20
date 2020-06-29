import 'package:flutter/widgets.dart';

class Game {
  String name;
  String about;
  String company;
  String img;
  int rating;

  Game(
      {@required this.name,
      @required this.about,
      @required this.company,
      @required this.img,
      @required this.rating});
}
