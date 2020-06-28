import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hack20_atomica/models/user_model.dart';
import 'package:hack20_atomica/models/weather_model.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'weatherstore.g.dart';
class WeatherStore = _WeatherStore with _$WeatherStore;

abstract class _WeatherStore with Store {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  @observable
  Position position = Position();

  @observable
  String city;

  @observable
  Weather weatherData = new Weather();

  @action
  getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      position = position;
      getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  @action
  getAddressFromLatLng() async {
    try {
      print("andar aaye");
      geolocator
          .placemarkFromCoordinates(
              position.latitude, position.longitude)
          .then((value) {
        Placemark place = value[0];
        city = place.locality;
        getWeather();
      });
    } catch (e) {
      print("andar error aaye");
      print(e);
    }
  }

  @action
  getWeather() async {
    var url = 'http://api.openweathermap.org/data/2.5/weather?q=${city}&appid=f8a430b8c855411d441f62d191f66da6';
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    var data = json.decode(response.body);
    print(data['main']['temp']);
    weatherData.city = data['name'];
    weatherData.country = data['sys']['country'];
    weatherData.temperature = (data['main']['temp']-273).round();
    weatherData.feelsLike = (data['main']['feels_like']-273).round();
    weatherData.minTemp = (data['main']['temp_min']-273).round();
    weatherData.maxTemp = (data['main']['temp_max']-273).round();
    weatherData.humidity = data['main']['humidity'].round();
    weatherData.weather = data['weather'][0]['main'];
    print("done");
  }
  
}
