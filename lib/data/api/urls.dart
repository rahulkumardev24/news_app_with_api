class AppUrls {
  /// API Keys /// Enter your Api Key
  static const API_KEY = "2229dabd1a32432ca9b279d40d523c6e";

  /// get all news
  static String getEveryThing(String newQuery) {
    return "https://newsapi.org/v2/everything?q=$newQuery&apiKey=$API_KEY";
  }

  /// get headlines
  static String getTopHeadlines(String country) {
    return "https://newsapi.org/v2/top-headlines?country=$country&apiKey=$API_KEY";
  }
}
