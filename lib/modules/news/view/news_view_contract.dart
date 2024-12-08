import '../entity/news_article.dart';

abstract class NewsViewContract {
  void showLoading();
  void showNews(List<NewsArticle> news);
  void showError(String message);
}
