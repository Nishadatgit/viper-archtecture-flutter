import '../interactor/products_interactor.dart';
import '../router/products_router.dart';
import '../view/products_view_contract.dart';
import '../data/exceptions/network_exceptions.dart';

class ProductsPresenter {
  final ProductsViewContract view;
  final ProductsInteractor interactor;
  final ProductsRouter router;

  ProductsPresenter({
    required this.view,
    required this.interactor,
    required this.router,
  });

  Future<void> fetchProducts() async {
    view.showLoading();
    try {
      final news = await interactor.fetchProducts();
      view.showProducts(news);
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
