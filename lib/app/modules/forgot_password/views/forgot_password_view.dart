import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../theme/color.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});
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
                            "Lupa Password",
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
                              onPressed: controller.onResetPassword,
                              child: Text("Kirim Link"),
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
