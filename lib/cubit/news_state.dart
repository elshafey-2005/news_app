import 'package:uses_app/article_model.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsSuccess extends NewsState {
  final List<Article> articles;
  NewsSuccess(this.articles);
}

class NewsFailure extends NewsState {
  final String errorMessage;
  NewsFailure(this.errorMessage);
}
