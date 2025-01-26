import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tedung/app/data/models/complaint.dart';
import 'package:tedung/app/data/models/user_model.dart';

class HomeContentAdminController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

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

  Stream<List<Complaint>> getAllComplaint() {
    return firestore
        .collection("complaint")
        .orderBy("timestamp", descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((element) {
        return Complaint.fromJson(element.data(), complaintId: element.id);
      }).toList();
    });
  }

  Stream<UserRelated> getUserData(String uid) {
    return firestore.collection("users").doc(uid).snapshots().map((snapshot) {
      return UserRelated.fromJson(snapshot.data()!);
    });
  }
}
