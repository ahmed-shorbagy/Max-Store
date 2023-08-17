import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:max_store/core/Models/cart_model.dart';
import 'package:max_store/core/Models/product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  List<ProductModel> products = [];
  static late CartModel cart;

  CartCubit() : super(CartInitial()) {
    cart = CartModel(products: products);
  }

  void updateCart() {
    cart = CartModel(products: products);
    emit(CartSuccess(products: products, cart: cart));
  }

  void clearCart() {
    cart.products.clear();
    cart.productQuantity(products: products).clear();
    updateCart();
  }

  Future<void> addProductToCart({required ProductModel product}) async {
    emit(CartLoading());
    try {
      products.add(product);
      updateCart();
    } catch (e) {
      emit(
        CartFaluire(
          errMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> removeProductFromCart({required ProductModel product}) async {
    emit(CartLoading());
    try {
      products.remove(product);
      updateCart();
    } catch (e) {
      emit(
        CartFaluire(
          errMessage: e.toString(),
        ),
      );
    }
  }
}
