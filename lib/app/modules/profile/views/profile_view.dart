import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tedung/app/data/models/user_model.dart';
import 'package:tedung/app/data/utils/roles.dart';

import '../../../theme/color.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: StreamBuilder<UserRelated>(
                    stream: controller.getUserData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasError) {
                        var error = snapshot.error.toString();
                        return Center(
                          child: Text("Error $error"),
                        );
                      }

                      return SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Profil",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 30,
                                child: Divider(
                                  height: 5,
                                  color: Color(ColorTheme.PRIMARY_600),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                width: Get.width,
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    color: Color(ColorTheme.PRIMARY_50),
                                    border: Border.all(
                                      color: Color(ColorTheme.PRIMARY_200),
                                    ),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data?.name ?? "-",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      controller.auth.currentUser?.email ?? "-",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      "No Hp",
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data?.phoneNumber ?? "-",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      "Jenis Kelamin",
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data?.gender?.name ?? "-",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      "Usia",
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      "${snapshot.data?.age} th",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      "Masa Kerja (th)",
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      "${snapshot.data?.yearsOfService} th",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      "Posisi/Jabatan",
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data?.position ?? "-",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 32,
                              ),
                              Text(
                                "Profil",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              InkWell(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Pengaturan Akun",
                                        ),
                                      ),
                                      Icon(
                                        Icons.chevron_right,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Divider(
                                color: Colors.black12,
                              ),
                              InkWell(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Pengaturan Sandi",
                                        ),
                                      ),
                                      Icon(
                                        Icons.chevron_right,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Divider(
                                color: Colors.black12,
                              ),
                              SizedBox(
                                height: 32,
                              ),
                              snapshot.data?.role == Role.worker
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Pengaduan",
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        InkWell(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 8),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    "Daftar Pengaduan",
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.chevron_right,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.black12,
                                        ),
                                      ],
                                    )
                                  : SizedBox(),
                              SizedBox(
                                height: 60,
                              ),
                              SizedBox(
                                width: Get.width,
                                child: FilledButton(
                                  style: ButtonStyle(
                                    shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                  onPressed: controller.onLogout,
                                  child: Text(
                                    "Keluar",
                                    style: TextStyle(
                                        color: Color(ColorTheme.PRIMARY_800)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
      ),
    );
  }
}
