class Offer {
  int id;
  String name;
  String description;
  int discount;
  String image;
  dynamic deletedAt;

  Offer({
    required this.id,
    required this.name,
    required this.description,
    required this.discount,
    required this.image,
    required this.deletedAt,
  });

  Offer copyWith({
    int? id,
    String? name,
    String? description,
    int? discount,
    String? image,
    dynamic deletedAt,
  }) =>
      Offer(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        discount: discount ?? this.discount,
        image: image ?? this.image,
        deletedAt: deletedAt ?? this.deletedAt,
      );

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    discount: json["discount"],
    image: json["image"],
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "discount": discount,
    "image": image,
    "deleted_at": deletedAt,
  };
}