import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/password_setting_controller.dart';

class PasswordSettingView extends GetView<PasswordSettingController> {
  const PasswordSettingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PasswordSettingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PasswordSettingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
