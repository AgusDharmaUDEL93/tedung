import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tedung/app/data/models/consultation.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/models/complaint.dart';
import '../../../data/models/user_model.dart';
import '../../../data/utils/roles.dart';
import '../../../utils/firebase_humanize_error_code.dart';

class ConsultationDetailController extends GetxController {
  //TODO: Implement ConsultationDetailController

  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  var isLoading = false.obs;
  String? errorMessage;

  late String consultationId;

  @override
  void onInit() {
    consultationId = Get.parameters["consultation_id"].toString();

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

  Stream<UserRelated> getUserData(String id) {
    print(id);
    return firestore.collection("users").doc(id).snapshots().map((snapshot) {
      return UserRelated.fromJson(snapshot.data()!)!;
    });
  }

  Stream<Consultation> getConsultationData() {
    return firestore
        .collection("consultation")
        .doc(consultationId)
        .snapshots()
        .map((snapshot) {
      return Consultation.fromJson(snapshot.data()!);
    });
  }

  Future<void> onBookConsultation(
      String psychologistEmail, String eventStart) async {
    isLoading.value = true;
    print(consultationId);
    try {
      await firestore
          .collection("consultation")
          .doc(consultationId)
          .get()
          .then((DocumentSnapshot document) async {
        if (document.exists) {
          await firestore
              .collection("consultation")
              .doc(consultationId)
              .update({"booked_by": auth.currentUser?.uid});

          Uri calendarUrl = Uri.parse(
              "https://calendar.google.com/calendar/u/0/r/eventedit?dates=${eventStart}&details=Consultation+with+Psychologist&location=Online&text=Consultation+Session&attendees=${auth.currentUser?.email},$psychologistEmail");

          launchUrl(calendarUrl);
        }
      });
    } on FirebaseAuthException catch (e) {
      errorMessage =
          firebaseHumanizeErrorCode(e.code) ?? "Unexpected Error Occured";
    } catch (e) {
      errorMessage = e.toString();
    }
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
