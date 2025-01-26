import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tedung/app/data/models/complaint.dart';
import 'package:tedung/app/data/models/user_model.dart';
import 'package:tedung/app/routes/app_pages.dart';
import 'package:tedung/app/utils/timestamp_format.dart';

import '../../../theme/color.dart';
import '../controllers/home_content_admin_controller.dart';

class HomeContentAdminView extends GetView<HomeContentAdminController> {
  const HomeContentAdminView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Daftar Pengaduan",
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
                StreamBuilder<List<Complaint>>(
                    stream: controller.getAllComplaint(),
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

                      if (snapshot.data?.length == 0) {
                        return const Center(
                          child: Text("Tidak ada complaint"),
                        );
                      }

                      return ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return StreamBuilder<UserRelated>(
                            stream: controller.getUserData(
                                snapshot.data?[index].userUid ?? ""),
                            builder: (context, element) {
                              return InkWell(
                                onTap: () {
                                  Get.toNamed(
                                    Routes.COMPLAINT_DETAIL,
                                    parameters: {
                                      "complaint_id":
                                          snapshot.data?[index].complaintId ??
                                              "",
                                    },
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(ColorTheme.SECONDARY_400),
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.warning,
                                            color:
                                                Color(ColorTheme.PRIMARY_700),
                                          ),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Expanded(
                                            child: Text(
                                              snapshot.data?[index]?.isAnonym ??
                                                      true
                                                  ? "Anonim"
                                                  : element.data?.name ?? "",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Color(
                                                    ColorTheme.PRIMARY_700),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            formatTimestamp(snapshot
                                                .data![index].timestamp!),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  Color(ColorTheme.PRIMARY_700),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Text(
                                        snapshot.data?[index].bullyType?.name ??
                                            "No Type",
                                        style: TextStyle(
                                          color:
                                              Color(ColorTheme.SECONDARY_600),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      SizedBox(
                                        width: Get.width,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data?[index]
                                                      .bullySubject ??
                                                  "No Subject",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              snapshot.data?[index]
                                                      .bullyDescription ??
                                                  "No Description",
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                      snapshot.data?[index].sendForOther != null
                                          ? Column(
                                              children: [
                                                SizedBox(
                                                  height: 16,
                                                ),
                                                SizedBox(
                                                  width: Get.width,
                                                  child: Text(
                                                      "Korban : ${snapshot.data?[index].sendForOther?.victimName}"),
                                                )
                                              ],
                                            )
                                          : SizedBox(),
                                    ],
                                  ),
                                ),
                              );
                            },
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
