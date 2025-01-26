import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../data/models/complaint.dart';
import '../../../data/models/user_model.dart';

class UserComplaintController extends GetxController {
  //TODO: Implement UserComplaintController
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

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
        // .orderBy("timestamp", descending: true)
        .where("user_uid", isEqualTo: auth.currentUser?.uid)
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
