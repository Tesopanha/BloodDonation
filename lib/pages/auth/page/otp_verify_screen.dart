import 'dart:async';

import 'package:blood_donation_mobile/component/appbar_widget.dart';
import 'package:blood_donation_mobile/component/custom_button.dart';
import 'package:blood_donation_mobile/component/widget_colors.dart';
import 'package:blood_donation_mobile/component/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  late Timer _timer;
  int _remainingTime = 30;
  final List<TextEditingController> _otpControllers =
      List.generate(6, (index) => TextEditingController());

  final Map<String, dynamic> verify = Get.arguments;
  @override
  void initState() {
    super.initState();
    _startTimer();
    if (verify['otp'] != null) {
      String otp = verify['otp'].toString();
      for (int i = 0; i < otp.length; i++) {
        _otpControllers[i].text = otp[i];
      }
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        // Stop the timer when it reaches zero
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        text: "verfiy",
        onNotificationPressed: () => Get.back(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Center(
                  child: Image.asset('asset/icons/lock.png'),
                ),
                const SizedBox(
                  height: 20,
                ),
                const BigText(text: "OTP VERIFICATIO"),
                const SizedBox(
                  height: 20,
                ),
                const SmallText(text: "Enter the OTP sent to +855 012 123 456"),
                const SizedBox(
                  height: 20,
                ),
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
                const SizedBox(
                  height: 20,
                ),
                SmallText(
                  text: '$_remainingTime seconds',
                  size: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SmallText(
                      text: "Don't received code?",
                      size: 18,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const SmallText(
                          text: "Re-send",
                          fontWeight: FontWeight.bold,
                          size: 18,
                        ))
                  ],
                )
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: "Submit",
                onpressed: () {},
              ),
            )
          ],
        )),
      ),
    );
  }
}
