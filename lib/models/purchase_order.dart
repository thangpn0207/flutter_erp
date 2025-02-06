class PurchaseOrder {
  final int? id;
  final int userId;
  final int supplierId;
  final double? totalAmount;
  final String? status;
  final List<PurchaseOrderItem> products;

  PurchaseOrder({
     this.id,
    required this.userId,
    required this.supplierId,
     this.totalAmount,
     this.status,
    required this.products,
  });

  factory PurchaseOrder.fromJson(Map<String, dynamic> json) {
    return PurchaseOrder(
      id: json['id'],
      userId: json['user_id'],
      supplierId: json['supplier_id'],
      totalAmount: json['total_amount'].toDouble(),
      status: json['status'],
      products: (json['products'] as List)
          .map((item) => PurchaseOrderItem.fromJson(item))
          .toList(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'supplier_id': supplierId,
      'total_amount': totalAmount,
      'status': status,
      'products': products.map((item) => item.toJson()).toList(),
    };
  }
}

class PurchaseOrderItem {
  final int? productId;
  final double price;
  final int quantity;

  PurchaseOrderItem({
     this.productId,
    required this.price,
    required this.quantity,
  });

  factory PurchaseOrderItem.fromJson(Map<String, dynamic> json) {
    return PurchaseOrderItem(
      productId: json['product_id'],
      price: json['price'].toDouble(),
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'price': price,
      'quantity': quantity,
    };
  }
}