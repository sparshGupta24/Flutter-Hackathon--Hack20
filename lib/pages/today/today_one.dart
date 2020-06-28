import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:geolocator/geolocator.dart';
import 'package:hack20_atomica/stores/news_store/newsstore.dart';
import 'package:hack20_atomica/stores/weather_store/weatherstore.dart';
import 'package:url_launcher/url_launcher.dart';

class TodayOne extends StatefulWidget {
  @override
  _TodayOneState createState() => _TodayOneState();
}

class _TodayOneState extends State<TodayOne> {
  WeatherStore weatherStore = new WeatherStore();
  NewsStore newsStore = new NewsStore();

  @override
  void initState() {
    if (weatherStore.isLoading) weatherStore.getCurrentLocation();
    newsStore.getNews();
    // TODO: implement initState
    super.initState();
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    builder: (context) => weatherStore.isLoading
                        ? Container(height: 50,width:50,child: CupertinoActivityIndicator(),)
                        : Row(
                            children: [
                              Icon(
                                weatherStore.weather.weather
                                                .compareTo("Haze") ==
                                            0 ||
                                        weatherStore.weather.weather
                                                .compareTo("Rainy") ==
                                            0
                                    ? Icons.wb_cloudy
                                    : Icons.wb_sunny,
                                color: Color(0xffff00a8),
                                size: 45,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        weatherStore.weather.city +
                                            ", " +
                                            weatherStore.weather.country,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w100),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            weatherStore.weather.temperature
                                                    .toString() +
                                                "°C",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25),
                                          ),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 3.0),
                                            child: Text(
                                              "feels like " +
                                                  weatherStore.weather.feelsLike
                                                      .toString() +
                                                  "°C",
                                              style: TextStyle(
                                                  color: Color(0xffff00a8),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w100),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.ac_unit,
                                            color: Color(0xffff00a8),
                                            size: 15,
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            "Min: " +
                                                weatherStore.weather.minTemp
                                                    .toString() +
                                                "  Max: " +
                                                weatherStore.weather.maxTemp
                                                    .toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w100),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.hot_tub,
                                            color: Color(0xffff00a8),
                                            size: 15,
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            "Humidity: " +
                                                weatherStore.weather.humidity
                                                    .toString() +
                                                "%",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w100),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text("Get started",
                    style: TextStyle(color: Colors.white, fontSize: 20),),),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10, left: 10),
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
                  padding:
                      const EdgeInsets.only(left: 20.0, top: 20, bottom: 20),
                  child: Observer(
                    builder: (context) => newsStore.isLoading
                        ? Container(height: 100,width:50,child: CupertinoActivityIndicator(),)
                        : GestureDetector(
                            onTap: () => _launchURL(newsStore.news.url),
                            child: Column(
                              children: [
                                Container(
                                  height: 135,
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20)),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          NetworkImage(newsStore.news.imgUrl),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15),
                                Container(
                                  width: double.maxFinite,
                                  child: Text(
                                    newsStore.news.title,
                                    style: TextStyle(
                                      color: Color(0xffff00a8),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 4),
                                Container(
                                  width: double.maxFinite,
                                  child: Text(
                                    "source: "+newsStore.news.source,
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w100
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  width: double.maxFinite,
                                  child: Text(
                                    newsStore.news.description,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100,
                                        fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
