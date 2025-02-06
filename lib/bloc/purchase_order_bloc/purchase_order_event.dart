part of 'purchase_order_bloc.dart';

@immutable
sealed class PurchaseOrderEvent {}
class LoadPurchaseOrder extends PurchaseOrderEvent {}
class CreateNewPurchaseOrder extends PurchaseOrderEvent {
  final PurchaseOrder purchaseOrder;
  CreateNewPurchaseOrder(this.purchaseOrder);
}
