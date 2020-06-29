import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hack20_atomica/models/movie_model.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'moviestore.g.dart';

class MovieStore = _MovieStore with _$MovieStore;

abstract class _MovieStore with Store {
  @observable
  bool _isLoading = true;
  @observable
  ObservableList<Movie> _movies = ObservableList<Movie>();

  @computed
  ObservableList<Movie> get movies => _movies;

  @computed
  bool get isLoading => _isLoading;

  @action
  getCurrentLocation() {
    _isLoading = true;
    Firestore.instance
        .collection("movies")
        .getDocuments()
        .then((querySnapshot) {
      querySnapshot.documents.forEach((result) {
        Movie element = new Movie(
            name: result.data['name'],
            about: result.data['about'],
            director: result.data['director'],
            img: result.data['img'],
            rating: result.data['rating']);
        print(element.about);
        _movies.add(element);
      });
    });
    _isLoading = false;
  }
}
