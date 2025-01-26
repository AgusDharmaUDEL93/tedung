import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tedung/app/data/utils/roles.dart';
import 'package:tedung/app/modules/consultation/bindings/consultation_binding.dart';
import 'package:tedung/app/modules/consultation/views/consultation_view.dart';
import 'package:tedung/app/modules/home_content/bindings/home_content_binding.dart';
import 'package:tedung/app/modules/home_content/views/home_content_view.dart';
import 'package:tedung/app/modules/home_content_psychologist/bindings/home_content_psychologist_binding.dart';
import 'package:tedung/app/modules/home_content_psychologist/views/home_content_psychologist_view.dart';

import '../../../routes/app_pages.dart';
import '../../home_content_admin/bindings/home_content_admin_binding.dart';
import '../../home_content_admin/views/home_content_admin_view.dart';
import '../../profile/bindings/profile_binding.dart';
import '../../profile/views/profile_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      if (!controller.isAuth.value) {
        Get.offAllNamed(Routes.LOGIN);
      }
    });

    return StreamBuilder<Role>(
        stream: controller.getRole(),
        builder: (context, snapshot) {
          if (snapshot.data == Role.worker) {
            return Scaffold(
              bottomNavigationBar: Obx(
                () => NavigationBar(
                  selectedIndex: controller.tabIndexWorker.value,
                  onDestinationSelected: controller.changeTabIndexWorker,
                  destinations: const [
                    NavigationDestination(
                        icon: Icon(Icons.home), label: "Beranda"),
                    NavigationDestination(
                        icon: Icon(Icons.chat), label: "Konsultasi"),
                    NavigationDestination(
                        icon: Icon(Icons.person), label: "Profil"),
                  ],
                ),
              ),
              body: Navigator(
                key: Get.nestedKey(1),
                initialRoute: Routes.HOME_CONTENT,
                onGenerateRoute: (settings) {
                  if (settings.name == Routes.HOME_CONTENT) {
                    return GetPageRoute(
                      routeName: Routes.HOME_CONTENT,
                      page: () => const HomeContentView(),
                      binding: HomeContentBinding(),
                    );
                  }
                  if (settings.name == Routes.CONSULTATION) {
                    return GetPageRoute(
                      routeName: Routes.CONSULTATION,
                      page: () => const ConsultationView(),
                      binding: ConsultationBinding(),
                    );
                  }
                  if (settings.name == Routes.PROFILE) {
                    return GetPageRoute(
                      routeName: Routes.PROFILE,
                      page: () => const ProfileView(),
                      binding: ProfileBinding(),
                    );
                  }
                  return null;
                },
              ),
            );
          } else if (snapshot.data == Role.executive) {
            return Scaffold(
              bottomNavigationBar: Obx(
                () => NavigationBar(
                  selectedIndex: controller.tabIndexExecutive.value,
                  onDestinationSelected: controller.changeTabIndexExecutive,
                  destinations: const [
                    NavigationDestination(
                        icon: Icon(Icons.home), label: "Beranda"),
                    NavigationDestination(
                        icon: Icon(Icons.person), label: "Profil"),
                  ],
                ),
              ),
              body: Navigator(
                key: Get.nestedKey(1),
                initialRoute: Routes.HOME_CONTENT_ADMIN,
                onGenerateRoute: (settings) {
                  if (settings.name == Routes.HOME_CONTENT_ADMIN) {
                    return GetPageRoute(
                      routeName: Routes.HOME_CONTENT_ADMIN,
                      page: () => const HomeContentAdminView(),
                      binding: HomeContentAdminBinding(),
                    );
                  }

                  if (settings.name == Routes.PROFILE) {
                    return GetPageRoute(
                      routeName: Routes.PROFILE,
                      page: () => const ProfileView(),
                      binding: ProfileBinding(),
                    );
                  }
                  return null;
                },
              ),
            );
          } else if (snapshot.data == Role.psychologist) {
            return Scaffold(
              bottomNavigationBar: Obx(
                () => NavigationBar(
                  selectedIndex: controller.tabIndexPsychologist.value,
                  onDestinationSelected: controller.changeTabIndexPsychologist,
                  destinations: const [
                    NavigationDestination(
                        icon: Icon(Icons.home), label: "Konsultasi"),
                    NavigationDestination(
                        icon: Icon(Icons.person), label: "Profil"),
                  ],
                ),
              ),
              body: Navigator(
                key: Get.nestedKey(1),
                initialRoute: Routes.HOME_CONTENT_PSYCHOLOGIST,
                onGenerateRoute: (settings) {
                  if (settings.name == Routes.HOME_CONTENT_PSYCHOLOGIST) {
                    return GetPageRoute(
                      routeName: Routes.HOME_CONTENT_PSYCHOLOGIST,
                      page: () => const HomeContentPsychologistView(),
                      binding: HomeContentPsychologistBinding(),
                    );
                  }

                  if (settings.name == Routes.PROFILE) {
                    return GetPageRoute(
                      routeName: Routes.PROFILE,
                      page: () => const ProfileView(),
                      binding: ProfileBinding(),
                    );
                  }
                  return null;
                },
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
