class UserModel {
  Data? data;
  String? message;

  UserModel({this.data, this.message});

  UserModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }
}
class LogInModel {
  final String userName;
  final String password;
  final String? fcmToken;
  LogInModel({
    required this.userName,
    required this.password,
    this.fcmToken
  });
}
class Data {
  User? user;
  Data({this.user});
  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
}

class User {
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? token;
  String? image;

  User(
      {this.username,
        this.email,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.updatedAt,
        this.createdAt,
        this.id,
        this.token,
        this.image});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phoneNumber = json['phone_number'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    token = json['token'];
    image = json['image'];
  }
}
