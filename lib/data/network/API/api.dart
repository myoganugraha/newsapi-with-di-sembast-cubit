import 'dart:async';

import 'package:gabut/data/network/constants/endpoints.dart';
import 'package:gabut/data/network/exceptions/network_exceptions.dart';
import 'package:gabut/data/network/rest_client.dart';

import 'package:gabut/models/news/news.dart';

class API {
  final RestClient _restClient;

  API(this._restClient);

  Future<NewsList> getTopHeadlines() async {
    return _restClient
        .get(Endpoints.topHeadlines_endpoint)
        .then((value) => NewsList.fromJson(value))
        .catchError((onError) => throw NetworkException(message: onError));
  }
}
