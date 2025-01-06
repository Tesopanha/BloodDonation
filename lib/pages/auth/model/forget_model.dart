import 'dart:convert';

ForgetModel forgetModelFromJson(String str) =>
    ForgetModel.fromJson(json.decode(str));

String forgetModelToJson(ForgetModel data) => json.encode(data.toJson());

class ForgetModel {
  String message;
  String phone;
  int otp;

  ForgetModel({
    required this.message,
    required this.phone,
    required this.otp,
  });

  factory ForgetModel.fromJson(Map<String, dynamic> json) => ForgetModel(
        message: json["message"],
        phone: json["phone"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "phone": phone,
        "otp": otp,
      };
}
