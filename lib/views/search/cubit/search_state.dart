// search/search_state.dart
import 'package:equatable/equatable.dart';
import 'package:news_app/models/article_model.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<ArticleModel> articles;
  final String query;

  const SearchLoaded({required this.articles, required this.query});

  @override
  List<Object?> get props => [articles, query];
}

class SearchError extends SearchState {
  final String message;

  const SearchError({required this.message});

  @override
  List<Object?> get props => [message];
}
