// To parse this JSON data, do
//
//     final consultation = consultationFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

Consultation consultationFromJson(String str) =>
    Consultation.fromJson(json.decode(str));

String consultationToJson(Consultation data) => json.encode(data.toJson());

class Consultation {
  String? consultationId;
  String? psychologistId;
  Timestamp? schedule;
  String? bookedBy;

  Consultation({
    this.consultationId,
    this.psychologistId,
    this.schedule,
    this.bookedBy,
  });

  factory Consultation.fromJson(Map<String, dynamic> json,
          {String? consultationId}) =>
      Consultation(
        consultationId: consultationId,
        psychologistId: json["psychologist_id"],
        schedule: json["schedule"],
        bookedBy: json["booked_by"],
      );

  Map<String, dynamic> toJson() => {
        "psychologist_id": psychologistId,
        "schedule": schedule,
        "booked_by": bookedBy,
      };
}
