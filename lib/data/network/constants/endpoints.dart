class Endpoints {
  Endpoints._();

  //base url
  static const String baseUrl = "http://newsapi.org/v2";

  //newsapi api key
  static const String apiKey = "";

  //top headlines endpoint
  static const String topHeadlines_endpoint =
      baseUrl + "/top-headlines?country=id&" + apiKey;
}
