import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginSignupController extends GetxController {
  final PageController pageController = PageController();
  final RxInt selectedPage = 0.obs;

  void changePage(int index) {
    selectedPage.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
