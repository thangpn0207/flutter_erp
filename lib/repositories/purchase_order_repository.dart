import 'package:dio/dio.dart';
import 'package:flutter_simple_erp/models/purchase_order.dart';

class PurchaseOrderRepository {
  final Dio _dio;

  PurchaseOrderRepository(this._dio) ;
  Future<List<PurchaseOrder>> getPurchaseOrders() async {
    try {
      final response = await _dio.get('/purchase-orders');
      return (response.data as List)
          .map((json) => PurchaseOrder.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch products: $e');
    }
  }

  Future<void> createPurchaseOrder(PurchaseOrder product) async {
    try {
      await _dio.post('/purchase-orders', data: product.toJson());
    } catch (e) {
      throw Exception('Failed to create product: $e');
    }
  }
}