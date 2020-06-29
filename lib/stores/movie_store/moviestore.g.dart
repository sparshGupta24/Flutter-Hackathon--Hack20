// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moviestore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieStore on _MovieStore, Store {
  Computed<ObservableList<Movie>> _$moviesComputed;

  @override
  ObservableList<Movie> get movies =>
      (_$moviesComputed ??= Computed<ObservableList<Movie>>(() => super.movies,
              name: '_MovieStore.movies'))
          .value;
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading => (_$isLoadingComputed ??=
          Computed<bool>(() => super.isLoading, name: '_MovieStore.isLoading'))
      .value;

  final _$_isLoadingAtom = Atom(name: '_MovieStore._isLoading');

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

  final _$_moviesAtom = Atom(name: '_MovieStore._movies');

  @override
  ObservableList<Movie> get _movies {
    _$_moviesAtom.reportRead();
    return super._movies;
  }

  @override
  set _movies(ObservableList<Movie> value) {
    _$_moviesAtom.reportWrite(value, super._movies, () {
      super._movies = value;
    });
  }

  final _$_MovieStoreActionController = ActionController(name: '_MovieStore');

  @override
  dynamic getCurrentLocation() {
    final _$actionInfo = _$_MovieStoreActionController.startAction(
        name: '_MovieStore.getCurrentLocation');
    try {
      return super.getCurrentLocation();
    } finally {
      _$_MovieStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movies: ${movies},
isLoading: ${isLoading}
    ''';
  }
}
