import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:max_store/Faetures/Cart/data/repos/checOut_repo.dart';
import 'package:max_store/core/Models/CheckOut_model.dart';

import '../../../../../core/Models/product_model.dart';

part 'check_out_state.dart';

class CheckOutCubit extends Cubit<CheckOutState> {
  CheckOutCubit(this.checkOutRepo) : super(CheckOutInitial());
  static String? subTotal;
  static String? delevieryFee;
  static String? total;
  static List<ProductModel>? products;
  CheckOutRepo checkOutRepo;

  Future<void> uploadOrderToFirebase({required CheckoutModel checkout}) async {
    emit(CheckOuLoading());
    try {
      await checkOutRepo.uploadCheckOutOtFirebase(
          checkout, FirebaseFirestore.instance);
      emit(CheckOutSuccess());
    } catch (e) {
      emit(CheckOutFaluire(e.toString()));
    }
  }
}
