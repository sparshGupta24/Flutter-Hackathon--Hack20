import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hack20_atomica/models/global_covid_model.dart';
import 'package:hack20_atomica/models/user_model.dart';
import 'package:hack20_atomica/models/weather_model.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'globalcovidstore.g.dart';
class GlobalCovidStore = _GlobalCovidStore with _$GlobalCovidStore;

abstract class _GlobalCovidStore with Store {
  @observable
  bool _isLoading;
  
  @observable
  GlobalCovid _globalData = new GlobalCovid();

  @computed
  bool get isLoading => _isLoading;

  @computed
  GlobalCovid get globalData => _globalData;

  @action
  getGlobalCovidData() async {
    _isLoading = true;
    var url = 'https://api.covid19api.com/summary';
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    var data = json.decode(response.body);
    print(data['Global']['TotalConfirmed']);
    _globalData.total = data['Global']['TotalConfirmed'];
    _globalData.newDeath = data['Global']['NewDeaths'];
    _globalData.newRecov = data['Global']['NewRecovered'];
    _globalData.totalDeath = data['Global']['TotalDeaths'];
    _globalData.totalRecov = data['Global']['TotalRecovered'];
    _isLoading = false;
  }
}
