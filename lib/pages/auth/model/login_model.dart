import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String message;
  User user;
  String accessToken;

  LoginModel({
    required this.message,
    required this.user,
    required this.accessToken,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        message: json["message"],
        user: User.fromJson(json["user"]),
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "user": user.toJson(),
        "access_token": accessToken,
      };
}

class User {
  String firstName;
  String lastName;
  String phone;
  bool isActive;

  User({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.isActive,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "is_active": isActive,
      };
}
