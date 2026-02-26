import 'package:dio/dio.dart';
import 'package:uses_app/api_key.dart';
import 'package:uses_app/article_model.dart';

class NewsService {
  final Dio _dio = Dio();

  Future<List<Article>> getTopHeadlines() async {
    try {
      final response = await _dio.get(
        'https://newsapi.org/v2/top-headlines',
        queryParameters: {
          'country': 'us',
          'apiKey': newsApiKey,
        },
      );

      final articles = (response.data['articles'] as List).map((article) {
        return Article.fromJson(article);
      }).toList();

      return articles;
    } on DioError catch (e) { // Changed to DioError
      // Print the actual error to the console
      print('Dio error!');
      print('URL: ${e.requestOptions.uri}');
      print('Message: ${e.message}');
      if (e.response != null) {
        print('Response status: ${e.response?.statusCode}');
        print('Response data: ${e.response?.data}');
      }
      // Re-throw the original exception to keep the UI behavior
      throw Exception('Failed to load top headlines');
    }
  }
}
