import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:viper_test/modules/products/data/network/api_client.dart';
import 'package:viper_test/modules/products/interactor/products_interactor.dart';
import 'package:viper_test/modules/products_v2/interactor/products_interactor_v2.dart';

void setupDependencyInjection() {
  final getIt = GetIt.I;

  // Dio client
  getIt.registerFactory<Dio>(() => Dio());

  // API Client
  getIt.registerFactory<ProductsApiClient>(() => ProductsApiClient(
        dio: getIt(),
        apiToken: 'NevQXk3F5cFn1uNoCauvNbS8Z1jR9qsJtQxN2VMB',
      ));

  // Interactor
  getIt.registerFactory<ProductsInteractor>(
      () => ProductsInteractorImplV2(apiClient: getIt<ProductsApiClient>()));
}
