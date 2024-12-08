import 'package:viper_test/modules/products/view/products_view_contract.dart';

import '../entity/product_entity.dart';

abstract class ProductsViewContractV2 extends ProductsViewContract {
  void showProductsV2(List<ProductEntityV2> news);
}
