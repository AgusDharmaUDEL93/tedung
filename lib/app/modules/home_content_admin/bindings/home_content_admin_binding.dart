import 'package:get/get.dart';

import '../controllers/home_content_admin_controller.dart';

class HomeContentAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeContentAdminController>(
      () => HomeContentAdminController(),
    );
  }
}
