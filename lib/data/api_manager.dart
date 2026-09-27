import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/result_api.dart';
import 'package:news_app/data/news_model.dart';

class ApiManager {
  static Future<ResultApi<NewsModel>> getNews() async {
    try {
      Uri url = Uri.https("newsapi.org", "/v2/everything", {
        "q": "bitcoin",
        "apiKey": "214c849e84254189b7d3fd5d7d7a6c17",
      });
      var response = await http.get(url);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        var responseString = response.body;
        var json = jsonDecode(responseString);

        return Success(NewsModel.fromJson(json));
      } else {
        return Error("Error from server");
      }
      
    } catch (e) {
      return Error("Error $e");
    }
  }
}
