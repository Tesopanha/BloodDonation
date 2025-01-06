import 'dart:convert';

List<BloodDonationModel> bloodDonationModelFromJson(String str) =>
    List<BloodDonationModel>.from(
        json.decode(str).map((x) => BloodDonationModel.fromJson(x)));

String bloodDonationModelToJson(List<BloodDonationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BloodDonationModel {
  int id;
  String bloodType;
  Location location;
  String phoneNumber;
  String status;
  String note;
  CreatedBy createdBy;
  DateTime createdAt;
  String requestType;

  BloodDonationModel({
    required this.id,
    required this.bloodType,
    required this.location,
    required this.phoneNumber,
    required this.status,
    required this.note,
    required this.createdBy,
    required this.createdAt,
    required this.requestType,
  });

  factory BloodDonationModel.fromJson(Map<String, dynamic> json) =>
      BloodDonationModel(
        id: json["id"],
        bloodType: json["blood_type"],
        location: Location.fromJson(json["location"]),
        phoneNumber: json["phone_number"],
        status: json["status"],
        note: json["note"],
        createdBy: CreatedBy.fromJson(json["created_by"]),
        createdAt: DateTime.parse(json["created_at"]),
        requestType: json["request_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "blood_type": bloodType,
        "location": location.toJson(),
        "phone_number": phoneNumber,
        "status": status,
        "note": note,
        "created_by": createdBy.toJson(),
        "created_at": createdAt.toIso8601String(),
        "request_type": requestType,
      };
}

class CreatedBy {
  int id;
  String firstName;
  String lastName;
  dynamic avatar;

  CreatedBy({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}

class Location {
  String address;
  double? latitude;
  double? longitude;

  Location({
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        address: json["address"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
      };
}
