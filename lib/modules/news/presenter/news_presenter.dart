import '../interactor/news_interactor.dart';
import '../router/news_router.dart';
import '../view/news_view_contract.dart';
import '../data/exceptions/network_exceptions.dart';

class NewsPresenter {
  final NewsViewContract view;
  final NewsInteractor interactor;
  final NewsRouter router;

  NewsPresenter({
    required this.view,
    required this.interactor,
    required this.router,
  });

  Future<void> fetchNews() async {
    view.showLoading();
    try {
      final news = await interactor.fetchNews();
      view.showNews(news);
    } on NetworkException catch (e) {
      view.showError(e.message);
    } catch (e) {
      view.showError('An unexpected error occurred');
    }
  }

  void navigateToWeather() {
    router.navigateToWeatherScreen();
  }
}
