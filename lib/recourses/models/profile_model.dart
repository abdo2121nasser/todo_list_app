import 'dart:convert';

class ProfileModel {
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

  DateTime createdAt;
  String address;
  String level;
  String displayName;
  List<String> roles;
  int v;
  bool active;
  String id;
  int experienceYears;
  String username;
  DateTime updatedAt;

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
