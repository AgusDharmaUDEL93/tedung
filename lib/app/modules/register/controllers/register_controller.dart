import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedung/app/data/models/user_model.dart';
import 'package:tedung/app/data/utils/gender.dart';
import 'package:tedung/app/data/utils/roles.dart';

import '../../../utils/firebase_humanize_error_code.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final ageController = TextEditingController();
  final yosController = TextEditingController();
  final positionController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var isPasswordObscure = true.obs;
  var isConfirmPasswordObscure = true.obs;

  var gender = Gender.male;

  final auth = FirebaseAuth.instance;
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  var isLoading = false.obs;
  String? errorMessage;

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

  void onChangeGender(Gender newGender) {
    gender = newGender;
  }

  void onChangeVisibilityPassword() {
    isPasswordObscure.value = !isPasswordObscure.value;
  }

  void onChangeVisibilityConfirmPassword() {
    isConfirmPasswordObscure.value = !isConfirmPasswordObscure.value;
  }

  Future<void> onRegister() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    isLoading.value = true;

    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      await auth.signOut();

      var data = UserRelated(
          name: nameController.text,
          email: emailController.text,
          phoneNumber: numberController.text,
          gender: gender,
          age: int.parse(ageController.text),
          yearsOfService: int.parse(yosController.text),
          position: positionController.text,
          role: Role.worker);

      users
          .doc(result.user?.uid)
          .set(data.toJson())
          .onError((error, stackTrace) {
        errorMessage = error.toString();
      });
    } on FirebaseAuthException catch (e) {
      errorMessage =
          firebaseHumanizeErrorCode(e.code) ?? "Unexpected Error Occured";
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading.value = false;

    Get.defaultDialog(
      title: errorMessage == null ? "Sukses" : "Error",
      middleText: errorMessage == null
          ? "Sukses mendaftar menjadi karyawan"
          : "$errorMessage",
      onConfirm: () {
        Get.back();
        Get.back();
      },
    );
  }
}
