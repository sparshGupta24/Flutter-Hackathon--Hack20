// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newsstore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewsStore on _NewsStore, Store {
  Computed<News> _$newsComputed;

  @override
  News get news => (_$newsComputed ??=
          Computed<News>(() => super.news, name: '_NewsStore.news'))
      .value;
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading => (_$isLoadingComputed ??=
          Computed<bool>(() => super.isLoading, name: '_NewsStore.isLoading'))
      .value;

  final _$_isLoadingAtom = Atom(name: '_NewsStore._isLoading');

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

  final _$_newsAtom = Atom(name: '_NewsStore._news');

  @override
  News get _news {
    _$_newsAtom.reportRead();
    return super._news;
  }

  @override
  set _news(News value) {
    _$_newsAtom.reportWrite(value, super._news, () {
      super._news = value;
    });
  }

  final _$getNewsAsyncAction = AsyncAction('_NewsStore.getNews');

  @override
  Future getNews() {
    return _$getNewsAsyncAction.run(() => super.getNews());
  }

  @override
  String toString() {
    return '''
news: ${news},
isLoading: ${isLoading}
    ''';
  }
}
