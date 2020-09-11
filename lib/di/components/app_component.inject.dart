import 'app_component.dart' as _i1;
import '../modules/local_module.dart' as _i2;
import '../../data/network/rest_client.dart' as _i3;
import '../../data/network/API/api.dart' as _i4;
import '../../data/local/datasources/news/news_datasource.dart' as _i5;
import '../../data/repository.dart' as _i6;
import 'dart:async' as _i7;
import '../modules/network_module.dart' as _i8;
import '../../main.dart' as _i9;

class AppComponent$Injector implements _i1.AppComponent {
  AppComponent$Injector._(this._localModule);

  final _i2.LocalModule _localModule;

  _i3.RestClient _singletonRestClient;

  _i4.API _singletonAPI;

  _i5.NewsDataSource _singletonNewsDataSource;

  _i6.Repository _singletonRepository;

  static _i7.Future<_i1.AppComponent> create(
      _i8.NetworkModule _, _i2.LocalModule localModule) async {
    final injector = AppComponent$Injector._(localModule);

    return injector;
  }

  _i6.Repository _createRepository() => _singletonRepository ??=
      _localModule.provideRepository(_createAPI(), _createNewsDataSource());
  _i4.API _createAPI() =>
      _singletonAPI ??= _localModule.provideAPI(_createRestClient());
  _i3.RestClient _createRestClient() =>
      _singletonRestClient ??= _localModule.provideRestClient();
  _i5.NewsDataSource _createNewsDataSource() =>
      _singletonNewsDataSource ??= _localModule.provideNewsDataSource();
  @override
  _i9.GabutMovieApp get app => _i9.GabutMovieApp();
  @override
  _i6.Repository getRepository() => _createRepository();
}
