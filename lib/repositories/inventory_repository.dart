import 'package:dio/dio.dart';
import 'package:flutter_simple_erp/models/inventory.dart';

class InventoryRepository {
  final Dio _dio;

  InventoryRepository(this._dio) ;

  Future<List<Inventory>> getInventories() async {
    try {
      final response = await _dio.get('/inventories');
      return (response.data as List)
          .map((json) => Inventory.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch products: $e');
    }
  }
}