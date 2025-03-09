// search/search_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/views/search/cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final NewsService newsService;

  SearchCubit({required this.newsService}) : super(SearchInitial());

  Future<void> searchNews(String query) async {
    if (query.trim().isEmpty) return;

    try {
      emit(SearchLoading());

      if (kDebugMode) {
        print('Searching news for query: $query');
      }

      final articles = await newsService.searchNews(query: query);
      emit(SearchLoaded(articles: articles, query: query));
    } catch (e) {
      if (kDebugMode) {
        print('Error searching news: $e');
      }
      emit(SearchError(message: 'Failed to search news: $e'));
    }
  }

  void resetSearch() {
    emit(SearchInitial());
  }
}
