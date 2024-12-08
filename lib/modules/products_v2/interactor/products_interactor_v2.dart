import 'package:viper_test/modules/products/interactor/products_interactor.dart';
import 'package:viper_test/modules/products_v2/entity/product_entity.dart';

class ProductsInteractorImplV2 extends ProductsInteractorImpl {
  ProductsInteractorImplV2({required super.apiClient});

  @override
  Future<List<ProductEntityV2>> fetchProducts() async {
    final data = await apiClient.fetchProducts();
    return data.map((e) => ProductEntityV2.fromJson(e)).toList();
  }
}
