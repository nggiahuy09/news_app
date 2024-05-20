// import 'dart:developer';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/consts/api_consts.dart';
import 'package:news_app/consts/https_exception.dart';
import 'package:news_app/models/news_model.dart';

class NewsApiServices {
  static Future<List<NewsModel>> getAllNews() async {
    // Uri url = Uri.parse(
    //   'https://newsapi.org/v2/everything?q=bitcoin&pageSize=10&apiKey=5a44e741bd69437a83022735fd64b1e6',
    // );

    try {
      Uri uri = Uri.https(
        BASE_URL,
        'v2/everything',
        {
          'q': 'bitcoin',
          'pageSize': '10',
          'apiKey': API_KEY,
        },
      );

      var response = await http.get(
        uri,
        headers: {
          'X-Api-key': API_KEY,
        },
      );

      Map data = jsonDecode(response.body);

      // use to contain data in 'articles' field
      List newsTempList = [];

      if (data['code'] != null) {
        throw HttpsException(data['code']);
      }

      for (var n in data['articles']) {
        newsTempList.add(n);
      }

      return NewsModel.newsFromSnapShot(newsTempList);
    } on HttpsException catch (err) {
      throw (err.toString());
    }
  }
}
