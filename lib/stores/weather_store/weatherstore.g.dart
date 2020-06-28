// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weatherstore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WeatherStore on _WeatherStore, Store {
  Computed<Position> _$positionComputed;

  @override
  Position get position =>
      (_$positionComputed ??= Computed<Position>(() => super.position,
              name: '_WeatherStore.position'))
          .value;
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_WeatherStore.isLoading'))
          .value;

  final _$_isLoadingAtom = Atom(name: '_WeatherStore._isLoading');

  @override
  bool get _isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  final _$_positionAtom = Atom(name: '_WeatherStore._position');

  @override
  Position get _position {
    _$_positionAtom.reportRead();
    return super._position;
  }

  @override
  set _position(Position value) {
    _$_positionAtom.reportWrite(value, super._position, () {
      super._position = value;
    });
  }

  final _$_cityAtom = Atom(name: '_WeatherStore._city');

  @override
  String get _city {
    _$_cityAtom.reportRead();
    return super._city;
  }

  @override
  set _city(String value) {
    _$_cityAtom.reportWrite(value, super._city, () {
      super._city = value;
    });
  }

  final _$_weatherDataAtom = Atom(name: '_WeatherStore._weatherData');

  @override
  Weather get _weatherData {
    _$_weatherDataAtom.reportRead();
    return super._weatherData;
  }

  @override
  set _weatherData(Weather value) {
    _$_weatherDataAtom.reportWrite(value, super._weatherData, () {
      super._weatherData = value;
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
isLoading: ${isLoading}
    ''';
  }
}
