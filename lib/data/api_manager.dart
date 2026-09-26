import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:news_app/data/news_model.dart';

class ApiManager {
static Future<NewsModel> getNews() async {

    Uri url = Uri.https("newsapi.org", "/v2/everything", {
      "q": "bitcoin",
      "apiKey": "214c849e84254189b7d3fd5d7d7a6c17",
    });
    var response = await http.get(url);
    var responseString = response.body;
   var json = jsonDecode(responseString);

     return NewsModel.fromJson(json);
  }
}
