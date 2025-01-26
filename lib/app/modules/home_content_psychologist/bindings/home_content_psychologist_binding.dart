import 'package:get/get.dart';

import '../controllers/home_content_psychologist_controller.dart';

class HomeContentPsychologistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeContentPsychologistController>(
      () => HomeContentPsychologistController(),
    );
  }
}
