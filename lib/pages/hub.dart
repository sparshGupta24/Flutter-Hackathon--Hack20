import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hack20_atomica/models/user_model.dart';
import 'package:hack20_atomica/pages/quarantine/quarantine_one.dart';
import 'package:hack20_atomica/pages/quarantine/quarantine_two.dart';
import 'package:hack20_atomica/pages/today/today_one.dart';
import 'package:hack20_atomica/pages/today/today_two.dart';
import 'package:hack20_atomica/shared/main_page.dart';
import 'package:hack20_atomica/stores/auth_store/authstore.dart';

import 'covid/covid_one.dart';
import 'covid/covid_two.dart';

class Hub extends StatefulWidget {
  User user;
  Hub(user) {
    this.user = user;
  }
  @override
  _HubState createState() => _HubState(user);
}

class _HubState extends State<Hub> {
  PageController verticalController;
  int curr;
  User user;
  _HubState(user) {
    this.user = user;
  }

  @override
  void initState() {
    curr = 0;
    verticalController = PageController(
      initialPage: 0,
    ); // TODO: implement initState
    super.initState();
  }

  _verticalTab(String heading, int index) {
    return GestureDetector(
      onTap: () => setState(() {
        curr = index;
        print(curr);
        verticalController.animateToPage(index,
            duration: Duration(milliseconds: 300), curve: Curves.linear);
      }),
      child: RotationTransition(
        turns: new AlwaysStoppedAnimation(-90 / 360),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Text(
                heading,
                style: TextStyle(
                    color: curr == index ? Color(0xffFF00A8) : Colors.white,
                    fontWeight:
                        curr == index ? FontWeight.w400 : FontWeight.w200),
              ),
              Container(
                height: 4,
                width: 4,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        curr == index ? Color(0xffff00a8) : Colors.transparent),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1b1b1b),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              child: Container(
                child: Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.height * 0.08,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(user.img), fit: BoxFit.cover),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hi",
                                style: TextStyle(
                                    color: Color(0xffFF00A8), fontSize: 20),
                              ),
                              Text(
                                user.name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200,
                                    fontSize: 23),
                              )
                            ],
                          ),
                        ),
                      ),
                      Icon(
                        Icons.exit_to_app,
                        color: Colors.white70,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.75,
              color: Color(0xff1b1b1b),
              child: Row(
                children: [
                  Container(
                    color: Color(0xff1b1b1b),
                    height: MediaQuery.of(context).size.height * 0.75,
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        _verticalTab("TODAY", 0),
                        SizedBox(
                          height: 100,
                        ),
                        _verticalTab("QUARANTINE", 1),
                        SizedBox(
                          height: 100,
                        ),
                        _verticalTab("COVID TIMES", 2),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: PageView(
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      controller: verticalController,
                      children: [
                        TwinView(
                            TodayOne(), TodayTwo(), "WEATHER", "DO YOUR PART"),
                        TwinView(QuarantineOne(), QuarantineTwo(),
                            "RECOMENDATIONS", "USE YOUR TIME"),
                        TwinView(
                            CovidOne(), CovidTwo(), "CURRENT STATUS", "TIPS"),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
