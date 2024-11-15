class Section {
  int id;
  int? parentId;
  String type;
  String name;
  String image;
  String description;
  bool isSpecial;
  dynamic teachers;
  bool subscribed;
  String totalLessonsTime;

  Section({
    required this.id,
    required this.parentId,
    required this.type,
    required this.name,
    required this.image,
    required this.description,
    required this.isSpecial,
    required this.teachers,
    required this.subscribed,
    required this.totalLessonsTime,
  });

  Section copyWith({
    int? id,
    int? parentId,
    String? type,
    String? name,
    String? image,
    String? description,
    bool ? isSpecial,
    dynamic teachers,
    bool? subscribed,
    String? totalLessonsTime,
  }) =>
      Section(
        id: id ?? this.id,
        parentId: parentId ?? this.parentId,
        type: type ?? this.type,
        name: name ?? this.name,
        image: image ?? this.image,
        description: description ?? this.description,
        isSpecial: isSpecial ?? this.isSpecial,
        teachers: teachers ?? this.teachers,
        subscribed: subscribed ?? this.subscribed,
        totalLessonsTime: totalLessonsTime ?? this.totalLessonsTime,
      );

  factory Section.fromJson(Map<String, dynamic> json) => Section(
    id: json["id"],
    parentId: json["parent_id"],
    type: json["type"],
    name: json["name"],
    image: json["image"],
    description: json["description"],
    isSpecial: json["is_special"] ?? false,
    teachers: json["teachers"],
    subscribed: json["subscribed"]??false,
    totalLessonsTime: json["total_lessons_time"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "parent_id": parentId,
    "type": type,
    "name": name,
    "image": image,
    "description": description,
    "is_special": isSpecial,
    "teachers": teachers,
    "subscribed": subscribed,
    "total_lessons_time": totalLessonsTime,
  };
}