part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}
class LoadProducts extends ProductEvent {}
class CreateNewProduct extends ProductEvent {
  final Product product;
  CreateNewProduct(this.product);
}
