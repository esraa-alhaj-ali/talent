// To parse this JSON data, do
//
//     final homeResponse = homeResponseFromJson(jsonString);

import 'dart:convert';

import '../../Offers/models/offer.dart';
import '../../Proffesor/model/professor.dart';
import '../../Section/models/section.dart';

HomeResponse homeResponseFromJson(String str) => HomeResponse.fromJson(json.decode(str));

String homeResponseToJson(HomeResponse data) => json.encode(data.toJson());

class HomeResponse {
  Data data;
  int code;

  HomeResponse({
    required this.data,
    required this.code,
  });

  HomeResponse copyWith({
    Data? data,
    int? code,
  }) =>
      HomeResponse(
        data: data ?? this.data,
        code: code ?? this.code,
      );

  factory HomeResponse.fromJson(Map<String, dynamic> json) => HomeResponse(
    data: Data.fromJson(json["data"]),
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "code": code,
  };
}

class Data {
  Instructors instructors;
  Sections sections;
  Offers offers;
  Courses courses;
  Library dataLibrary;

  Data({
    required this.instructors,
    required this.sections,
    required this.offers,
    required this.courses,
    required this.dataLibrary,
  });

  Data copyWith({
    Instructors? instructors,
    Sections? sections,
    Offers? offers,
    Courses? courses,
    Library? dataLibrary,
  }) =>
      Data(
        instructors: instructors ?? this.instructors,
        sections: sections ?? this.sections,
        offers: offers ?? this.offers,
        courses: courses ?? this.courses,
        dataLibrary: dataLibrary ?? this.dataLibrary,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    instructors: Instructors.fromJson(json["instructors"]),
    sections: Sections.fromJson(json["sections"]),
    offers: Offers.fromJson(json["offers"]),
    courses: Courses.fromJson(json["courses"]),
    dataLibrary: Library.fromJson(json["library"]),
  );

  Map<String, dynamic> toJson() => {
    "instructors": instructors.toJson(),
    "sections": sections.toJson(),
    "offers": offers.toJson(),
    "courses": courses.toJson(),
    "library": dataLibrary.toJson(),
  };
}

class Courses {
  List<CoursesDatum> data;

  Courses({
    required this.data,
  });

  Courses copyWith({
    List<CoursesDatum>? data,
  }) =>
      Courses(
        data: data ?? this.data,
      );

  factory Courses.fromJson(Map<String, dynamic> json) => Courses(
    data: List<CoursesDatum>.from(json["data"].map((x) => CoursesDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class CoursesDatum {
  int id;
  String parentId;
  String type;
  String name;
  String image;
  String description;
  String isFree;
  String price;
  String discount;
  String totalLessonsTime;
  double totalPrice;
  List<dynamic> teachers;
  dynamic isSpecial;
  dynamic subscribed;

  CoursesDatum({
    required this.id,
    required this.parentId,
    required this.type,
    required this.name,
    required this.image,
    required this.description,
    required this.isFree,
    required this.price,
    required this.discount,
    required this.totalLessonsTime,
    required this.totalPrice,
    required this.teachers,
    required this.isSpecial,
    required this.subscribed,
  });

  CoursesDatum copyWith({
    int? id,
    String? parentId,
    String? type,
    String? name,
    String? image,
    String? description,
    String? isFree,
    String? price,
    String? discount,
    String? totalLessonsTime,
    double? totalPrice,
    List<dynamic>? teachers,
    dynamic isSpecial,
    dynamic subscribed,
  }) =>
      CoursesDatum(
        id: id ?? this.id,
        parentId: parentId ?? this.parentId,
        type: type ?? this.type,
        name: name ?? this.name,
        image: image ?? this.image,
        description: description ?? this.description,
        isFree: isFree ?? this.isFree,
        price: price ?? this.price,
        discount: discount ?? this.discount,
        totalLessonsTime: totalLessonsTime ?? this.totalLessonsTime,
        totalPrice: totalPrice ?? this.totalPrice,
        teachers: teachers ?? this.teachers,
        isSpecial: isSpecial ?? this.isSpecial,
        subscribed: subscribed ?? this.subscribed,
      );

  factory CoursesDatum.fromJson(Map<String, dynamic> json) => CoursesDatum(
    id: json["id"],
    parentId: json["parent_id"],
    type: json["type"],
    name: json["name"],
    image: json["image"],
    description: json["description"],
    isFree: json["is_free"],
    price: json["price"],
    discount: json["discount"],
    totalLessonsTime: json["total_lessons_time"],
    totalPrice: json["total_price"]?.toDouble(),
    teachers: List<dynamic>.from(json["teachers"].map((x) => x)),
    isSpecial: json["is_special"],
    subscribed: json["subscribed"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "parent_id": parentId,
    "type": type,
    "name": name,
    "image": image,
    "description": description,
    "is_free": isFree,
    "price": price,
    "discount": discount,
    "total_lessons_time": totalLessonsTime,
    "total_price": totalPrice,
    "teachers": List<dynamic>.from(teachers.map((x) => x)),
    "is_special": isSpecial,
    "subscribed": subscribed,
  };
}

class Library {
  String image;
  String description;

  Library({
    required this.image,
    required this.description,
  });

  Library copyWith({
    String? image,
    String? description,
  }) =>
      Library(
        image: image ?? this.image,
        description: description ?? this.description,
      );

  factory Library.fromJson(Map<String, dynamic> json) => Library(
    image: json["image"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "description": description,
  };
}

class Instructors {
  List<Professor> data;

  Instructors({
    required this.data,
  });

  Instructors copyWith({
    List<Professor>? data,
  }) =>
      Instructors(
        data: data ?? this.data,
      );

  factory Instructors.fromJson(Map<String, dynamic> json) => Instructors(
    data: List<Professor>.from(json["data"].map((x) => Professor.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}


class Offers {
  List<Offer> data;

  Offers({
    required this.data,
  });

  Offers copyWith({
    List<Offer>? data,
  }) =>
      Offers(
        data: data ?? this.data,
      );

  factory Offers.fromJson(Map<String, dynamic> json) => Offers(
    data: List<Offer>.from(json["data"].map((x) => Offer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}


class Sections {
  List<Section> data;

  Sections({
    required this.data,
  });

  Sections copyWith({
    List<Section>? data,
  }) =>
      Sections(
        data: data ?? this.data,
      );

  factory Sections.fromJson(Map<String, dynamic> json) => Sections(
    data: List<Section>.from(json["data"].map((x) => Section.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

