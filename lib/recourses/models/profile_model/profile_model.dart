import 'dart:convert';

import 'package:hive/hive.dart';
part 'profile_model.g.dart';
@HiveType(typeId: 1)
class ProfileModel {
  @HiveField(0)
  DateTime createdAt;
  @HiveField(1)
  String address;
  @HiveField(2)
  String level;
  @HiveField(3)
  String displayName;
  @HiveField(4)
  List<String> roles;
  @HiveField(5)
  int v;
  @HiveField(6)
  bool active;
  @HiveField(7)
  String id;
  @HiveField(8)
  int experienceYears;
  @HiveField(9)
  String username;
  @HiveField(10)
  DateTime updatedAt;
  @HiveField(11)
  ProfileModel({
    required this.createdAt,
    required this.address,
    required this.level,
    required this.displayName,
    required this.roles,
    required this.v,
    required this.active,
    required this.id,
    required this.experienceYears,
    required this.username,
    required this.updatedAt,
  });

  factory ProfileModel.fromJson(Map<dynamic, dynamic> json) => ProfileModel(
        createdAt: DateTime.parse(json["createdAt"]),
        address: json["address"],
        level: json["level"],
        displayName: json["displayName"],
        roles: List<String>.from(json["roles"].map((x) => x)),
        v: json["__v"],
        active: json["active"],
        id: json["_id"],
        experienceYears: json["experienceYears"],
        username: json["username"],
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<dynamic, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "address": address,
        "level": level,
        "displayName": displayName,
        "roles": List<dynamic>.from(roles.map((x) => x)),
        "__v": v,
        "active": active,
        "_id": id,
        "experienceYears": experienceYears,
        "username": username,
        "updatedAt": updatedAt.toIso8601String(),
      };
}
