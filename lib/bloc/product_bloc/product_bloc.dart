import 'package:bloc/bloc.dart';
import 'package:flutter_simple_erp/repositories/product_repository.dart';
import 'package:meta/meta.dart';

import '../../models/product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;
  ProductBloc(this.repository) : super(ProductInitial()) {
    on<LoadProducts>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await repository.getProducts();
        emit(ProductsLoaded(products));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });

    on<CreateNewProduct>((event, emit) async {
      emit(ProductLoading());
      try {
        await repository.createProduct(event.product);
        add(LoadProducts()); // Reload the list after creating
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });
  }
}
