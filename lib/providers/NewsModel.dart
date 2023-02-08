import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsModel {
  final String title;
  final String description;
  final String url;
  final String urlToImage;

  NewsModel({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
  });
}

class News with ChangeNotifier {
  List<NewsModel> datatobeput = [];

  Future<void> getNews([String category = '']) async {
    datatobeput = [];
    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?category=$category&country=in&apiKey=ccba7962fcd44b5883deb51d413ff77e');
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    print(extractedData);
    if (extractedData['status'] == 'ok') {
      extractedData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          var newsModel = NewsModel(
            title: element['title'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
          );
          datatobeput.add(newsModel);
          notifyListeners();
        }
      });
    }
  }

  List<NewsModel> get news {
    return [...datatobeput];
  }
}
