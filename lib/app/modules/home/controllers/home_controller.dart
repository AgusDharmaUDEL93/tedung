import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tedung/app/data/models/user_model.dart';
import 'package:tedung/app/data/utils/roles.dart';

import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  var tabIndexWorker = 0.obs;
  var tabIndexExecutive = 0.obs;
  var tabIndexPsychologist = 0.obs;

  var isAuth = false.obs;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  late Role role;

  @override
  void onInit() {
    super.onInit();
    onRefresh();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeTabIndexWorker(int index) {
    tabIndexWorker.value = index;

    var pages = [Routes.HOME_CONTENT, Routes.CONSULTATION, Routes.PROFILE];
    Get.toNamed(pages[tabIndexWorker.value], id: 1);
  }

  void changeTabIndexExecutive(int index) {
    tabIndexExecutive.value = index;

    var pages = [Routes.HOME_CONTENT_ADMIN, Routes.PROFILE];
    Get.toNamed(pages[tabIndexExecutive.value], id: 1);
  }

  void changeTabIndexPsychologist(int index) {
    tabIndexPsychologist.value = index;

    var pages = [Routes.HOME_CONTENT_PSYCHOLOGIST, Routes.PROFILE];
    Get.toNamed(pages[tabIndexPsychologist.value], id: 1);
  }

  Future<void> onRefresh() async {
    if (auth.currentUser == null) {
      isAuth.value = false;
      return;
    }
    isAuth.value = true;
  }

  Stream<Role> getRole() {
    return firestore
        .collection("users")
        .doc(auth.currentUser?.uid)
        .snapshots()
        .map((snapshot) {
      role = UserRelated.fromJson(snapshot.data()!).role!;
      return UserRelated.fromJson(snapshot.data()!).role!;
    });
  }
}
