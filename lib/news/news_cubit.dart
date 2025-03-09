import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/news/news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsService newsService;

  NewsCubit({required this.newsService}) : super(NewsInitial());

  Future<void> getNewsByCategory(String category) async {
    try {
      emit(NewsLoading());

      if (kDebugMode) {
        print('Fetching news for category: $category');
      }

      final articles = await newsService.getTopHeadlines(category: category);
      emit(NewsLoaded(articles: articles));
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching news: $e');
      }
      emit(NewsError(message: 'Failed to load news: $e'));
    }
  }
}
