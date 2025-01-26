import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_complaint_controller.dart';

class UserComplaintView extends GetView<UserComplaintController> {
  const UserComplaintView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserComplaintView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'UserComplaintView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
