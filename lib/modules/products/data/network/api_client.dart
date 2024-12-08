import 'package:dio/dio.dart';
import '../exceptions/network_exceptions.dart';

class ProductsApiClient {
  final Dio dio;
  final String baseUrl;
  final String apiToken;

  ProductsApiClient({
    required this.dio,
    this.baseUrl = 'https://fakestoreapi.com',
    required this.apiToken,
  });

  Future<List<dynamic>> fetchProducts() async {
    try {
      final response = await dio.get(
        '$baseUrl/products',
        queryParameters: {},
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw NetworkException(
          message: 'Failed to fetch news',
          statusCode: response.statusCode,
        );
      }
    } on DioException catch (e) {
      throw NetworkException(
        message: e.message ?? 'Unknown network error',
        statusCode: e.response?.statusCode,
      );
    }
  }
}
