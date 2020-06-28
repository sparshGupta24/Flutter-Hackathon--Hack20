import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:geolocator/geolocator.dart';
import 'package:hack20_atomica/stores/weather_store/weatherstore.dart';

class TodayOne extends StatefulWidget {
  @override
  _TodayOneState createState() => _TodayOneState();
}

class _TodayOneState extends State<TodayOne> {
  WeatherStore weatherStore = new WeatherStore();

  @override
  void initState() {
    if (weatherStore.city == null) weatherStore.getCurrentLocation();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 10),
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
              padding: const EdgeInsets.all(20.0),
              child: Observer(
                  builder: (context) => weatherStore.weatherData.weather == null
                      ? CircularProgressIndicator()
                      : Row(
                          children: [
                            Icon(weatherStore.weatherData.weather
                                            .compareTo("Haze") ==
                                        0 ||
                                    weatherStore.weatherData.weather
                                            .compareTo("Rainy") ==
                                        0
                                ? Icons.wb_incandescent
                                : Icons.wb_sunny, color: Color(0xffff00a8),size: 45,)
                          ],
                        )),
            ),
          ),
        )
      ],
    ));
  }
}
