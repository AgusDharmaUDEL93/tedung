import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tedung/app/data/utils/roles.dart';
import 'package:tedung/app/routes/app_pages.dart';
import 'package:tedung/app/theme/color.dart';

import '../../../utils/validators.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("assets/img/illustration_login.png"),
                          Text(
                            "Masuk",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Masuk dengan email dan password",
                            style: TextStyle(
                              fontSize: 16,
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
                            "Password",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Obx(
                            () => TextFormField(
                              controller: controller.passwordController,
                              validator: onPasswordValidation,
                              obscureText: controller.isPasswordObscure.value,
                              decoration: InputDecoration(
                                hintText: "Masukkan password anda",
                                hintStyle: TextStyle(
                                  color: Colors.black26,
                                ),
                                suffixIcon: IconButton(
                                  onPressed:
                                      controller.onChangeVisibilityPassword,
                                  icon: Icon(controller.isPasswordObscure.value
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextButton(
                            style: ButtonStyle(
                              padding: WidgetStatePropertyAll(
                                EdgeInsets.all(
                                  0,
                                ),
                              ),
                              foregroundColor: WidgetStatePropertyAll(
                                Color(ColorTheme.PRIMARY_800),
                              ),
                            ),
                            onPressed: () {
                              Get.toNamed(Routes.FORGOT_PASSWORD);
                            },
                            child: Text("Lupa Password"),
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
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                              onPressed: () {
                                controller.onLogin();
                              },
                              child: Text("Login"),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Tidak punya akun ?"),
                              TextButton(
                                style: ButtonStyle(
                                  foregroundColor: WidgetStatePropertyAll(
                                    Color(ColorTheme.SECONDARY_600),
                                  ),
                                ),
                                onPressed: () {
                                  Get.toNamed(Routes.REGISTER);
                                },
                                child: Text("Daftar"),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 32,
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
