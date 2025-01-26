import 'package:get/get.dart';

class ArticleDetailController extends GetxController {
  //TODO: Implement ArticleDetailController

  late String title;
  late String content;
  late String source;
  late String image;

  @override
  void onInit() {
    super.onInit();

    title = Get.parameters['article_title'].toString();
    content = Get.parameters["article_content"].toString();
    source = Get.parameters["article_source"].toString();
    image = Get.parameters["article_image"].toString();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
