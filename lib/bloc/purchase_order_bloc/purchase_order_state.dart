part of 'purchase_order_bloc.dart';

@immutable
sealed class PurchaseOrderState {}

class PurchaseOrderInitial extends PurchaseOrderState {}
class PurchaseOrderLoading extends PurchaseOrderState {}
class PurchaseOrderLoaded extends PurchaseOrderState {
  final List<PurchaseOrder> purchaseOrders;
  PurchaseOrderLoaded(this.purchaseOrders);
}
class PurchaseOrderError extends PurchaseOrderState {
  final String message;
  PurchaseOrderError(this.message);
}
class PurchaseOrderCreated extends PurchaseOrderState {
  final PurchaseOrder purchaseOrder;
  PurchaseOrderCreated(this.purchaseOrder);
}