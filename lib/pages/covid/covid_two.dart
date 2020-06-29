import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class CovidTwo extends StatefulWidget {
  @override
  _CovidTwoState createState() => _CovidTwoState();
}

class _CovidTwoState extends State<CovidTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(height: 50,width: 50, child: FlareActor("assets/stop.flr", animation: "Untitled",))
      ],)
    );
  }
}