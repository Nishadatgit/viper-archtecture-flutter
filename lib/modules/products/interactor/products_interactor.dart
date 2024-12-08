import '../data/network/api_client.dart';
import '../entity/product_entity.dart';

abstract class ProductsInteractor {
  Future<List<ProductEntity>> fetchProducts();
}

class ProductsInteractorImpl implements ProductsInteractor {
  final ProductsApiClient apiClient;

  ProductsInteractorImpl({required this.apiClient});

  @override
  Future<List<ProductEntity>> fetchProducts() async {
    try {
      final data = await apiClient.fetchProducts();
      return data.map((e) => ProductEntity.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
