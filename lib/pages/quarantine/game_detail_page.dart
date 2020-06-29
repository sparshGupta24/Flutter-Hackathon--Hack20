import 'package:flutter/material.dart';
import 'package:hack20_atomica/models/game_model.dart';

class GameScreen extends StatelessWidget {
  Game game;
  GameScreen({this.game});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment(0, -1),
            child: Container(
              height: MediaQuery.of(context).size.height / 1.5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(game.img), fit: BoxFit.cover)),
            ),
          ),
          Align(
            alignment: Alignment(0, 1),
            child: ClipPath(
              clipper: TopClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        blurRadius: 20,
                        offset: Offset(0, -10))
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Color(0xff1b1b1b),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20, top: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        game.name,
                        style:
                            TextStyle(color: Color(0xffff00a8), fontSize: 35),
                      ),
                      Text(
                        game.company,
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        game.about,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Ratings: ${game.rating}/5",
                        style:
                            TextStyle(color: Color(0xffff00a8), fontSize: 19),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 30);
    path.arcToPoint(Offset(30, 0), radius: Radius.circular(30));
    path.lineTo(size.width - 30, 100);
    path.arcToPoint(Offset(size.width, 130), radius: Radius.circular(30));
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
