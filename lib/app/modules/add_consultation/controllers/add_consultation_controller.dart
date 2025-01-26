import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tedung/app/data/models/consultation.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/firebase_humanize_error_code.dart';

class AddConsultationController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final consultationDateController = TextEditingController();

  String? errorMessage;
  var isLoading = false.obs;

  final auth = FirebaseAuth.instance;
  final consultation = FirebaseFirestore.instance.collection("consultation");

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

  Future<void> selectDateTime(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        final DateTime selectedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        // Format the date and time and update the text field
        consultationDateController.text =
            DateFormat('dd/MM/yyyy hh:mm a').format(selectedDateTime);
      }
    }
  }

 

  Future<void> onAddConsultation() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    isLoading.value = true;

    try {
      final DateTime selectedDateTime = DateFormat('dd/MM/yyyy hh:mm a')
          .parse(consultationDateController.text);

      var data = Consultation(
        schedule: Timestamp.fromDate(selectedDateTime),
        psychologistId: auth.currentUser?.uid,
        bookedBy: null,
      );

      await consultation.add(data.toJson());
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


