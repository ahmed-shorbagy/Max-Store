part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartSuccess extends CartState {
  final CartModel? cart;
  final List<ProductModel>? products;

  const CartSuccess({this.products, this.cart});
}

class CartFaluire extends CartState {
  final String errMessage;
  const CartFaluire({required this.errMessage});
}
