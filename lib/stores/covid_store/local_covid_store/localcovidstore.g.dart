// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localcovidstore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LocalCovidStore on _LocalCovidStore, Store {
  Computed<Position> _$positionComputed;

  @override
  Position get position =>
      (_$positionComputed ??= Computed<Position>(() => super.position,
              name: '_LocalCovidStore.position'))
          .value;
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_LocalCovidStore.isLoading'))
          .value;

  final _$_localCovidAtom = Atom(name: '_LocalCovidStore._localCovid');

  @override
  GlobalCovid get _localCovid {
    _$_localCovidAtom.reportRead();
    return super._localCovid;
  }

  @override
  set _localCovid(GlobalCovid value) {
    _$_localCovidAtom.reportWrite(value, super._localCovid, () {
      super._localCovid = value;
    });
  }

  final _$_isLoadingAtom = Atom(name: '_LocalCovidStore._isLoading');

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

  final _$_positionAtom = Atom(name: '_LocalCovidStore._position');

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

  final _$_countryAtom = Atom(name: '_LocalCovidStore._country');

  @override
  String get _country {
    _$_countryAtom.reportRead();
    return super._country;
  }

  @override
  set _country(String value) {
    _$_countryAtom.reportWrite(value, super._country, () {
      super._country = value;
    });
  }

  final _$_countAtom = Atom(name: '_LocalCovidStore._count');

  @override
  ObservableList<double> get _count {
    _$_countAtom.reportRead();
    return super._count;
  }

  @override
  set _count(ObservableList<double> value) {
    _$_countAtom.reportWrite(value, super._count, () {
      super._count = value;
    });
  }

  final _$getAddressFromLatLngAsyncAction =
      AsyncAction('_LocalCovidStore.getAddressFromLatLng');

  @override
  Future getAddressFromLatLng() {
    return _$getAddressFromLatLngAsyncAction
        .run(() => super.getAddressFromLatLng());
  }

  final _$getLocalCovidDataAsyncAction =
      AsyncAction('_LocalCovidStore.getLocalCovidData');

  @override
  Future getLocalCovidData() {
    return _$getLocalCovidDataAsyncAction.run(() => super.getLocalCovidData());
  }

  final _$_LocalCovidStoreActionController =
      ActionController(name: '_LocalCovidStore');

  @override
  dynamic getCurrentLocation() {
    final _$actionInfo = _$_LocalCovidStoreActionController.startAction(
        name: '_LocalCovidStore.getCurrentLocation');
    try {
      return super.getCurrentLocation();
    } finally {
      _$_LocalCovidStoreActionController.endAction(_$actionInfo);
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
