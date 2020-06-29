import 'dart:convert';
import 'package:hack20_atomica/models/news_model.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
part 'newsstore.g.dart';
class NewsStore = _NewsStore with _$NewsStore;

abstract class _NewsStore with Store {
  
  @observable
  bool _isLoading = true;

  @observable
  News _news = new News();

  @computed
  News get news => _news;

  @computed
  bool get isLoading => _isLoading;

  @action
  getNews() async {
    var url = 'http://newsapi.org/v2/everything?q=earth&from=${DateFormat('yyyy-MM-dd').format(new DateTime.now())}&sortBy=publishedAt&apiKey=680f2aeff8ad42b1a8cc578b5a8a6e01';
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    var data = json.decode(response.body);
    _news.source = data['articles'][0]['source']['name'];
    _news.title = data['articles'][0]['title'];
    _news.content = data['articles'][0]['content'];
    _news.imgUrl = data['articles'][0]['urlToImage'];
    _news.url = data['articles'][0]['url'];
    _news.description = data['articles'][0]['description']; 
    _isLoading = false;
      }
  
}
