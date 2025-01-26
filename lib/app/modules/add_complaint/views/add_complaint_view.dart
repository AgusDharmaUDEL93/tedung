import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tedung/app/data/utils/type_bully.dart';
import 'package:tedung/app/utils/validators.dart';

import '../../../theme/color.dart';
import '../controllers/add_complaint_controller.dart';

class AddComplaintView extends GetView<AddComplaintController> {
  const AddComplaintView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(
            16,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tambah Pengaduan",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Perundungan",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Pelaku",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  TextFormField(
                    controller: controller.perpetratorController,
                    validator: (value) {
                      return onNotEmptyValidation(value, "Pelaku");
                    },
                    decoration: InputDecoration(
                      hintText: "Masukkan nama pelaku",
                      hintStyle: TextStyle(
                        color: Colors.black26,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    "Jenis Perundungan",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  DropdownButtonFormField<TypeBully>(
                    value: controller.typeBully,
                    items: TypeBully.values
                        .map(
                          (element) => DropdownMenuItem<TypeBully>(
                            value: element,
                            child: Text(element.name),
                          ),
                        )
                        .toList(),
                    onChanged: (TypeBully? newGender) {
                      if (newGender != null) {}
                    },
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    "Deskripsi Perundungan",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  TextFormField(
                    controller: controller.subjectController,
                    validator: (value) {
                      return onNotEmptyValidation(
                          value, "Deskripsi Perundungan");
                    },
                    decoration: InputDecoration(
                      hintText: "Masukkan deskripsi perundungan",
                      hintStyle: TextStyle(
                        color: Colors.black26,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    "Penjelasan",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  TextFormField(
                    controller: controller.descriptionController,
                    validator: (value) {
                      return onNotEmptyValidation(value, "Penjelasan");
                    },
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "Jelaskan situasi perundungan",
                      hintStyle: TextStyle(
                        color: Colors.black26,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Kirim untuk orang lain",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Obx(
                        () => Switch(
                          value: controller.isSendForAnotherPeople.value,
                          onChanged: controller.onChangeSendForAnotherPeople,
                        ),
                      )
                    ],
                  ),
                  Obx(
                    () => controller.isSendForAnotherPeople.value
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 36,
                              ),
                              Text(
                                "Data Korban",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
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
                                controller: controller.victimNameController,
                                validator: (value) {
                                  return onNotEmptyValidation(
                                      value, "Nama Korban");
                                },
                                decoration: InputDecoration(
                                  hintText: "Masukkan nama korban",
                                  hintStyle: TextStyle(
                                    color: Colors.black26,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 32,
                              ),
                              Text(
                                "Jabatan",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              TextFormField(
                                controller: controller.victimPositionController,
                                validator: (value) {
                                  return onNotEmptyValidation(
                                      value, "Jabatan Korban");
                                },
                                decoration: InputDecoration(
                                  hintText: "Masukkan jabatan korban",
                                  hintStyle: TextStyle(
                                    color: Colors.black26,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : SizedBox(),
                  ),
                  SizedBox(
                    height: 64,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Kirim sebagai anonim",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Obx(
                        () => Switch(
                          value: controller.isSendAsAnonym.value,
                          onChanged: controller.onChangeSendAsAnonym,
                        ),
                      )
                    ],
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
                      onPressed: controller.onAddComplaint,
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
