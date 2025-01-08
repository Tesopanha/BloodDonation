import 'package:blood_donation_mobile/component/appbar_widget.dart';
import 'package:blood_donation_mobile/component/custom_button.dart';
import 'package:blood_donation_mobile/component/widget_colors.dart';
import 'package:blood_donation_mobile/component/widget_text.dart';
import 'package:blood_donation_mobile/pages/auth/controller/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  final AuthenticationController controller =
      Get.find<AuthenticationController>();
  final List<TextEditingController> _otpControllers =
      List.generate(6, (index) => TextEditingController());

  final Map<String, dynamic> verify = Get.arguments;
  String? phone = '';
  String? new_password = '';
  String? confirm_password = '';
  String? otp;
  @override
  void initState() {
    super.initState();

    if (verify['otp'] != null) {
      otp = verify['otp'].toString();
      for (int i = 0; i < otp!.length; i++) {
        _otpControllers[i].text = otp![i];
      }
      phone = verify['phone'].toString();
      new_password = verify['new_password'].toString();
      confirm_password = verify['confirm_password'].toString();
    }
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
                SmallText(
                    text: "Enter the OTP sent to this phonenumber $phone"),
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
                onpressed: () async {
                  await controller.resetPassword(
                      phone: phone!,
                      otp: otp!,
                      new_password: new_password!,
                      confirm_password: confirm_password!);
                },
              ),
            )
          ],
        )),
      ),
    );
  }
}
