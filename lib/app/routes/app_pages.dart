import 'package:get/get.dart';

import '../modules/add_complaint/bindings/add_complaint_binding.dart';
import '../modules/add_complaint/views/add_complaint_view.dart';
import '../modules/add_consultation/bindings/add_consultation_binding.dart';
import '../modules/add_consultation/views/add_consultation_view.dart';
import '../modules/article_detail/bindings/article_detail_binding.dart';
import '../modules/article_detail/views/article_detail_view.dart';
import '../modules/complaint_detail/bindings/complaint_detail_binding.dart';
import '../modules/complaint_detail/views/complaint_detail_view.dart';
import '../modules/consultation/bindings/consultation_binding.dart';
import '../modules/consultation/views/consultation_view.dart';
import '../modules/consultation_detail/bindings/consultation_detail_binding.dart';
import '../modules/consultation_detail/views/consultation_detail_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home_content/bindings/home_content_binding.dart';
import '../modules/home_content/views/home_content_view.dart';
import '../modules/home_content_admin/bindings/home_content_admin_binding.dart';
import '../modules/home_content_admin/views/home_content_admin_view.dart';
import '../modules/home_content_psychologist/bindings/home_content_psychologist_binding.dart';
import '../modules/home_content_psychologist/views/home_content_psychologist_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CONSULTATION,
      page: () => const ConsultationView(),
      binding: ConsultationBinding(),
    ),
    GetPage(
      name: _Paths.HOME_CONTENT,
      page: () => const HomeContentView(),
      binding: HomeContentBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.ARTICLE_DETAIL,
      page: () => const ArticleDetailView(),
      binding: ArticleDetailBinding(),
    ),
    GetPage(
      name: _Paths.ADD_COMPLAINT,
      page: () => const AddComplaintView(),
      binding: AddComplaintBinding(),
    ),
    GetPage(
      name: _Paths.HOME_CONTENT_ADMIN,
      page: () => const HomeContentAdminView(),
      binding: HomeContentAdminBinding(),
    ),
    GetPage(
      name: _Paths.COMPLAINT_DETAIL,
      page: () => const ComplaintDetailView(),
      binding: ComplaintDetailBinding(),
    ),
    GetPage(
      name: _Paths.CONSULTATION_DETAIL,
      page: () => const ConsultationDetailView(),
      binding: ConsultationDetailBinding(),
    ),
    GetPage(
      name: _Paths.HOME_CONTENT_PSYCHOLOGIST,
      page: () => const HomeContentPsychologistView(),
      binding: HomeContentPsychologistBinding(),
    ),
    GetPage(
      name: _Paths.ADD_CONSULTATION,
      page: () => const AddConsultationView(),
      binding: AddConsultationBinding(),
    ),
  ];
}
