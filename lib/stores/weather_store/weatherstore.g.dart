// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weatherstore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WeatherStore on _WeatherStore, Store {
  final _$positionAtom = Atom(name: '_WeatherStore.position');

  @override
  Position get position {
    _$positionAtom.reportRead();
    return super.position;
  }

  @override
  set position(Position value) {
    _$positionAtom.reportWrite(value, super.position, () {
      super.position = value;
    });
  }

  final _$cityAtom = Atom(name: '_WeatherStore.city');

  @override
  String get city {
    _$cityAtom.reportRead();
    return super.city;
  }

  @override
  set city(String value) {
    _$cityAtom.reportWrite(value, super.city, () {
      super.city = value;
    });
  }

  final _$weatherDataAtom = Atom(name: '_WeatherStore.weatherData');

  @override
  Weather get weatherData {
    _$weatherDataAtom.reportRead();
    return super.weatherData;
  }

  @override
  set weatherData(Weather value) {
    _$weatherDataAtom.reportWrite(value, super.weatherData, () {
      super.weatherData = value;
    });
  }

  final _$getAddressFromLatLngAsyncAction =
      AsyncAction('_WeatherStore.getAddressFromLatLng');

  @override
  Future getAddressFromLatLng() {
    return _$getAddressFromLatLngAsyncAction
        .run(() => super.getAddressFromLatLng());
  }

  final _$getWeatherAsyncAction = AsyncAction('_WeatherStore.getWeather');

  @override
  Future getWeather() {
    return _$getWeatherAsyncAction.run(() => super.getWeather());
  }

  final _$_WeatherStoreActionController =
      ActionController(name: '_WeatherStore');

  @override
  dynamic getCurrentLocation() {
    final _$actionInfo = _$_WeatherStoreActionController.startAction(
        name: '_WeatherStore.getCurrentLocation');
    try {
      return super.getCurrentLocation();
    } finally {
      _$_WeatherStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
position: ${position},
city: ${city},
weatherData: ${weatherData}
    ''';
  }
}
