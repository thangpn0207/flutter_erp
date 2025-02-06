part of 'inventory_bloc.dart';

@immutable
sealed class InventoryState {}

class InventoryInitial extends InventoryState {}
class InventoryLoading extends InventoryState {}
class InventoryLoaded extends InventoryState {
  final List<Inventory> inventory;
  InventoryLoaded(this.inventory);
}
class InventoryError extends InventoryState {
  final String message;
  InventoryError(this.message);
}
