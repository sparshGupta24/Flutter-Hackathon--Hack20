// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gamestore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GameStore on _GameStore, Store {
  Computed<ObservableList<Game>> _$gamesComputed;

  @override
  ObservableList<Game> get games =>
      (_$gamesComputed ??= Computed<ObservableList<Game>>(() => super.games,
              name: '_GameStore.games'))
          .value;
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading => (_$isLoadingComputed ??=
          Computed<bool>(() => super.isLoading, name: '_GameStore.isLoading'))
      .value;

  final _$_isLoadingAtom = Atom(name: '_GameStore._isLoading');

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

  final _$_gamesAtom = Atom(name: '_GameStore._games');

  @override
  ObservableList<Game> get _games {
    _$_gamesAtom.reportRead();
    return super._games;
  }

  @override
  set _games(ObservableList<Game> value) {
    _$_gamesAtom.reportWrite(value, super._games, () {
      super._games = value;
    });
  }

  final _$_GameStoreActionController = ActionController(name: '_GameStore');

  @override
  dynamic getCurrentLocation() {
    final _$actionInfo = _$_GameStoreActionController.startAction(
        name: '_GameStore.getCurrentLocation');
    try {
      return super.getCurrentLocation();
    } finally {
      _$_GameStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
games: ${games},
isLoading: ${isLoading}
    ''';
  }
}
