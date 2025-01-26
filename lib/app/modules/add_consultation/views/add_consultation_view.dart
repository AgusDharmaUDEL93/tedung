import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tedung/app/utils/validators.dart';

import '../../../theme/color.dart';
import '../controllers/add_consultation_controller.dart';

class AddConsultationView extends GetView<AddConsultationController> {
  const AddConsultationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tambah Konsultasi",
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
                    "Tanggal Konsultasi",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: controller.consultationDateController,
                    validator: (value) {
                      return onCheckDateAfter(value, "Tanggal Konsultasi");
                    },
                    readOnly: true,
                    onTap: () {
                      controller.selectDateTime(context);
                    },
                    decoration: InputDecoration(
                      hintText: "Masukkan tanggal konsultasi",
                      hintStyle: TextStyle(
                        color: Colors.black26,
                      ),
                      prefixIcon: Icon(
                        Icons.calendar_month,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 48,
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
                      onPressed: controller.onAddConsultation,
                      child: Text("Tambah"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
