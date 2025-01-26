import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tedung/app/data/models/consultation.dart';
import 'package:tedung/app/data/models/user_model.dart';
import 'package:tedung/app/data/utils/roles.dart';
import 'package:tedung/app/theme/color.dart';
import 'package:tedung/app/utils/timestamp_format.dart';

import '../controllers/consultation_detail_controller.dart';

class ConsultationDetailView extends GetView<ConsultationDetailController> {
  const ConsultationDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: SafeArea(
        child: StreamBuilder<Consultation>(
          stream: controller.getConsultationData(),
          builder: (context, consulation) {
            return Padding(
              padding: EdgeInsets.all(16),
              child: StreamBuilder<UserRelated>(
                stream: controller
                    .getUserData(consulation.data?.psychologistId ?? "T"),
                builder: (context, psychologist) {
                  return StreamBuilder<UserRelated>(
                    stream: consulation.data?.bookedBy == null
                        ? null
                        : controller.getUserData(consulation.data!.bookedBy!),
                    builder: (context, bookBy) {
                      return SizedBox(
                        height: Get.height,
                        width: Get.width,
                        child: Stack(
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Konsultasi",
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
                                    "Data Konsultasi",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                      "Tanggal Konsultasi : ${formatTimestampDate(consulation.data?.schedule ?? Timestamp.now())}"),
                                  Text(
                                      "Jam Konsultasi : ${formatTimestampTime(consulation.data?.schedule ?? Timestamp.now())}"),
                                  SizedBox(
                                    height: 32,
                                  ),
                                  Text(
                                    "Data Dokter",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Nama : ${psychologist.data?.name}"),
                                      Text(
                                          "Jenis Kelamin : ${psychologist.data?.gender?.name}"),
                                      Text(
                                          "Posisi/Jabatan : ${psychologist.data?.position}"),
                                      Text(
                                          "Masa Kerja (th) : ${psychologist.data?.yearsOfService} th"),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 32,
                                  ),
                                  bookBy.data == null
                                      ? SizedBox()
                                      : Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Dibook Oleh",
                                              style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text("Nama : ${bookBy.data?.name}"),
                                            Text(
                                                "Jenis Kelamin : ${bookBy.data?.gender?.name}"),
                                            Text(
                                                "Posisi/Jabatan : ${bookBy.data?.position}"),
                                            Text(
                                                "Masa Kerja (th) : ${bookBy.data?.yearsOfService} th")
                                          ],
                                        ),
                                ],
                              ),
                            ),
                            StreamBuilder<UserRelated>(
                                stream: controller.getUserData(
                                    controller.auth.currentUser?.uid ?? ""),
                                builder: (context, currentUser) {
                                  return currentUser.data?.role == Role.worker
                                      ? Positioned(
                                          bottom: 0,
                                          left: 0,
                                          right: 0,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                bottom: 16,
                                                top: 16,
                                              ),
                                              child: SizedBox(
                                                width: Get.width * 0.9,
                                                child: FilledButton(
                                                  onPressed: bookBy.data !=
                                                              null ||
                                                          consulation
                                                              .data!.schedule!
                                                              .toDate()
                                                              .isAfter(DateTime
                                                                  .now())
                                                      ? null
                                                      : () {
                                                          controller.onBookConsultation(
                                                              psychologist.data
                                                                      ?.email ??
                                                                  "",
                                                              formatTimestampGoogleCalendar(
                                                                  consulation
                                                                          .data
                                                                          ?.schedule ??
                                                                      Timestamp
                                                                          .now()));
                                                        },
                                                  child: Text(
                                                    'Book',
                                                    style: TextStyle(
                                                      color: Color(
                                                        ColorTheme.PRIMARY_800,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      : SizedBox();
                                }),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
