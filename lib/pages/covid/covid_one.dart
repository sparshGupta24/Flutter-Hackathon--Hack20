import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:hack20_atomica/models/global_covid_model.dart';
import 'package:hack20_atomica/stores/covid_store/global_covid_store/globalcovidstore.dart';
import 'package:hack20_atomica/stores/covid_store/local_covid_store/localcovidstore.dart';
import 'package:hack20_atomica/stores/weather_store/weatherstore.dart';

class CovidOne extends StatefulWidget {
  @override
  _CovidOneState createState() => _CovidOneState();
}

class _CovidOneState extends State<CovidOne> {
  GlobalCovidStore _globalCovidStore = new GlobalCovidStore();
  LocalCovidStore _localCovidStore = new LocalCovidStore();

  @override
  void initState() {
    _localCovidStore.getCurrentLocation();
    _globalCovidStore.getGlobalCovidData(); // TODO: implement initState
    super.initState();
  }

  _columnTwin(
      {int count, String label, double size = 20, String align = "Center"}) {
    return Column(
      crossAxisAlignment: align.compareTo("Left") == 0
          ? CrossAxisAlignment.start
          : align.compareTo("Right") == 0
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.center,
      children: [
        Text(
          count.toString(),
          style: TextStyle(
              color: Colors.white, fontSize: size, fontWeight: FontWeight.w100),
        ),
        Text(
          label,
          style:
              TextStyle(color: Color(0xffff00a8), fontWeight: FontWeight.w100),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Observer(builder: (context) => _localCovidStore.isLoading?CupertinoActivityIndicator():Text(_localCovidStore.count[20].toString()),)
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 10),
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Color(0xff1b1b1b),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 10,
                      offset: Offset(0, 0),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Observer(
                    builder: (context) => !_localCovidStore.isLoading
                        ? Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 3.0),
                                      child: Text("YOUR CURRENT LOCATION: ", style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w100),),
                                    ),
                                    Text(
                                      _localCovidStore.country,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xffff00a8),
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    _localCovidStore.localCovid.total
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 3.0),
                                    child: Text(
                                      "   Total Count",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xffff00a8)),
                                    ),
                                  ),
                                ],
                              ),
                              
                              SizedBox(height: 10),
                              Container(
                                decoration: BoxDecoration(color: Color(0xff101010), borderRadius: BorderRadius.all(Radius.circular(20))),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Sparkline(
                                    data: _localCovidStore.count.toList(),
                                    lineColor: Color(0xffff00a8),
                                    pointsMode: PointsMode.last,
                                    pointSize: 8.0,
                                    pointColor: Colors.white,
                                    fillMode: FillMode.below,
                                    fillColor: Color(0x77ff00a8),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : CupertinoActivityIndicator(),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 10),
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Color(0xff1b1b1b),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 10,
                      offset: Offset(0, 0),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Observer(
                    builder: (context) => !_globalCovidStore.isLoading
                        ? Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "The world",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xffff00a8),
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    _globalCovidStore.globalData.total
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5.0),
                                    child: Text(
                                      "   Total Count",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xffff00a8)),
                                    ),
                                  ),
                                ],
                              ),
                              // _columnTwin(
                              //     count: _globalCovidStore.globalData.total,
                              //     label: "Total count",
                              //     size: 30),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _columnTwin(
                                      count: _globalCovidStore
                                          .globalData.totalDeath,
                                      label: "Total deaths",
                                      align: "Right"),
                                  SizedBox(width: 15),
                                  _columnTwin(
                                      count: _globalCovidStore
                                          .globalData.totalRecov,
                                      label: "Total recovered",
                                      align: "Left"),
                                ],
                              ),
                              SizedBox(height: 10),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _columnTwin(
                                      count:
                                          _globalCovidStore.globalData.newDeath,
                                      label: "New deaths",
                                      align: "Right"),
                                  SizedBox(width: 15),
                                  _columnTwin(
                                      count:
                                          _globalCovidStore.globalData.newRecov,
                                      label: "New recovered",
                                      align: "Left"),
                                ],
                              ),
                              SizedBox(height: 10),
                            ],
                          )
                        : CupertinoActivityIndicator(),
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
