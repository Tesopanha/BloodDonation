import 'package:blood_donation_mobile/component/appbar_widget.dart';
import 'package:blood_donation_mobile/component/custom_button.dart';

import 'package:blood_donation_mobile/component/widget_colors.dart';
import 'package:blood_donation_mobile/component/widget_text.dart';
import 'package:blood_donation_mobile/localization/locales.dart';
import 'package:blood_donation_mobile/pages/auth/controller/authentication_controller.dart';
import 'package:blood_donation_mobile/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';

class ForgetScreen extends StatelessWidget {
  ForgetScreen({super.key});
  final TextEditingController forgetPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _forgetFormKey = GlobalKey<FormState>();
  final AuthenticationController controller =
      Get.find<AuthenticationController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        showBackButton: true,
        showNotification: false,
        text: LocaleData.forgot.getString(context),
        onNotificationPressed: () => Get.back(),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _forgetFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Center(
                      child: Image.asset("asset/icons/lock.png"),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    BigText(
                      text: LocaleData.forgot.getString(context),
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SmallText(
                      text:
                          "Don't worry! It happens. Please enter the phone\nnumber we will send the OTP in this phone\nnumber",
                      size: 18,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                        controller: forgetPasswordController,
                        decoration: InputDecoration(
                          hintText: "phonenumber",
                          hintStyle:
                              const TextStyle(color: AppColors.lightGrey),
                          contentPadding: const EdgeInsets.all(16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                const BorderSide(color: AppColors.lightGrey),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '$value is required';
                          }
                          return null;
                        }),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      text: LocaleData.continues.getString(context),
                      onpressed: () async {
                        String phonenumber = forgetPasswordController.text;
                        if (_forgetFormKey.currentState?.validate() ?? false) {
                          await controller.forgetPassword(phonenumber);
                          Get.toNamed(AppRoute.otpverify,
                              arguments: {'otp': controller.forget.value!.otp});
                        } else {
                          print("Form validation failed");
                        }
                      },
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
