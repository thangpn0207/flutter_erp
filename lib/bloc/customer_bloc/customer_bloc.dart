import 'package:bloc/bloc.dart';
import 'package:flutter_simple_erp/repositories/customer_repository.dart';
import 'package:meta/meta.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  CustomerBloc(CustomerRepository customerRepository) : super(CustomerInitial()) {
    on<CustomerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
