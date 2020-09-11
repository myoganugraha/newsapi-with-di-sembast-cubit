import 'package:gabut/data/network/API/api.dart';
import 'package:gabut/data/network/rest_client.dart';
import 'package:inject/inject.dart';

@module
class NetworkModule {
  // ignore: non_constant_identifier_names
  final String TAG = "NetworkModule";

  @provide
  @singleton
  RestClient provideRestClient() => RestClient();

  @provide
  @singleton
  API provideAPI(RestClient restClient) => API(restClient);
}
