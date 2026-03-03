import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uses_app/news_service.dart';
import 'package:uses_app/cubit/news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this.newsService) : super(NewsInitial());

  final NewsService newsService;

  Future<void> fetchNews() async {
    emit(NewsLoading());
    try {
      final articles = await newsService.getTopHeadlines();
      emit(NewsSuccess(articles));
    } catch (e) {
      emit(NewsFailure(e.toString()));
    }
  }
}
