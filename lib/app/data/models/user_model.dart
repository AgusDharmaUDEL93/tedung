// To parse this JSON data, do
//
//     final userRelated = userRelatedFromJson(jsonString);

import 'dart:convert';

import 'package:tedung/app/data/utils/gender.dart';

import '../utils/roles.dart';

UserRelated userRelatedFromJson(String str) =>
    UserRelated.fromJson(json.decode(str));

String userRelatedToJson(UserRelated data) => json.encode(data.toJson());

class UserRelated {
  String? name;
  String? email;
  String? phoneNumber;
  Gender? gender;
  int? age;
  int? yearsOfService;
  String? position;
  Role? role;

  UserRelated({
    this.name,
    this.email,
    this.phoneNumber,
    this.gender,
    this.age,
    this.yearsOfService,
    this.position,
    this.role,
  });

  factory UserRelated.fromJson(Map<String, dynamic> json) => UserRelated(
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        gender: Gender.values
            .firstWhere((element) => element.codes == json["gender"]),
        age: json["age"],
        yearsOfService: json["years_of_service"],
        position: json["position"],
        role:
            Role.values.firstWhere((element) => element.codes == json["role"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone_number": phoneNumber,
        "gender": gender?.codes,
        "age": age,
        "years_of_service": yearsOfService,
        "position": position,
        "role": role?.codes,
      };
}
