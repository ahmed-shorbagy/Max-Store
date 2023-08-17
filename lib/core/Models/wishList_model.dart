import 'package:equatable/equatable.dart';
import 'package:max_store/core/Models/product_model.dart';

class WishListMOdel extends Equatable {
  final List<ProductModel> products;

  const WishListMOdel({this.products = const <ProductModel>[]});

  @override
  List<Object?> get props => [products];
}
