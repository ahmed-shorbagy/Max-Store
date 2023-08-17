part of 'products_cubit.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsSuccess extends ProductsState {
  final List<ProductModel> products;

  const ProductsSuccess(this.products);
}

final class ProductsFaluire extends ProductsState {
  final String errMessage;

  const ProductsFaluire(this.errMessage);
}
