class Professor {
  int id;
  String firstName;
  String lastName;
  String fullName;
  String username;
  String description;
  String email;
  String phoneNumber;
  dynamic emailVerifiedAt;
  dynamic lastActiveAt;
  int isHidden;
  String image;
  dynamic courses;

  Professor({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.username,
    required this.description,
    required this.email,
    required this.phoneNumber,
    required this.emailVerifiedAt,
    required this.lastActiveAt,
    required this.isHidden,
    required this.image,
    required this.courses,
  });

  Professor copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? fullName,
    String? username,
    String? description,
    String? email,
    String? phoneNumber,
    dynamic emailVerifiedAt,
    dynamic lastActiveAt,
    int? isHidden,
    String? image,
    dynamic courses,
  }) =>
      Professor(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        fullName: fullName ?? this.fullName,
        username: username ?? this.username,
        description: description ?? this.description,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        lastActiveAt: lastActiveAt ?? this.lastActiveAt,
        isHidden: isHidden ?? this.isHidden,
        image: image ?? this.image,
        courses: courses ?? this.courses,
      );

  factory Professor.fromJson(Map<String, dynamic> json) => Professor(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    fullName: json["full_name"],
    username: json["username"],
    description: json["description"],
    email: json["email"],
    phoneNumber: json["phone_number"],
    emailVerifiedAt: json["email_verified_at"],
    lastActiveAt: json["last_active_at"],
    isHidden: json["is_hidden"],
    image: json["image"],
    courses: json["courses"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "full_name": fullName,
    "username": username,
    "description": description,
    "email": email,
    "phone_number": phoneNumber,
    "email_verified_at": emailVerifiedAt,
    "last_active_at": lastActiveAt,
    "is_hidden": isHidden,
    "image": image,
    "courses": courses,
  };
}