import 'package:blood_donation_mobile/pages/find_donors_screen.dart/donors_screen.dart';
import 'package:blood_donation_mobile/pages/home/home_screen.dart';
import 'package:blood_donation_mobile/pages/profile/profile_screen.dart';
import 'package:blood_donation_mobile/pages/report/report_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigateController extends GetxController {
  final selectedIndex = 0.obs;

  late PageController pageController;

  final List<Widget> screen = [
    const HomeScreen(),
    const FindDonorScreen(),
    const ReportScreen(),
    const ProfileScreen(),
  ];

  @override
  void onInit() {
    super.onInit();

    pageController = PageController(initialPage: selectedIndex.value);
  }

  void changeScreenIndex(int index) {
    selectedIndex.value = index;
    pageController.jumpToPage(index);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
