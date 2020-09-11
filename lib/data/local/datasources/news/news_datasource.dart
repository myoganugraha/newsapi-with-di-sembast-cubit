import 'package:gabut/data/local/constant/db_constants.dart';
import 'package:gabut/models/news/news.dart';
import 'package:sembast/sembast.dart';

class NewsDataSource {
  final _newsStore = intMapStoreFactory.store(DBConstants.STORE_NAME);

  final Future<Database> _db;

  NewsDataSource(this._db);

  Future<int> insert(News news) async {
    return await _newsStore.add(await _db, news.toJson());
  }

  Future<int> count() async {
    return await _newsStore.count(await _db);
  }

  Future<NewsList> getNewsFromDB() async {
    print('loading from database');

    var newsList;

    final recordSnapshots = await _newsStore.find(await _db);

    if (recordSnapshots.length > 0) {
      newsList = NewsList(
          articles: recordSnapshots.map((e) {
        final article = News.fromJson(e.value);
        return article;
      }).toList());
    }
    return newsList;
  }

  Future deleteAll() async {
    await _newsStore.drop(await _db);
  }
}
