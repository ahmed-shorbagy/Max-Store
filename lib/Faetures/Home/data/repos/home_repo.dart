import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:max_store/core/Models/category_model.dart';
import 'package:max_store/core/Models/product_model.dart';

import '../../../../core/errors/Faluire.dart';

abstract class HOmeRepo {
  Future<Either<Faluire, List<CategoryModel>>> getAllCategories(
      {required FirebaseFirestore firebaseFirestore});

  Future<Either<Faluire, List<ProductModel>>> getAllProducts(
      {required FirebaseFirestore firebaseFirestore});
}
