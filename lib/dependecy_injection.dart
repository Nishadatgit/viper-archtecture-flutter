import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:viper_test/modules/news/data/network/api_client.dart';
import 'package:viper_test/modules/news/interactor/news_interactor.dart';

void setupDependencyInjection() {
  final getIt = GetIt.I;

  // Dio client
  getIt.registerFactory<Dio>(() => Dio());

  // API Client
  getIt.registerFactory<NewsApiClient>(() => NewsApiClient(
        dio: getIt(),
        
        apiToken: 'NevQXk3F5cFn1uNoCauvNbS8Z1jR9qsJtQxN2VMB',
      ));

  // Interactor
  getIt.registerFactory<NewsInteractor>(
      () => NewsInteractorImpl(apiClient: getIt<NewsApiClient>()));
}
