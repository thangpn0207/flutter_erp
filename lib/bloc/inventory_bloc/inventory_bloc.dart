import 'package:bloc/bloc.dart';
import 'package:flutter_simple_erp/models/inventory.dart';
import 'package:flutter_simple_erp/repositories/inventory_repository.dart';
import 'package:meta/meta.dart';

part 'inventory_event.dart';
part 'inventory_state.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  final InventoryRepository inventoryRepository;
  InventoryBloc(this.inventoryRepository) : super(InventoryInitial()) {
    on<LoadInventory>((event, emit) async {
      emit(InventoryLoading());
      try {
        final products = await inventoryRepository.getInventories();
        emit(InventoryLoaded(products));
      } catch (e) {
        emit(InventoryError(e.toString()));
      }
    });
  }
}
