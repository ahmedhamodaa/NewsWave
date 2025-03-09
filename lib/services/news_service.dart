// services/news_service.dart
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:news_app/models/article_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);
  final String baseURL = 'https://newsapi.org/v2/';
  final String apiKey = '568f1e509ce14c978e5c4442edefc557';

  Future<List<ArticleModel>> getTopHeadlines({required String category}) async {
    try {
      var response = await dio.get(
        '${baseURL}top-headlines?country=us&apiKey=$apiKey&category=$category',
      );

      return _parseArticles(response.data);
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching news: $e');
      }
      throw Exception('Failed to load news: $e');
    }
  }

  Future<List<ArticleModel>> searchNews({required String query}) async {
    try {
      var response = await dio.get(
        '${baseURL}everything?q=$query&apiKey=$apiKey',
      );

      return _parseArticles(response.data);
    } catch (e) {
      if (kDebugMode) {
        print('Error searching news: $e');
      }
      throw Exception('Failed to search news: $e');
    }
  }

  List<ArticleModel> _parseArticles(Map<String, dynamic> jsonData) {
    if (jsonData['status'] != 'ok') {
      throw Exception(
        'API returned error: ${jsonData['message'] ?? 'Unknown error'}',
      );
    }

    List<dynamic> articles = jsonData['articles'];
    List<ArticleModel> articlesList = [];

    for (var article in articles) {
      // Handle null values gracefully
      final String? imageUrl = article['urlToImage'];
      final String? title = article['title'];
      final String? description = article['description'];

      // Skip articles with missing essential data
      if (title == null) continue;

      ArticleModel articleModel = ArticleModel(
        image: imageUrl ?? 'https://via.placeholder.com/150',
        title: title,
        description: description ?? 'No description available',
      );
      articlesList.add(articleModel);
    }

    return articlesList;
  }
}
