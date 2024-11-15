// class ProfileModel {
//   Data? data;
//   String? message;
//
//   ProfileModel({this.data, this.message});
//
//   ProfileModel.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null ? Data.fromJson(json['data']) : null;
//     message = json['message'];
//   }
// }
//
// class Data {
//   User? user;
//   Data({this.user});
//   Data.fromJson(Map<String, dynamic> json) {
//     user = json['user'] != null ? User.fromJson(json['user']) : null;
//   }
// }
//
// class User {
//   String? username;
//   String? email;
//   String? firstName;
//   String? lastName;
//   String? phoneNumber;
//   String? updatedAt;
//   String? createdAt;
//   int? id;
//
//
//   User(
//       {this.username,
//         this.email,
//         this.firstName,
//         this.lastName,
//         this.phoneNumber,
//         this.updatedAt,
//         this.createdAt,
//         this.id,
//       });
//
//   User.fromJson(Map<String, dynamic> json) {
//     username = json['username'];
//     email = json['email'];
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     phoneNumber = json['phone_number'];
//     updatedAt = json['updated_at'];
//     createdAt = json['created_at'];
//     id = json['id'];
//   }
// }

// To parse this JSON data, do
//
//     final profieResponse = profieResponseFromJson(jsonString);

import 'dart:convert';

ProfieResponse profieResponseFromJson(String str) =>
    ProfieResponse.fromJson(json.decode(str));

String profieResponseToJson(ProfieResponse data) => json.encode(data.toJson());

class ProfieResponse {
  final Data data;
  final int code;
  final Notifications notifications;
  final List<dynamic> notificationsTypesStats;
  final int notificationsCount;

  ProfieResponse({
    required this.data,
    required this.code,
    required this.notifications,
    required this.notificationsTypesStats,
    required this.notificationsCount,
  });

  factory ProfieResponse.fromJson(Map<String, dynamic> json) => ProfieResponse(
        data: Data.fromJson(json["data"]),
        code: json["code"],
        notifications: Notifications.fromJson(json["notifications"]),
        notificationsTypesStats:
            List<dynamic>.from(json["notifications_types_stats"].map((x) => x)),
        notificationsCount: json["notifications_count"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "code": code,
        "notifications": notifications.toJson(),
        "notifications_types_stats":
            List<dynamic>.from(notificationsTypesStats.map((x) => x)),
        "notifications_count": notificationsCount,
      };
}

class Data {
  final int id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String phoneNumber;
  final dynamic emailVerifiedAt;
  final DateTime lastActiveAt;
  final int isActive;
  final dynamic description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;
  final dynamic image;

  Data({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.emailVerifiedAt,
    required this.lastActiveAt,
    required this.isActive,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.image,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        username: json["username"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        emailVerifiedAt: json["email_verified_at"],
        lastActiveAt: DateTime.parse(json["last_active_at"]),
        isActive: json["is_active"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "email": email,
        "phone_number": phoneNumber,
        "email_verified_at": emailVerifiedAt,
        "last_active_at": lastActiveAt.toIso8601String(),
        "is_active": isActive,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "image": image,
      };
}

class Notifications {
  final int currentPage;
  final List<dynamic> data;
  final String firstPageUrl;
  final dynamic from;
  final int lastPage;
  final String lastPageUrl;
  final List<Link> links;
  final dynamic nextPageUrl;
  final String path;
  final int perPage;
  final dynamic prevPageUrl;
  final dynamic to;
  final int total;

  Notifications({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
        currentPage: json["current_page"],
        data: List<dynamic>.from(json["data"].map((x) => x)),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x)),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Link {
  final String? url;
  final String label;
  final bool active;

  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
