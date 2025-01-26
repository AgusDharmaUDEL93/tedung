import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tedung/app/data/models/complaint.dart';
import 'package:tedung/app/theme/color.dart';
import 'package:tedung/app/utils/timestamp_format.dart';

import '../controllers/complaint_detail_controller.dart';

class ComplaintDetailView extends GetView<ComplaintDetailController> {
  const ComplaintDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: StreamBuilder<Complaint>(
              stream: controller.getComplaintData(),
              builder: (context, snapshot) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      snapshot.data?.bullySubject ?? "-",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: Get.width,
                      child: Text(
                        formatTimestampLong(
                            snapshot.data?.timestamp ?? Timestamp.now()),
                        textAlign: TextAlign.end,
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      snapshot.data?.bullyType?.name ?? "-",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(ColorTheme.SECONDARY_600),
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text(snapshot.data?.bullyDescription ?? "-"),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      "Data Korban",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    snapshot.data?.sendForOther != null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "Nama : ${snapshot.data?.sendForOther?.victimName}"),
                              Text(
                                  "Posisi/Jabatan : ${snapshot.data?.sendForOther?.victimPosition}"),
                            ],
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 32,
                    ),
                    SizedBox(
                      width: Get.width,
                      child: Text(
                        "Dikirim oleh anonim",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(ColorTheme.PRIMARY_600),
                        ),
                        textAlign: TextAlign.end,
                      ),
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
