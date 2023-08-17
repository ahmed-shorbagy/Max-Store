import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:max_store/Faetures/Home/data/repos/home_repo.dart';
import 'package:max_store/core/Models/category_model.dart';
import 'package:max_store/core/Models/product_model.dart';

import '../../../../core/errors/Faluire.dart';

class HomeRepoImpl extends HOmeRepo {
  @override
  Future<Either<Faluire, List<CategoryModel>>> getAllCategories(
      {required FirebaseFirestore firebaseFirestore}) async {
    try {
      var categoriesList =
          await firebaseFirestore.collection('categories').get();
      List<CategoryModel> categories = categoriesList.docs
          .map((doc) => CategoryModel.fromSnapShots(doc))
          .toList();
      return Right(categories);
    } catch (e) {
      return Left(Faluire(e.toString()));
    }
  }

  @override
  Future<Either<Faluire, List<ProductModel>>> getAllProducts(
      {required FirebaseFirestore firebaseFirestore}) async {
    try {
      var productsList = await firebaseFirestore.collection('products').get();
      List<ProductModel> products = productsList.docs
          .map((doc) => ProductModel.fromSnapshots(doc))
          .toList();
      return right(products);
    } catch (e) {
      return left(Faluire(e.toString()));
    }
  }
}
