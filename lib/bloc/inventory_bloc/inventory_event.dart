part of 'inventory_bloc.dart';

@immutable
sealed class InventoryEvent {}
class LoadInventory extends InventoryEvent {}
