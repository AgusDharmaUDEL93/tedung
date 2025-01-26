import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../data/models/user_model.dart';
import '../../../routes/app_pages.dart';

class ProfileController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  var isLoading = false.obs;

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

  Stream<UserRelated> getUserData() {
    return firestore
        .collection("users")
        .doc(auth.currentUser?.uid)
        .snapshots()
        .map((snapshot) {
      print(snapshot.data());
      return UserRelated.fromJson(snapshot.data()!);
    });
  }

  void onLogout() {
    Get.defaultDialog(
      title: "Keluar",
      middleText: "Apakah anda yakin ingin keluar?",
      onConfirm: () async {
        await auth.signOut();
        Get.offAllNamed(Routes.LOGIN);
      },
      onCancel: () {
        Get.back();
      },
    );
  }
}
