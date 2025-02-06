import 'package:bloc/bloc.dart';
import 'package:flutter_simple_erp/repositories/supplier_repository.dart';
import 'package:meta/meta.dart';

part 'supplier_event.dart';
part 'supplier_state.dart';

class SupplierBloc extends Bloc<SupplierEvent, SupplierState> {
  SupplierBloc(SupplierRepository supplierRepository) : super(SupplierInitial()) {
    on<SupplierEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
