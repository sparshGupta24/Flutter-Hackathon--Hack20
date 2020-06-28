import 'package:flutter/material.dart';

class Weather {
  String city;
  String country;
  String weather;
  int temperature;
  int feelsLike;
  int maxTemp;
  int minTemp;
  int humidity;

  Weather(
      {this.city,
      this.country,
      this.weather,
      this.temperature,
      this.feelsLike,
      this.maxTemp,
      this.minTemp,
      this.humidity});
}
