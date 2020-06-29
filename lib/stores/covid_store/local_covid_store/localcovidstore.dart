import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hack20_atomica/models/global_covid_model.dart';
import 'package:hack20_atomica/models/user_model.dart';
import 'package:hack20_atomica/models/weather_model.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'localcovidstore.g.dart';
class LocalCovidStore = _LocalCovidStore with _$LocalCovidStore;

abstract class _LocalCovidStore with Store {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  @observable
  GlobalCovid _localCovid = new GlobalCovid();

  @observable
  bool _isLoading = true;

  @observable
  Position _position = Position();

  @observable
  String _country;

  @observable
  ObservableList<double> _count = ObservableList<double>();

  @computed
  Position get position => _position;
  String get country => _country;
  ObservableList<double> get count => _count;
  GlobalCovid get localCovid => _localCovid;

  @computed
  bool get isLoading => _isLoading;

  @action
  getCurrentLocation() {
    _isLoading = true;
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position positionFound) {
      _position = positionFound;
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
              _position.latitude, _position.longitude)
          .then((value) {
            print("placemark then mein");
        Placemark place = value[0];
        _country = place.country;
            print("country set");
        getLocalCovidData();
      });
    } catch (e) {
      print("andar error aaye");
      print(e);
    }
  }

  @action
  getLocalCovidData() async {
    var url = 'https://api.covid19api.com/country/$_country/status/confirmed';
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    var data = json.decode(response.body);
    for(int i = 0 ; i < data.length ; i++)
    _count.add(data[i]['Cases'].toDouble());
    _localCovid.total = data[data.length - 1]['Cases'];
    _isLoading = false;
  }

  
}
