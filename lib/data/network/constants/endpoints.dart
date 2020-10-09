class Endpoints {
  Endpoints._();

  //base url
  static const String baseUrl = "http://newsapi.org/v2";

  //newsapi api key
  static const String apiKey = "apiKey=0011a3c08d6c44bc8e68eb7bce22b787";

  //top headlines endpoint
  static const String topHeadlines_endpoint =
      baseUrl + "/top-headlines?country=id&" + apiKey;
}
