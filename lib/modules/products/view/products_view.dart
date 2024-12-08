import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:viper_test/modules/products/interactor/products_interactor.dart';
import 'package:viper_test/modules/products/router/products_router.dart';
import '../entity/product_entity.dart';
import '../presenter/products_presenter.dart';
import 'products_view_contract.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<StatefulWidget> createState() => ProductsViewState();
}

@protected
class ProductsViewState extends State<ProductsView>
    implements ProductsViewContract {
  @protected
  late ProductsPresenter presenter;
  bool isLoading = false;
  String? errorMessage;
  List<ProductEntity> products = [];

  @override
  void initState() {
    super.initState();
    // Using dependency injection
    presenter = ProductsPresenter(
      view: this,
      interactor: GetIt.I<ProductsInteractor>(),
      router: ProductsRouterImpl(context),
    );
    presenter.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => presenter.navigateToWeather(),
        child: const Icon(Icons.cloud),
      ),
    );
  }

  Widget _buildBody() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(errorMessage!, style: const TextStyle(color: Colors.red)),
            ElevatedButton(
              onPressed: () => presenter.fetchProducts(),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    return buildView(products);
  }

  Widget buildView(List<ProductEntity> productItems) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final article = products[index];
        return buildProductsTile(article);
      },
    );
  }

  ListTile buildProductsTile(ProductEntity product) {
    return ListTile(
      title: Text(product.title),
      subtitle: Text(
        product.description,
        maxLines: 3,
      ),
      leading: product.imageUrl != null
          ? Image.network(product.imageUrl!, width: 100, fit: BoxFit.cover)
          : null,
    );
  }

  @override
  void showLoading() {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });
  }

  @override
  void showProducts(List<ProductEntity> fetchedProducts) {
    setState(() {
      isLoading = false;
      products = fetchedProducts;
    });
  }

  @override
  void showError(String message) {
    setState(() {
      isLoading = false;
      errorMessage = message;
    });
  }
}
