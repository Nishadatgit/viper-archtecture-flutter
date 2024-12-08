import 'package:dio/dio.dart';
import '../../entity/news_article.dart';
import '../exceptions/network_exceptions.dart';

class NewsApiClient {
  final Dio dio;
  final String baseUrl;
  final String apiToken;

  NewsApiClient({
    required this.dio,
    this.baseUrl = 'https://api.thenewsapi.com/v1/news',
    required this.apiToken,
  });

  Future<List<NewsArticle>> fetchNews({int limit = 10}) async {
    try {
      final response = await dio.get(
        '$baseUrl/all',
        queryParameters: {
          'api_token': apiToken,
          'language': 'en',
          'limit': limit,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data['data'] as List<dynamic>;
        return data.map((e) => NewsArticle.fromJson(e)).toList();
      } else {
        throw NetworkException(
          message: 'Failed to fetch news',
          statusCode: response.statusCode,
        );
      }
    } on DioException catch (e) {
      throw NetworkException(
        message: e.message ?? 'Unknown network error',
        statusCode: e.response?.statusCode,
      );
    }
  }
}
