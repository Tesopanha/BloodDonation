class OtpModel {
  String message;
  String phone;
  UserData userData;
  String otpStatus;
// User successfully registered and activated!
  OtpModel({
    required this.message,
    required this.phone,
    required this.userData,
    required this.otpStatus,
  });

  factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
        message: json["message"],
        phone: json["phone"],
        userData: UserData.fromJson(json["user_data"]),
        otpStatus: json["otp_status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "phone": phone,
        "user_data": userData.toJson(),
        "otp_status": otpStatus,
      };
}

class UserData {
  String firstName;
  String lastName;
  String phone;
  bool active;

  UserData({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.active,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "active": active,
      };
}
