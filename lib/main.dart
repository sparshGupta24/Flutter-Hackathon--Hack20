import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MainApp()));
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool trying;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    trying = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1b1b1b),
      body: GestureDetector(
        onTap: () => setState(() {
          trying = true;
        }),
        child: Center(
          child: Container(
              width: MediaQuery.of(context).size.width / 2.1,
              child: FlareActor("assets/google_sign_in.flr",
                    fit: BoxFit.contain, animation: trying ? "go" : "idle"),
              ),
        ),
      ),
    );
  }
}
