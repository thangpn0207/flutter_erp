part of 'product_bloc.dart';

@immutable
sealed class ProductState {}
class ProductInitial extends ProductState {}
class ProductLoading extends ProductState {}
class ProductsLoaded extends ProductState {
  final List<Product> products;
  ProductsLoaded(this.products);
}
class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}
class ProductCreated extends ProductState {
  final Product product;
  ProductCreated(this.product);
}