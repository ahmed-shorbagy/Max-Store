part of 'wish_list_cubit.dart';

abstract class WishListState extends Equatable {
  const WishListState();

  @override
  List<Object> get props => [];
}

class WishListInitial extends WishListState {}

class WishListLoading extends WishListState {}

class WishListSuccess extends WishListState {
  final List<ProductModel> productsList;
  const WishListSuccess({required this.productsList});
}

class WishListFaluire extends WishListState {
  final String errMessage;
  const WishListFaluire({required this.errMessage});
}
