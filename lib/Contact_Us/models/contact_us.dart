// To parse this JSON data, do
//
//     final contactUsResponse = contactUsResponseFromJson(jsonString);

import 'dart:convert';

ContactUsResponse contactUsResponseFromJson(String str) => ContactUsResponse.fromJson(json.decode(str));

String contactUsResponseToJson(ContactUsResponse data) => json.encode(data.toJson());

class ContactUsResponse {
  ContactUs data;
  int code;

  ContactUsResponse({
    required this.data,
    required this.code,
  });

  ContactUsResponse copyWith({
    ContactUs? data,
    int? code,
  }) =>
      ContactUsResponse(
        data: data ?? this.data,
        code: code ?? this.code,
      );

  factory ContactUsResponse.fromJson(Map<String, dynamic> json) => ContactUsResponse(
    data: ContactUs.fromJson(json["data"]),
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "code": code,
  };
}

class ContactUs {
  int id;
  String name;
  String email;
  String message;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

ContactUs({
    required this.id,
    required this.name,
    required this.email,
    required this.message,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  ContactUs copyWith({
    int? id,
    String? name,
    String? email,
    String? message,
    dynamic deletedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      ContactUs(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        message: message ?? this.message,
        deletedAt: deletedAt ?? this.deletedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory ContactUs.fromJson(Map<String, dynamic> json) => ContactUs(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    message: json["message"],
    deletedAt: json["deleted_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "message": message,
    "deleted_at": deletedAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
