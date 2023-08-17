import 'package:equatable/equatable.dart';
import 'package:max_store/core/Models/product_model.dart';

class CheckoutModel extends Equatable {
  String? email;
  String? fullName;
  String? adress;
  String? city;
  String? country;
  String? zipCode;
  List<ProductModel>? products;
  String? subTotal;
  String? delevieryFee;
  String? total;

  CheckoutModel({
    this.email,
    this.fullName,
    this.adress,
    this.city,
    this.country,
    this.zipCode,
    this.products,
    this.subTotal,
    this.delevieryFee,
    this.total,
  });
  Map<String, dynamic> toDocument() {
    Map customerInfo = {
      'adress': adress,
      'fullName': fullName,
      'email': email,
      'city': city,
      'country': country,
      'zipCode': zipCode,
    };
    return {
      'cusomerInfo': customerInfo,
      'products': products!.map((product) => product.name).toList(),
      'subTotal': subTotal,
      'delevieryFee': delevieryFee,
      'total': total
    };
  }

  @override
  List<Object?> get props => [email, fullName, adress, city, country, zipCode];
}
