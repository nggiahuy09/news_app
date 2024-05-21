import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/services/news_api.dart';

class NewsProvider extends ChangeNotifier {
  List<NewsModel> newsList = [];

  List<NewsModel> get getNewsList => newsList;

  Future<List<NewsModel>> fetchAllNews() async {
    newsList = await NewsApiServices.getAllNews();
    return newsList;
  }
}
