import 'package:flutter/material.dart';
import 'package:viper_test/modules/products/entity/product_entity.dart';
import 'package:viper_test/modules/products/view/products_view.dart';
import 'package:viper_test/modules/products_v2/view/products_view_v2_contract.dart';

import '../entity/product_entity.dart';

class ProductsViewV2 extends ProductsView {
  const ProductsViewV2({super.key});

  @override
  State<StatefulWidget> createState() => ProductsViewV2State();
}

@protected
class ProductsViewV2State extends ProductsViewState
    implements ProductsViewContractV2 {
  @override
  void showProducts(List<ProductEntity> fetchedProducts) {
    // Cast to ProductEntityV2 and filter out any invalid entries
    final productsV2 = fetchedProducts.whereType<ProductEntityV2>().toList();

    setState(() {
      isLoading = false;
      products = productsV2;
    });
  }

  @override
  void showProductsV2(List<ProductEntityV2> productsV2) {
    setState(() {
      isLoading = false;
      products = productsV2;
    });
  }

  @override
  Widget buildView(List<ProductEntity> productItems) {
    return GridView.builder(
      itemCount: productItems.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisExtent: 200),
      itemBuilder: (context, index) {
        return buildProductsTile(productItems[index]);
      },
    );
  }

  @override
  ListTile buildProductsTile(ProductEntity product) {
    return ListTile(
      leading:
          product.imageUrl != null ? Image.network(product.imageUrl!) : null,
      title: Text(product.title),
      subtitle: Text(
        product.description,
        maxLines: 3,
      ),
      trailing: product is ProductEntityV2
          ? CircleAvatar(
              child: Center(child: Text(product.price.toStringAsFixed(0))),
            )
          : null,
    );
  }
}
