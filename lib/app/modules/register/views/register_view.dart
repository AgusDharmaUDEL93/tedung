import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tedung/app/data/utils/gender.dart';
import 'package:tedung/app/utils/validators.dart';

import '../../../routes/app_pages.dart';
import '../../../theme/color.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/img/illustration_register.png"),
                Text(
                  "Daftar",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Daftar dengan memasukkan data pekerja anda",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 32,
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
                    return onNotEmptyValidation(value, "Posisi/Jabatan");
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
                        onPressed: controller.onChangeVisibilityPassword,
                        icon: Icon(controller.isPasswordObscure.value
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
                  "Confirm Password",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Obx(
                  () => TextFormField(
                    controller: controller.confirmPasswordController,
                    validator: (value) {
                      return onConfirmPasswordValidation(
                          value, controller.passwordController.text);
                    },
                    obscureText: controller.isConfirmPasswordObscure.value,
                    decoration: InputDecoration(
                      hintText: "Ulangi password anda",
                      hintStyle: TextStyle(
                        color: Colors.black26,
                      ),
                      suffixIcon: IconButton(
                        onPressed: controller.onChangeVisibilityConfirmPassword,
                        icon: Icon(controller.isConfirmPasswordObscure.value
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
                  height: 32,
                ),
                SizedBox(
                  width: Get.width,
                  child: FilledButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Color(ColorTheme.SECONDARY_500),
                      ),
                      foregroundColor: WidgetStatePropertyAll(
                        Color(ColorTheme.SECONDARY_800),
                      ),
                    ),
                    onPressed: controller.onRegister,
                    child: Text("Daftar"),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Sudah punya akun ?"),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: WidgetStatePropertyAll(
                          Color(ColorTheme.PRIMARY_600),
                        ),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("Masuk"),
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
    );
  }
}
