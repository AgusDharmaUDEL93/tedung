import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedung/app/data/models/complaint.dart';
import 'package:tedung/app/data/utils/type_bully.dart';

import '../../../utils/firebase_humanize_error_code.dart';

class AddComplaintController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final perpetratorController = TextEditingController();
  final subjectController = TextEditingController();
  final descriptionController = TextEditingController();

  final victimNameController = TextEditingController();
  final victimPositionController = TextEditingController();

  var typeBully = TypeBully.verbal;

  var isSendForAnotherPeople = false.obs;
  var isSendAsAnonym = false.obs;

  String? errorMessage;
  var isLoading = false.obs;

  final CollectionReference complaint =
      FirebaseFirestore.instance.collection('complaint');

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

  void onChangeSendForAnotherPeople(bool newValue) {
    isSendForAnotherPeople.value = newValue;
  }

  void onChangeSendAsAnonym(bool newValue) {
    isSendAsAnonym.value = newValue;
  }

  void onAddComplaint() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    isLoading.value = true;

    try {
      var data = Complaint(
        userUid: auth.currentUser?.uid,
        bully: perpetratorController.text.trim(),
        bullyType: typeBully,
        bullySubject: subjectController.text.trim(),
        bullyDescription: descriptionController.text.trim(),
        sendForOther: isSendForAnotherPeople.value
            ? SendForOther(
                victimName: victimNameController.text.trim(),
                victimPosition: victimPositionController.text.trim(),
              )
            : null,
        isAnonym: isSendAsAnonym.value,
        timestamp: Timestamp.now(),
      );

      await complaint.add(data.toJson());
    } on FirebaseAuthException catch (e) {
      errorMessage =
          firebaseHumanizeErrorCode(e.code) ?? "Unexpected Error Occured";
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading.value = false;

    Get.defaultDialog(
      title: errorMessage == null ? "Sukses" : "Error",
      middleText:
          errorMessage == null ? "Sukses menambah pengaduan" : "$errorMessage",
      onConfirm: () {
        Get.back();
        Get.back();
      },
    );
  }
}
