import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:max_store/Faetures/Home/data/repos/home_repo.dart';
import 'package:max_store/core/Models/product_model.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.hOmeRepo) : super(ProductsInitial());
  final HOmeRepo hOmeRepo;
  Future<void> getAllProducts() async {
    emit(ProductsLoading());
    var result = await hOmeRepo.getAllProducts(
        firebaseFirestore: FirebaseFirestore.instance);
    result.fold(
      (faluire) {
        emit(ProductsFaluire(faluire.errMessage));
      },
      (productsList) {
        emit(ProductsSuccess(productsList));
      },
    );
  }
}
