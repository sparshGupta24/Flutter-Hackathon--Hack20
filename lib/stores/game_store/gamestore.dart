import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hack20_atomica/models/game_model.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'gamestore.g.dart';

class GameStore = _GameStore with _$GameStore;

abstract class _GameStore with Store {
  @observable
  bool _isLoading = true;
  @observable
  ObservableList<Game> _games = ObservableList<Game>();

  @computed
  ObservableList<Game> get games => _games;

  @computed
  bool get isLoading => _isLoading;

  @action
  getCurrentLocation() {
    _isLoading = true;
    Firestore.instance
        .collection("games")
        .getDocuments()
        .then((querySnapshot) {
      querySnapshot.documents.forEach((result) {
        Game element = new Game(
            name: result.data['name'],
            about: result.data['about'],
            company: result.data['company'],
            img: result.data['img'],
            rating: result.data['rating']);
        print(element.about);
        _games.add(element);
      });
    });
    print(_games);
    _isLoading = false;
  }
}
