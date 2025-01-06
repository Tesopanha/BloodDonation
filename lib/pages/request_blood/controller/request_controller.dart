import 'package:blood_donation_mobile/component/widget_colors.dart';
import 'package:blood_donation_mobile/pages/auth/controller/authentication_controller.dart';
import 'package:blood_donation_mobile/pages/request_blood/Model/donate_model.dart';
import 'package:blood_donation_mobile/repository/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestController extends GetxController {
  final _apiService = ApiService(dio: Dio());

  final requestBlood = Rxn<DonateModel>();
  final donateBlood = Rxn<DonateModel>();

  final AuthenticationController authController =
      Get.find<AuthenticationController>();

  Future<void> request(
      {required String bloodtype,
      required String location,
      required String phonenumber,
      required String request,
      required String note}) async {
    try {
      bloodtype = _normalizeBloodType(bloodtype);
      phonenumber = _normalizePhoneNumber(phonenumber);
      final Map<String, dynamic> data = {
        "blood_type": bloodtype,
        "location": {
          "address": location,
        },
        "phone_number": phonenumber,
        "request_type": request,
        "note": note
      };

      if (request == "request") {
        final resultRequest = await _apiService.requestBlood(
            data: data, token: authController.token.value);
        if (resultRequest != null) {
          requestBlood.value = resultRequest;
          _showSnackbar("Success", "Request Blood have been sent successfully.",
              Colors.green);
        } else {
          _showSnackbar(
              "Error", "Failed to send request for blood.", AppColors.red);
        }
      } else if (request == "donation") {
        final resultDonate = await _apiService.donateBlood(
            data: data, token: authController.token.value);
        if (resultDonate != null) {
          requestBlood.value = resultDonate;
          _showSnackbar("Success", "Donation has been successfully registered.",
              Colors.green);
        } else {
          _showSnackbar(
              "Error", "Failed to to register blood donation.", AppColors.red);
        }
      } else {
        _showSnackbar("Error", "Invalid request type.", AppColors.red);
      }
    } catch (e) {
      print("error $e");
      _showSnackbar("Error", "$e", AppColors.red);
    }
  }

  String _normalizePhoneNumber(String phone) {
    if (!phone.startsWith('+855')) {
      if (phone.startsWith('0')) {
        phone = phone.replaceFirst('0', '+855');
      } else {
        phone = '+855$phone';
      }
    }
    return phone;
  }

  String _normalizeBloodType(String bloodtype) {
    List<String> validBloodTypes = [
      'A+',
      'A-',
      'B+',
      'B-',
      'AB+',
      'AB-',
      'O+',
      'O-'
    ];

    if (!validBloodTypes.contains(bloodtype)) {
      // Throw an error if the blood type is invalid
      _showSnackbar("Invalid", "Wrong Blood Type", AppColors.red);
    }

    return bloodtype;
  }

  void _showSnackbar(String title, String message, Color backgroundColor) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: backgroundColor,
      colorText: Colors.white,
    );
  }
}
