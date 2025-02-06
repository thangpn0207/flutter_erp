import 'package:bloc/bloc.dart';
import 'package:flutter_simple_erp/models/purchase_order.dart';
import 'package:meta/meta.dart';

import '../../repositories/purchase_order_repository.dart';

part 'purchase_order_event.dart';
part 'purchase_order_state.dart';

class PurchaseOrderBloc extends Bloc<PurchaseOrderEvent, PurchaseOrderState> {
  final PurchaseOrderRepository repository;
  PurchaseOrderBloc(this.repository) : super(PurchaseOrderInitial()) {
    on<LoadPurchaseOrder>((event, emit) async {
      try {
        final orders = await repository.getPurchaseOrders();
        emit(PurchaseOrderLoaded( orders));
      } catch (e) {
        emit(PurchaseOrderError(e.toString()));
      }
    });

    on<CreateNewPurchaseOrder>((event, emit) async {
      try {
        await repository.createPurchaseOrder(event.purchaseOrder);
        final orders = await repository.getPurchaseOrders();
        emit(PurchaseOrderLoaded( orders));
      } catch (e) {
        emit(PurchaseOrderError(e.toString()));
      }
    });
  }
  }

