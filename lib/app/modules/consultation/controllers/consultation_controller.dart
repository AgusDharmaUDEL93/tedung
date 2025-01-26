import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tedung/app/data/models/consultation.dart';
import 'package:tedung/app/data/models/user_model.dart';

class ConsultationController extends GetxController {
  final firestore = FirebaseFirestore.instance;

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
        .orderBy("schedule", descending: true)
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

  Stream<UserRelated> getPsychologistData(String uid) {
    return firestore.collection("users").doc(uid).snapshots().map((snapshot) {
      return UserRelated.fromJson(snapshot.data()!);
    });
  }
}
