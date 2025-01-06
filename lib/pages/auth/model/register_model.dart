import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  String message;
  String phone;
  int otpExpiresInSeconds;
  int otp;
  UserData userData;

  RegisterModel({
    required this.message,
    required this.phone,
    required this.otpExpiresInSeconds,
    required this.otp,
    required this.userData,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        message: json["message"],
        phone: json["phone"],
        otpExpiresInSeconds: json["otp_expires_in_seconds"],
        otp: json["otp"],
        userData: UserData.fromJson(json["user_data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "phone": phone,
        "otp_expires_in_seconds": otpExpiresInSeconds,
        "otp": otp,
        "user_data": userData.toJson(),
      };
}

class UserData {
  String firstName;
  String lastName;
  bool active;

  UserData({
    required this.firstName,
    required this.lastName,
    required this.active,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        firstName: json["first_name"],
        lastName: json["last_name"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "active": active,
      };
}
