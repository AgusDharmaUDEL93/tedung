// To parse this JSON data, do
//
//     final complaint = complaintFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tedung/app/data/utils/type_bully.dart';

Complaint complaintFromJson(String str) => Complaint.fromJson(json.decode(str));

String complaintToJson(Complaint data) => json.encode(data.toJson());

class Complaint {
  String? complaintId;
  String? userUid;
  String? bully;
  TypeBully? bullyType;
  String? bullySubject;
  String? bullyDescription;
  SendForOther? sendForOther;
  bool? isAnonym;
  Timestamp? timestamp;

  Complaint({
    this.complaintId,
    this.userUid,
    this.bully,
    this.bullyType,
    this.bullySubject,
    this.bullyDescription,
    this.sendForOther,
    this.isAnonym,
    this.timestamp,
  });

  factory Complaint.fromJson(Map<String, dynamic> json,
          {String? complaintId}) =>
      Complaint(
        complaintId: complaintId,
        userUid: json["user_uid"],
        bully: json["bully"],
        bullyType: TypeBully.values
            .firstWhere((element) => element.codes == json["bully_type"]),
        bullySubject: json["bully_subject"],
        bullyDescription: json["bully_description"],
        sendForOther: json["send_for_other"] == null
            ? null
            : SendForOther.fromJson(json["send_for_other"]),
        isAnonym: json["is_anonym"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "user_uid": userUid,
        "bully": bully,
        "bully_type": bullyType?.codes,
        "bully_subject": bullySubject,
        "bully_description": bullyDescription,
        "send_for_other": sendForOther?.toJson(),
        "is_anonym": isAnonym,
        "timestamp": timestamp,
      };
}

class SendForOther {
  String? victimName;
  String? victimPosition;

  SendForOther({
    this.victimName,
    this.victimPosition,
  });

  factory SendForOther.fromJson(Map<String, dynamic> json) => SendForOther(
        victimName: json["victim_name"],
        victimPosition: json["victim_position"],
      );

  Map<String, dynamic> toJson() => {
        "victim_name": victimName,
        "victim_position": victimPosition,
      };
}
