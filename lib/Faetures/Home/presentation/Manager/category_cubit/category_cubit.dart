import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:max_store/Faetures/Home/data/repos/home_repo.dart';
import 'package:max_store/core/Models/category_model.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.homeRepo) : super(CategoryInitial());
  final HOmeRepo homeRepo;
  Future<void> getAllCategories() async {
    emit(CategoryLoading());
    var result = await homeRepo.getAllCategories(
      firebaseFirestore: FirebaseFirestore.instance,
    );
    result.fold(
      (faluire) {
        emit(CategoryFaluire(faluire.errMessage));
      },
      (categoryList) {
        emit(CategorySuccess(categoryList));
      },
    );
  }
}
