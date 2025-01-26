import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tedung/app/data/models/complaint.dart';

class ComplaintDetailController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    print(Get.parameters["complaint_id"]);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Stream<Complaint> getComplaintData() {
    var complaintId = Get.parameters["complaint_id"].toString();
    return firestore
        .collection("complaint")
        .doc(complaintId)
        .snapshots()
        .map((snapshot) {
      return Complaint.fromJson(snapshot.data()!);
    });
  }
}
