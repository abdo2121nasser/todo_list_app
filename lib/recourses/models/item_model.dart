

class ItemModel {
    ItemModel({
        required this.image,
        required this.createdAt,
        required this.v,
        required this.id,
        required this.title,
        required this.priority,
        required this.user,
        required this.desc,
        required this.status,
        required this.updatedAt,
    });

    String? image;
    DateTime createdAt;
    int v;
    String id;
    String title;
    String priority;
    String user;
    String desc;
    String status;
    DateTime updatedAt;

    factory ItemModel.fromJson(Map<dynamic, dynamic> json) => ItemModel(
        image: json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
        id: json["_id"],
        title: json["title"],
        priority: json["priority"],
        user: json["user"],
        desc: json["desc"],
        status: json["status"],
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<dynamic, dynamic> toJson() => {
        "image": image,
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
        "_id": id,
        "title": title,
        "priority": priority,
        "user": user,
        "desc": desc,
        "status": status,
        "updatedAt": updatedAt.toIso8601String(),
    };
}
