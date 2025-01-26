import 'package:get/get.dart';

import '../controllers/user_complaint_controller.dart';

class UserComplaintBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserComplaintController>(
      () => UserComplaintController(),
    );
  }
}
