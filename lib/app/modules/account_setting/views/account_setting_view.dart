import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/utils/gender.dart';
import '../../../theme/color.dart';
import '../../../utils/validators.dart';
import '../controllers/account_setting_controller.dart';

class AccountSettingView extends GetView<AccountSettingController> {
  const AccountSettingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: SafeArea(
        child: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pengaturan Akun",
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
                          Text(
                            "Nama",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          TextFormField(
                            controller: controller.nameController,
                            validator: (value) {
                              return onNotEmptyValidation(value, "Name");
                            },
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              hintText: "Masukkan nama anda",
                              hintStyle: TextStyle(
                                color: Colors.black26,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Text(
                            "Email",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          TextFormField(
                            controller: controller.emailController,
                            validator: onEmailValidation,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: "Masukkan email anda",
                              hintStyle: TextStyle(
                                color: Colors.black26,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Text(
                            "No HP",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          TextFormField(
                            controller: controller.numberController,
                            validator: onNumberValidation,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: "Masukkan no HP",
                              hintStyle: TextStyle(
                                color: Colors.black26,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Text(
                            "Jenis Kelamin",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          DropdownButtonFormField<Gender>(
                            value: controller.gender,
                            items: Gender.values
                                .map(
                                  (element) => DropdownMenuItem(
                                    value: element,
                                    child: Text(element.name),
                                  ),
                                )
                                .toList(),
                            onChanged: (Gender? newGender) {
                              if (newGender != null) {
                                controller.onChangeGender(newGender);
                              }
                            },
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Text(
                            "Usia",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          TextFormField(
                            controller: controller.ageController,
                            validator: (value) {
                              return onIntValidation(value, "Usia");
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Masukkan usia",
                              hintStyle: TextStyle(
                                color: Colors.black26,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Text(
                            "Masa Kerja (th)",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          TextFormField(
                            controller: controller.yosController,
                            validator: (value) {
                              return onIntValidation(value, "Masa Kerja");
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Masukkan Masa Kerja dalam tahun",
                              hintStyle: TextStyle(
                                color: Colors.black26,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Text(
                            "Posisi/Jabatan",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          TextFormField(
                            controller: controller.positionController,
                            validator: (value) {
                              return onNotEmptyValidation(
                                  value, "Posisi/Jabatan");
                            },
                            decoration: InputDecoration(
                              hintText: "Masukkan posisi/jabatan anda",
                              hintStyle: TextStyle(
                                color: Colors.black26,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          SizedBox(
                            width: Get.width,
                            child: FilledButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                  Color(ColorTheme.PRIMARY_500),
                                ),
                                foregroundColor: WidgetStatePropertyAll(
                                  Color(ColorTheme.PRIMARY_800),
                                ),
                              ),
                              onPressed: controller.updateAccount,
                              child: Text("Update"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
