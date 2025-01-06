// To parse this JSON data, do
//
//     final bloodDonationModel = bloodDonationModelFromJson(jsonString);

import 'dart:convert';

DonateModel bloodDonationModelFromJson(String str) =>
    DonateModel.fromJson(json.decode(str));

String bloodDonationModelToJson(DonateModel data) => json.encode(data.toJson());

class DonateModel {
  int id;
  String bloodType;
  Location location;
  String phoneNumber;
  String status;
  String note;
  CreatedBy createdBy;
  String requestType;

  DonateModel({
    required this.id,
    required this.bloodType,
    required this.location,
    required this.phoneNumber,
    required this.status,
    required this.note,
    required this.createdBy,
    required this.requestType,
  });

  factory DonateModel.fromJson(Map<String, dynamic> json) => DonateModel(
        id: json["id"],
        bloodType: json["blood_type"],
        location: Location.fromJson(json["location"]),
        phoneNumber: json["phone_number"],
        status: json["status"],
        note: json["note"],
        createdBy: CreatedBy.fromJson(json["created_by"]),
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
