import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:max_store/Faetures/Cart/data/repos/checOut_repo.dart';
import 'package:max_store/core/Models/CheckOut_model.dart';

class CheckOutRepoImpl extends CheckOutRepo {
  @override
  Future<DocumentReference<Map<String, dynamic>>> uploadCheckOutOtFirebase(
      CheckoutModel checkOut, FirebaseFirestore firebaseFirestore) {
    return firebaseFirestore.collection('CheckOut').add(
          checkOut.toDocument(),
        );
  }
}
