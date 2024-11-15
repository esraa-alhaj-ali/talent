class Librarya {
  int id;
  dynamic parentId;
  String type;
  String name;
  String image;
  String description;
  dynamic subSections;
  dynamic lessons;

  Librarya({
    required this.id,
    required this.parentId,
    required this.type,
    required this.name,
    required this.image,
    required this.description,
    required this.subSections,
    required this.lessons,
  });

  Librarya copyWith({
    int? id,
    dynamic parentId,
    String? type,
    String? name,
    String? image,
    String? description,
    dynamic subSections,
    dynamic lessons,
  }) =>
      Librarya(
        id: id ?? this.id,
        parentId: parentId ?? this.parentId,
        type: type ?? this.type,
        name: name ?? this.name,
        image: image ?? this.image,
        description: description ?? this.description,
        subSections: subSections ?? this.subSections,
        lessons: lessons ?? this.lessons,
      );

  factory Librarya.fromJson(Map<String, dynamic> json) => Librarya(
    id: json["id"],
    parentId: json["parent_id"],
    type: json["type"],
    name: json["name"],
    image: json["image"],
    description: json["description"],
    subSections: json["sub_sections"],
    lessons: json["lessons"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "parent_id": parentId,
    "type": type,
    "name": name,
    "image": image,
    "description": description,
    "sub_sections": subSections,
    "lessons": lessons,
  };
}