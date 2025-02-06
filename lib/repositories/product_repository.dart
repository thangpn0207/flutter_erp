import 'package:dio/dio.dart';

import '../models/product.dart';

class ProductRepository {
  final Dio _dio;

  ProductRepository(this._dio) ;

  Future<List<Product>> getProducts() async {
    try {
      final response = await _dio.get('/products');
      return (response.data as List)
          .map((json) => Product.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch products: $e');
    }
  }

  Future<void> createProduct(Product product) async {
    try {
    await _dio.post('/products', data: product.toJson());
    } catch (e) {
      throw Exception('Failed to create product: $e');
    }
  }
}