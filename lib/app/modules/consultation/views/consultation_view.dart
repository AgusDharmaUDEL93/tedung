import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tedung/app/data/models/consultation.dart';
import 'package:tedung/app/data/models/user_model.dart';
import 'package:tedung/app/routes/app_pages.dart';
import 'package:tedung/app/utils/timestamp_format.dart';

import '../../../theme/color.dart';
import '../controllers/consultation_controller.dart';

class ConsultationView extends GetView<ConsultationController> {
  const ConsultationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
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
                StreamBuilder<List<Consultation>>(
                    stream: controller.getAllConsultation(),
                    builder: (context, snapshot) {
                      return ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var time = snapshot.data?[index].schedule?.toDate() ??
                              Timestamp.now().toDate();
                          return InkWell(
                            onTap: () {
                              Get.toNamed(
                                Routes.CONSULTATION_DETAIL,
                                parameters: {
                                  "consultation_id":
                                      snapshot.data?[index].consultationId ?? ""
                                },
                              );
                            },
                            child: Container(
                              width: Get.width,
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(ColorTheme.SECONDARY_400),
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: StreamBuilder<UserRelated>(
                                  stream: controller.getPsychologistData(
                                      snapshot.data?[index].psychologistId ??
                                          ""),
                                  builder: (context, psychologist) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Dr. ${psychologist.data?.name}",
                                          style: TextStyle(
                                            color:
                                                Color(ColorTheme.SECONDARY_600),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          "Waktu Konsultasi : ${formatTimestampLong(snapshot.data?[index].schedule ?? Timestamp.now())}",
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        SizedBox(
                                          width: Get.width,
                                          child: Text(
                                            snapshot.data?[index].bookedBy !=
                                                    null
                                                ? time.isBefore(DateTime.now())
                                                    ? "Selesai"
                                                    : "Sudah di Book"
                                                : "Dijadwalkan",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: snapshot.data?[index]
                                                          .bookedBy !=
                                                      null
                                                  ? time.isBefore(
                                                          DateTime.now())
                                                      ? Theme.of(context)
                                                          .colorScheme
                                                          .error
                                                      : Color(ColorTheme
                                                          .PRIMARY_600)
                                                  : Color(
                                                      ColorTheme.SECONDARY_600),
                                            ),
                                            textAlign: TextAlign.end,
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                            ),
                          );
                        },
                        itemCount: snapshot.data?.length ?? 0,
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 10,
                          );
                        },
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
