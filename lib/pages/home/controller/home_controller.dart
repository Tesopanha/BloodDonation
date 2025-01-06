import 'dart:async';

import 'package:blood_donation_mobile/pages/auth/controller/authentication_controller.dart';
import 'package:blood_donation_mobile/pages/auth/model/login_model.dart';
import 'package:blood_donation_mobile/pages/model/blood_donation_model.dart';
import 'package:blood_donation_mobile/pages/model/history_model.dart';

import 'package:blood_donation_mobile/pages/model/request_blood_model.dart';
import 'package:blood_donation_mobile/repository/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;
  var opacity = 1.0.obs;
  Timer? timer;
  var requestBloodList = <RequestBloodModel>[].obs;
  var bloodDonatdList = <BloodDonationModel>[].obs;
  var listHistroy = <HistoryModel>[].obs;

  final _apiService = ApiService(dio: Dio());
  final authenticaionController = Get.find<AuthenticationController>();
  var loginModel = Rxn<LoginModel>();
  var token = ''.obs;

  var acceptedStatus = '';

  List<String> imageFadeIn = [
    'asset/image/slide-1.png',
    'asset/image/slide-2.png',
    'asset/image/slide-3.png'
  ].obs;

  @override
  void onInit() {
    super.onInit();
    initializeAutoSlide();
    loadToken().then((_) {
      if (_isTokenValid()) {
        fetchRequestBlood();
        fetchBloodDonated();
        getHistroy();
      }
    });

    loginModel.value = authenticaionController.loginModel.value;
  }

  Future<void> loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token.value = prefs.getString(AuthenticationController.TOKEN_KEY) ?? '';
  }

  bool _isTokenValid() {
    return token.value.isNotEmpty;
  }

  Future<void> fetchRequestBlood() async {
    if (!_isTokenValid()) {
      print("No token found. Please login again.");
      return;
    }
    try {
      final result = await _apiService.fetchRequestBlood(token: token.value);
      if (result.isNotEmpty) {
        requestBloodList.assignAll(result);
      } else {
        print("No data received for request blood.");
      }
    } catch (e) {
      print("Error fetching request blood: $e");
    }
  }

  Future<void> fetchBloodDonated() async {
    if (!_isTokenValid()) {
      print("No token found. Please login again.");
      return;
    }
    try {
      final result = await _apiService.fetchBloodDonted(token: token.value);
      if (result.isNotEmpty) {
        bloodDonatdList.assignAll(result);
      } else {
        print("No data received for blood donation.");
      }
    } catch (e) {
      print("Error fetching blood donation: $e");
    }
  }

  Future<void> acceptStatus({required int id}) async {
    if (!_isTokenValid()) {
      print("No token available to accept the request.");
      return;
    }
    try {
      await _apiService.accecpted(id: id, token: token.value);
      print("Request accepted successfully.");
    } catch (e) {
      print("Error accepting request: $e");
    }
  }

  Future<void> getHistroy() async {
    if (!_isTokenValid()) {
      print("No token available to accept the request.");
      return;
    }
    try {
      final result = await _apiService.fetchHistory(token: token.value);
      if (result.isNotEmpty) {
        listHistroy(result);
      } else {
        print("No data in history");
      }
    } catch (e) {
      print("Error accepting request: $e");
    }
  }

  void startAutoSlide() {
    opacity.value = 0.0; // Start fade-out
    Future.delayed(const Duration(milliseconds: 500), () {
      currentIndex.value = (currentIndex.value + 1) % imageFadeIn.length;
      opacity.value = 1.0; // Start fade-in
    });
  }

  void initializeAutoSlide() {
    timer = Timer.periodic(const Duration(seconds: 4), (_) {
      startAutoSlide();
    });
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
