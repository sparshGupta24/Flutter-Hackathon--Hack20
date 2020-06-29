// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'globalcovidstore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GlobalCovidStore on _GlobalCovidStore, Store {
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_GlobalCovidStore.isLoading'))
          .value;
  Computed<GlobalCovid> _$globalDataComputed;

  @override
  GlobalCovid get globalData =>
      (_$globalDataComputed ??= Computed<GlobalCovid>(() => super.globalData,
              name: '_GlobalCovidStore.globalData'))
          .value;

  final _$_isLoadingAtom = Atom(name: '_GlobalCovidStore._isLoading');

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

  final _$_globalDataAtom = Atom(name: '_GlobalCovidStore._globalData');

  @override
  GlobalCovid get _globalData {
    _$_globalDataAtom.reportRead();
    return super._globalData;
  }

  @override
  set _globalData(GlobalCovid value) {
    _$_globalDataAtom.reportWrite(value, super._globalData, () {
      super._globalData = value;
    });
  }

  final _$getGlobalCovidDataAsyncAction =
      AsyncAction('_GlobalCovidStore.getGlobalCovidData');

  @override
  Future getGlobalCovidData() {
    return _$getGlobalCovidDataAsyncAction
        .run(() => super.getGlobalCovidData());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
globalData: ${globalData}
    ''';
  }
}
