import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tedung/app/utils/timestamp_format.dart';

import '../../../routes/app_pages.dart';
import '../../../theme/color.dart';
import '../controllers/home_content_psychologist_controller.dart';

class HomeContentPsychologistView
    extends GetView<HomeContentPsychologistController> {
  const HomeContentPsychologistView({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: controller.initialIndex,
      length: controller.length,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(Routes.ADD_CONSULTATION);
          },
          child: Icon(
            Icons.add,
            color: Color(ColorTheme.PRIMARY_800),
          ),
        ),
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
                  StreamBuilder(
                    stream: controller.getAllConsultation(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasError) {
                        var error = snapshot.error.toString();
                        return Center(
                          child: Text("Error $error"),
                        );
                      }

                      if (snapshot.data == null || snapshot.data!.isEmpty) {
                        return const Center(
                          child: Text("Tidak ada consultasi"),
                        );
                      }

                      return ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Jadwal Konsultasi",
                                    style: TextStyle(
                                      color: Color(ColorTheme.SECONDARY_600),
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
                                      // snapshot.data?[index].bookedBy != null
                                      //     ? time.isBefore(DateTime.now())
                                      //         ? "Selesai"
                                      //         : "Sudah di Book"
                                      //     : "Dijadwalkan",
                                      time.isBefore(DateTime.now())
                                          ? "Selesai"
                                          : snapshot.data?[index].bookedBy !=
                                                  null
                                              ? "Sudah di book"
                                              : "Siap di book",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: time.isBefore(DateTime.now())
                                            ? Theme.of(context)
                                                .colorScheme
                                                .error
                                            : snapshot.data?[index].bookedBy !=
                                                    null
                                                ? Color(ColorTheme.PRIMARY_600)
                                                : Color(
                                                    ColorTheme.SECONDARY_600),
                                      ),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ],
                              ),
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
                    },
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
