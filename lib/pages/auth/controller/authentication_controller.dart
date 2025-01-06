import 'dart:convert';

import 'package:blood_donation_mobile/component/widget_colors.dart';
import 'package:blood_donation_mobile/pages/auth/model/forget_model.dart';
import 'package:blood_donation_mobile/pages/auth/model/login_model.dart';
import 'package:blood_donation_mobile/pages/auth/model/otp_model.dart';
import 'package:blood_donation_mobile/pages/auth/model/register_model.dart';
import 'package:blood_donation_mobile/pages/dashboard/controller/navigate_controller.dart';
import 'package:blood_donation_mobile/pages/model/profile_model.dart';
import 'package:blood_donation_mobile/repository/api_service.dart';
import 'package:blood_donation_mobile/route/route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationController extends GetxController {
  RxBool isLoginSelected = true.obs;
  bool isActive = false;

  final ApiService _apiService = ApiService(dio: Dio());
  var loginModel = Rxn<LoginModel>();
  var profile = Rxn<ProfileModel>();
  var registerModel = Rxn<RegisterModel>();
  var otpModel = Rxn<OtpModel>();
  var forget = Rxn<ForgetModel>();

  var token = ''.obs;

  static const String TOKEN_KEY = 'auth_token';
  static const String PROFILE_KEY = 'profile_data';

  final NavigateController navigate = Get.put(NavigateController());

  @override
  void onInit() {
    super.onInit();
    loadToken();
    loadProfile();
  }

  Future<void> login(String phone, String password) async {
    phone = _normalizePhoneNumber(phone);
    try {
      final result = await _apiService.login(phone, password);
      if (result != null) {
        loginModel(result);
        saveToken(result.accessToken);
        await getProfile();
        _showSnackbar(
          "Login",
          "Login successfully",
          Colors.green,
        );
        Get.offAllNamed(AppRoute.dash);
      } else {
        _showSnackbar("Error", "Failed to login", AppColors.red);
      }
    } on DioException catch (e) {
      _handleDioError(e, "Invalid phonenumber or password");
    } catch (e) {
      print('Unexpected error: $e');
    }
  }

  Future<void> getProfile() async {
    try {
      final result =
          await _apiService.fetchProfile(token: loginModel.value!.accessToken);

      if (result != null) {
        profile(result);
        saveProfile(result);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> register(
      {required String firstName,
      required String lastName,
      required String phonenumber,
      required String password,
      required String confirmpassword}) async {
    //8821551234 123456789 772258112 12324567
    phonenumber = _normalizePhoneNumber(phonenumber);
    try {
      final result = await _apiService.register(
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phonenumber,
        password: password,
        confirmPassword: confirmpassword,
      );
      if (result != null) {
        registerModel.value = result;
      }
    } catch (e) {
      print("Error during registration: $e");
    }
  }

  Future<void> verifyOTP(String phonenumber, String otp) async {
    phonenumber = _normalizePhoneNumber(phonenumber);
    try {
      final result = await _apiService.verifyOTP(phonenumber, otp);
      if (result != null) {
        otpModel.value = result;
        _showSnackbar("Sign Up", "Successfully", Colors.green);
        await Future.delayed(const Duration(milliseconds: 500));
        Get.offAllNamed(AppRoute.dash);
      } else {
        _showSnackbar("Error", "Failed to Sign Up", AppColors.red);
      }
    } catch (e) {
      _showSnackbar("Verification Failed", "Please check the OTP or try again",
          AppColors.red);
      print("Error during registration: $e");
    }
  }

  Future<void> forgetPassword(String phonenumber) async {
    // Normalize the phone number to include the country code +855
    phonenumber = _normalizePhoneNumber(phonenumber);

    try {
      final result = await _apiService.forgetPassword(phonenumber);
      if (result != null) {
        forget(result);
      } else {
        print("Failed to send forget password request");
      }
    } catch (e) {
      print("Error during forget password request: $e");
    }
  }

  void signout() {
    loginModel.value = null;
    registerModel.value = null;
    otpModel.value = null;
    navigate.selectedIndex.value = 0;
    clearToken();
    clearProfile();
  }

  Future<void> loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token.value = prefs.getString(TOKEN_KEY) ?? '';
  }

  Future<void> saveToken(String newToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token.value = newToken;
    prefs.setString(TOKEN_KEY, newToken);
  }

  Future<void> clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token.value = '';
    prefs.remove(TOKEN_KEY);
  }

  Future<void> loadProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? profileData = prefs.getString(PROFILE_KEY);
    if (profileData != null) {
      Map<String, dynamic> profileMap = jsonDecode(profileData);
      profile(ProfileModel.fromJson(profileMap));
    }
  }

  Future<void> saveProfile(ProfileModel? profileData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (profileData != null) {
      String profileJson = jsonEncode(profileData.toJson());
      prefs.setString(PROFILE_KEY, profileJson);
    }
  }

  Future<void> clearProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    profile.value = null;
    prefs.remove(PROFILE_KEY);
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

  void _showSnackbar(String title, String message, Color backgroundColor) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: backgroundColor,
      colorText: Colors.white,
    );
  }

  void _handleDioError(DioException e, String defaultMessage) {
    if (e.response?.statusCode == 401) {
      _showSnackbar("Error", defaultMessage, Colors.red);
    } else {
      _showSnackbar("Error", "An unexpected error occurred.", Colors.red);
    }
    print('Error during Dio request: ${e.message}');
    print('DioError details: ${e.response?.data}');
  }
}
