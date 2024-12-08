import 'package:viper_test/modules/products/presenter/products_presenter.dart';
import 'package:viper_test/modules/products_v2/entity/product_entity.dart';

class ProductsPresenterV2 extends ProductsPresenter {
  ProductsPresenterV2({
    required super.view,
    required super.interactor,
    required super.router,
  });
  @override
  Future<void> fetchProducts() async {
    try {
      view.showLoading();
      final products = await interactor.fetchProducts();
    
      final productsV2 = products.map((product) {
        if (product is ProductEntityV2) return product;
        throw Exception('Unexpected product type');
      }).toList();
      view.showProducts(productsV2);
    } catch (e) {
      view.showError(e.toString());
    }
  }
}
