import 'package:flutter/material.dart';
import 'package:hack20_atomica/pages/quarantine/game_detail_page.dart';
import 'package:hack20_atomica/stores/movie_store/moviestore.dart';
import 'package:hack20_atomica/stores/game_store/gamestore.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/cupertino.dart';
import 'movie_detail_page.dart';

class QuarantineOne extends StatefulWidget {
  @override
  _QuarantineOneState createState() => _QuarantineOneState();
}

class _QuarantineOneState extends State<QuarantineOne> {
  MovieStore _movieStore = new MovieStore();
  GameStore _gameStore = new GameStore();
  @override
  void initState() {
    _movieStore.getCurrentLocation();
    _gameStore.getCurrentLocation(); // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                                  builder: (context) => MovieScreen(
                                      movie: _movieStore.movies[index]),
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
                                              _movieStore
                                                  .movies[index].director,
                                              style: TextStyle(
                                                  color: Color(0xffff00a8),
                                                  fontSize: 13,
                                                  fontWeight:
                                                      FontWeight.w100))),
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
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Respawn yourself",
                      style: TextStyle(color: Color(0xffff00a8), fontSize: 20)),
                  Text("Awaken the gamer within you",
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
                builder: (context) => _gameStore.isLoading
                    ? Container(
                        height: 50,
                        width: 50,
                        child: CupertinoActivityIndicator())
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _gameStore.games.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      GameScreen(game: _gameStore.games[index]),
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
                                              _gameStore.games[index].img),
                                          fit: BoxFit.cover,
                                        ),
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
                                          _gameStore.games[index].name,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      child: Container(
                                        child: Text(
                                          _gameStore.games[index].company,
                                          style: TextStyle(
                                              color: Color(0xffff00a8),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w100),
                                        ),
                                      ),
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
      ),
    );
  }
}
