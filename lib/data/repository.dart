import 'package:gabut/data/local/datasources/news/news_datasource.dart';
import 'package:gabut/data/network/API/api.dart';
import 'package:gabut/models/news/news.dart';

class Repository {
  final NewsDataSource _newsDataSource;
  final API _api;

  Repository(this._newsDataSource, this._api);

  Future<NewsList> getTopHeadlines() async {
    return await _newsDataSource.count() > 0
        ? _newsDataSource.getNewsFromDB().then((value) {
            print('dari db');
            return value;
          }).catchError((error) => throw error)
        : _api.getTopHeadlines().then((value) {
            value.articles.forEach((element) {
              _newsDataSource.insert(element);
            });
            return value;
          }).catchError((error) => throw error);
  }
}
