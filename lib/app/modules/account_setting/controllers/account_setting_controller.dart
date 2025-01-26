import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/user_model.dart';
import '../../../data/utils/gender.dart';
import '../../../data/utils/roles.dart';
import '../../../utils/firebase_humanize_error_code.dart';

class AccountSettingController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final ageController = TextEditingController();
  final yosController = TextEditingController();
  final positionController = TextEditingController();

  var gender = Gender.male;
  Role role = Role.worker;

  final auth = FirebaseAuth.instance;
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  var isLoading = false.obs;
  String? errorMessage;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onChangeGender(Gender newGender) {
    gender = newGender;
  }

  Future<void> loadUserData() async {
    try {
      isLoading.value = true;
      final userId = auth.currentUser?.uid;
      if (userId == null) return;

      final snapshot = await users.doc(userId).get();
      if (snapshot.exists) {
        final user =
            UserRelated.fromJson(snapshot.data() as Map<String, dynamic>);

        nameController.text = user.name ?? "";
        emailController.text = user.email ?? "";
        numberController.text = user.phoneNumber ?? "";
        gender = user.gender ?? Gender.male;
        ageController.text = user.age?.toString() ?? "";
        yosController.text = user.yearsOfService?.toString() ?? "";
        positionController.text = user.position ?? "";
        role = user.role ?? Role.worker;

        update();
      }
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateAccount() async {
    if (!formKey.currentState!.validate()) return;

    try {
      isLoading.value = true;
      final userId = auth.currentUser?.uid;
      if (userId == null) return;

      final updatedUser = UserRelated(
        name: nameController.text,
        email: emailController.text,
        phoneNumber: numberController.text,
        gender: gender,
        age: int.tryParse(ageController.text),
        yearsOfService: int.tryParse(yosController.text),
        position: positionController.text,
        role: role,
      );

      await users.doc(userId).update(updatedUser.toJson());
    } on FirebaseAuthException catch (e) {
      errorMessage =
          firebaseHumanizeErrorCode(e.code) ?? "Unexpected Error Occured";
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading.value = false;

    Get.defaultDialog(
      title: errorMessage == null ? "Success" : "Error",
      middleText: errorMessage == null
          ? "Sukses melakukan update pada akun"
          : "Gagal melakukan update karena : $errorMessage",
      onConfirm: () {
        Get.back();
        Get.back();
      },
    );
  }
}
