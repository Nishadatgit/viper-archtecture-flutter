import '../data/network/api_client.dart';
import '../entity/news_article.dart';

abstract class NewsInteractor {
  Future<List<NewsArticle>> fetchNews({int limit});
}

class NewsInteractorImpl implements NewsInteractor {
  final NewsApiClient apiClient;

  NewsInteractorImpl({required this.apiClient});

  @override
  Future<List<NewsArticle>> fetchNews({int limit = 10}) async {
    try {
      return await apiClient.fetchNews(limit: limit);
    } catch (e) {
      rethrow;
    }
  }
}
