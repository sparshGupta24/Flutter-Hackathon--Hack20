import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class CovidTwo extends StatefulWidget {
  @override
  _CovidTwoState createState() => _CovidTwoState();
}

class _CovidTwoState extends State<CovidTwo> {
  _tipcard(String doing, String what){
    return Padding(
            padding: const EdgeInsets.only(top:5.0, left: 5.0, bottom: 5.0),
            child: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                      color: Color(0xff1b1b1b),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black54,
                            blurRadius: 5,
                            offset: Offset(0, 0))
                      ]),
              child: Padding(
                padding: EdgeInsets.only(top:20.0, right: 30.0, bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  
                  Text("$doing ",style: TextStyle(color: Color(0xffff00a8), fontSize: 25),),
                  Text(what,style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w100),),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(height: 5, width: 5, decoration: BoxDecoration(color: Colors.white, shape:BoxShape.circle),),
                  ),
                ],),
              ),
            ),
          );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
                  child: Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 20),
      child: Column(
          children: [
            Container(
                height: 50,
                width: 50,
                child: FlareActor(
                  "assets/stop.flr",
                  animation: "Untitled",
                )),
            Text(
              "STAY HOME.SAVE LIVES.",
              style: TextStyle(color: Color(0xffff00a8), fontSize: 25),
            ),
            Text(
              "Help stop coronavirus",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            SizedBox(height: 20,),
            _tipcard("Stay", "Home"),
            _tipcard("keep", "distance"),
            _tipcard("wash", "Hands"),
            _tipcard("Cover", "your"),
            _tipcard("Sick?", "Call"),

          ],
      ),
    ),
        ));
  }
}
