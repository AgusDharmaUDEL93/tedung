import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tedung/app/data/models/consultation.dart';

class HomeContentPsychologistController extends GetxController {
  var initialIndex = 0;
  var length = 2;

  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Stream<List<Consultation>> getAllConsultation() {
    return firestore
        .collection("consultation")
        .where("psychologist_id", isEqualTo: auth.currentUser?.uid)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((element) {
        print(element.data());
        return Consultation.fromJson(
          element.data(),
          consultationId: element.id,
        );
      }).toList();
    });
  }
}
