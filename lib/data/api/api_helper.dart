/// Here we craete Api Helper

import 'dart:convert';

import 'package:cloud_craft/data/api/urls.dart';
import 'package:cloud_craft/model/every_news_model.dart';
import 'package:http/http.dart' as http;

class ApiHelper {

  /// fetch very thing
  static Future<EveryNewsData?> fetchNews(String query) async {
    String url = AppUrls.getEveryThing(query);

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return EveryNewsData.fromJson(jsonData);
    } else {
      return null;
    }
  }

  /// heading fetching
  static Future<EveryNewsData?> topHeading(String country) async {
    String url = AppUrls.getEveryThing(country);
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return EveryNewsData.fromJson(jsonData);
    } else {
      return null;
    }
  }
}

/// Complete 
