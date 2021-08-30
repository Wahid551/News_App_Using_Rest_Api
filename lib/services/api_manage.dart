import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rest_api_news_app/constants/Strings.dart';
import 'package:rest_api_news_app/models/news_info.dart';

class API_Manager {
  Future<Welcome> getNews() async {
    var client = http.Client();
    // ignore: non_constant_identifier_names
    var NewsModel;
    try {
      var url = Uri.parse(Strings.news_url);
      var response = await client.get(url);
      print(response.statusCode);

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = jsonDecode(jsonString);
        NewsModel = Welcome.fromJson(jsonMap);
      }
    } catch (Exception) {
      return NewsModel;
    }
    return NewsModel;
  }
}
