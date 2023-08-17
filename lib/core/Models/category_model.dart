import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final String categoryName;
  final String imgUrl;
  const CategoryModel({required this.categoryName, required this.imgUrl});
  @override
  List<Object?> get props => [categoryName, imgUrl];

  factory CategoryModel.fromSnapShots(DocumentSnapshot snapshot) {
    return CategoryModel(
        categoryName: snapshot['categoryName'] as String,
        imgUrl: snapshot['imgUrl'] as String);
  }
}
