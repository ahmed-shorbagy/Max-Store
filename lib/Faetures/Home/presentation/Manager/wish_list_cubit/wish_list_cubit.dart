import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:max_store/core/Models/product_model.dart';

part 'wish_list_state.dart';

class WishListCubit extends Cubit<WishListState> {
  List<ProductModel> productList = [];
  void addProductToWIshList({required ProductModel product}) {
    try {
      emit(WishListLoading());

      productList.add(product);
      emit(WishListSuccess(productsList: productList));
    } catch (e) {
      emit(const WishListFaluire(errMessage: 'opps'));
    }
  }

  void removeProductFromWishList({required ProductModel product}) {
    try {
      emit(WishListLoading());

      productList.remove(product);
      emit(WishListSuccess(productsList: productList));
    } catch (e) {
      emit(const WishListFaluire(errMessage: 'opps'));
    }
  }

  WishListCubit() : super(WishListInitial());
}
