import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class TodayTwo extends StatefulWidget {
  @override
  _TodayTwoState createState() => _TodayTwoState();
}

class _TodayTwoState extends State<TodayTwo> {
  bool press;
  @override
  void initState() {
    press = false; // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Align(
          alignment: Alignment(1, -1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Container(
                    child: Text("GOOD things do grow on",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Container(
                    child: Text("Trees",
                        style:
                            TextStyle(color: Color(0xffff00a8), fontSize: 35)),
                  ),
                ),
                SizedBox(height: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        child: Text("Click to:",
                            style: TextStyle(
                              color: Colors.white,
                            )),
                      ),
                    ),
                    GestureDetector(
                        onTap: () => setState(() {
                              print(press);
                              press = !press;
                            }),
                        child: Container(
                          width: 150,
                          height: 60,
                          child: FlareActor(
                            "assets/button.flr",
                            fit: BoxFit.contain,
                            animation: press ? "press" : "idle",
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment(-1, 1),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.height * 0.3 / 731.6 * 904.9,
            child: FlareActor("assets/tree.flr",
                fit: BoxFit.cover, animation: "idle"),
          ),
        ),
      ],
    ));
  }
}
