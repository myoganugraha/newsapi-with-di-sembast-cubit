import 'package:gabut/data/local/constant/db_constants.dart';
import 'package:gabut/data/local/datasources/news/news_datasource.dart';
import 'package:gabut/data/network/API/api.dart';
import 'package:gabut/data/repository.dart';
import 'package:gabut/di/modules/network_module.dart';
import 'package:gabut/utils/encryption/xxtea.dart';
import 'package:inject/inject.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

@module
class LocalModule extends NetworkModule {
  Future<Database> database;

  LocalModule() {
    database = provideDatabase();
  }

  @provide
  @singleton
  @asynchronous
  Future<Database> provideDatabase() async {
    var encryptionKey = "";

    final appDocumentDir = await getApplicationDocumentsDirectory();

    final dbPath = join(appDocumentDir.path, DBConstants.DB_NAME);

    var database;
    if (encryptionKey.isNotEmpty) {
      var codec = getXXTeaCodec(password: encryptionKey);
      database = await databaseFactoryIo.openDatabase(dbPath, codec: codec);
    } else {
      database = await databaseFactoryIo.openDatabase(dbPath);
    }
    return database;
  }

  @provide
  @singleton
  NewsDataSource provideNewsDataSource() => NewsDataSource(database);

  @provide
  @singleton
  Repository provideRepository(API api, NewsDataSource newsDataSource) =>
      Repository(newsDataSource, api);
}
