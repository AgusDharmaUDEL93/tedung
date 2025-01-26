import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tedung/app/utils/validators.dart';

import '../../../theme/color.dart';
import '../controllers/password_setting_controller.dart';

class PasswordSettingView extends GetView<PasswordSettingController> {
  const PasswordSettingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: SafeArea(
        child: Obx(
          () => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
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
                            "Old Password",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Obx(
                            () => TextFormField(
                              controller: controller.oldPasswordController,
                              validator: onPasswordValidation,
                              obscureText:
                                  controller.isOldPasswordObscure.value,
                              decoration: InputDecoration(
                                hintText: "Masukkan password lama anda",
                                hintStyle: TextStyle(
                                  color: Colors.black26,
                                ),
                                suffixIcon: IconButton(
                                  onPressed:
                                      controller.onChangeVisibilitOldPassword,
                                  icon: Icon(
                                      controller.isOldPasswordObscure.value
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Text(
                            "New Password",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Obx(
                            () => TextFormField(
                              controller: controller.newPasswordController,
                              validator: onPasswordValidation,
                              obscureText:
                                  controller.isNewPasswordObscure.value,
                              decoration: InputDecoration(
                                hintText: "Masukkan password baru anda",
                                hintStyle: TextStyle(
                                  color: Colors.black26,
                                ),
                                suffixIcon: IconButton(
                                  onPressed:
                                      controller.onChangeVisibilitNewPassword,
                                  icon: Icon(
                                      controller.isNewPasswordObscure.value
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Text(
                            "New Confirm Password",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Obx(
                            () => TextFormField(
                              controller:
                                  controller.newConfirmPasswordController,
                              validator: (value) {
                                return onConfirmPasswordValidation(value,
                                    controller.newPasswordController.text);
                              },
                              obscureText:
                                  controller.isNewConfirmPasswordObscure.value,
                              decoration: InputDecoration(
                                hintText: "Ulangi password baru anda",
                                hintStyle: TextStyle(
                                  color: Colors.black26,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: controller
                                      .onChangeVisibilitNewConfirmPassword,
                                  icon: Icon(controller
                                          .isNewConfirmPasswordObscure.value
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                ),
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
                              onPressed: controller.onChangePassword,
                              child: Text("Ganti"),
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
