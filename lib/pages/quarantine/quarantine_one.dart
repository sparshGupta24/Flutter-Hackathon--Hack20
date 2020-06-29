import 'package:flutter/material.dart';
import 'package:hack20_atomica/stores/movie_store/moviestore.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/cupertino.dart';
import 'package:hack20_atomica/models/movie_model.dart';

class QuarantineOne extends StatefulWidget {
  @override
  _QuarantineOneState createState() => _QuarantineOneState();
}

class _QuarantineOneState extends State<QuarantineOne> {
  MovieStore _movieStore = new MovieStore();
  @override
  void initState() {
    _movieStore.getCurrentLocation(); // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Something to binge",
                    style: TextStyle(color: Color(0xffff00a8), fontSize: 20)),
                Text("This time won't come back, eh?",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w100)),
              ],
            ),
          ),
          Container(
            height: 270,
            child: Observer(
              builder: (context) => _movieStore.isLoading
                  ? Container(
                      child: CupertinoActivityIndicator(),
                      height: 50,
                      width: 50,
                    )
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _movieStore.movies.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Screen(movie: _movieStore.movies[index]),
                              )),
                          child: Container(
                            width: 180,
                            decoration: BoxDecoration(
                                color: Color(0xff1b1b1b),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black54,
                                      blurRadius: 5,
                                      offset: Offset(0, 0))
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              _movieStore.movies[index].img),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30),
                                        bottomLeft: Radius.circular(30),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                        child: Text(
                                            _movieStore.movies[index].name,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20))),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    child: Container(
                                        child: Text(
                                            _movieStore.movies[index].director,
                                            style: TextStyle(
                                                color: Color(0xffff00a8),
                                                fontSize: 13,
                                                fontWeight: FontWeight.w100))),
                                  ),
                                ],
                              ),
                            ),
                          ),
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

class Screen extends StatelessWidget {
  Movie movie;
  Screen({this.movie});
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
                      image: NetworkImage(movie.img), fit: BoxFit.cover)),
            ),
          ),
          Align(
            alignment: Alignment(0, 1),
            child: ClipPath(
              clipper: TopClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
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
                        movie.name,
                        style:
                            TextStyle(color: Color(0xffff00a8), fontSize: 35),
                      ),
                      Text(
                        movie.director,
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        movie.about,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Ratings: ${movie.rating}/5",
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
