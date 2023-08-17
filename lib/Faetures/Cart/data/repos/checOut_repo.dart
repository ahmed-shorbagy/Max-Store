import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:max_store/core/Models/CheckOut_model.dart';

abstract class CheckOutRepo {
  Future<DocumentReference<Map<String, dynamic>>> uploadCheckOutOtFirebase(
      CheckoutModel checkOut, FirebaseFirestore firebaseFirestore);
}
