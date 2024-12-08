import '../entity/product_entity.dart';

abstract class ProductsViewContract {
  void showLoading();
  void showProducts(List<ProductEntity> news);
  void showError(String message);
}
