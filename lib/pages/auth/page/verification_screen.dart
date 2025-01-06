import 'dart:math';

import 'package:blood_donation_mobile/component/appbar_widget.dart';
import 'package:blood_donation_mobile/component/custom_button.dart';

import 'package:blood_donation_mobile/component/widget_colors.dart';
import 'package:blood_donation_mobile/component/widget_text.dart';
import 'package:blood_donation_mobile/pages/auth/controller/authentication_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen>
    with SingleTickerProviderStateMixin {
  final List<TextEditingController> _otpControllers =
      List.generate(6, (index) => TextEditingController());
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  final _controllerApi = Get.put(AuthenticationController());
  final Map<String, dynamic> verify = Get.arguments;
  @override
  void initState() {
    super.initState();

    // Initialize AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Full animation duration
    )..repeat(reverse: true);

    // Define scale animation
    _scaleAnimation = Tween<double>(begin: 1.4, end: 1.7).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Define rotation animation
    _rotationAnimation = Tween<double>(begin: -pi / 10, end: pi / 4).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    if (verify['otp'] != null) {
      String otp = verify['otp'].toString();
      for (int i = 0; i < otp.length; i++) {
        _otpControllers[i].text = otp[i];
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        text: "OTP Verification",
        onNotificationPressed: () => Get.back(),
        showNotification: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                // Animated background image
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..scale(_scaleAnimation.value)
                          ..rotateZ(_rotationAnimation.value),
                        child: child,
                      );
                    },
                    child: Image.asset(
                      'asset/image/anima.png', // Replace with your blue background image path
                      width: 320,
                      height: 340,
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 20,
                  child: Image.asset(
                    'asset/image/otp.gif', // Replace with your phone image path
                    width: 275,
                    height: 275,
                  ),
                ),
                // Foreground content
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                const SmallText(
                  text: "We will send you one time OTP to this \nnumber",
                  size: 18,
                ),
                const SizedBox(height: 8),
                SmallText(
                  text: verify['phoneNumber'],
                  size: 18,
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(6, (index) {
                    return SizedBox(
                      width: 60,
                      child: TextField(
                        controller: _otpControllers[index],
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "",
                          hintStyle: TextStyle(color: AppColors.grey),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    text: "verify",
                    color: AppColors.lightblue,
                    onpressed: () async {
                      //+85577219592 12345
                      await _controllerApi.verifyOTP(
                          verify['phoneNumber'], verify['otp'].toString());
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
