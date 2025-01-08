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
import 'package:google_fonts/google_fonts.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  final TextEditingController phoneController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> _forgetFormKey = GlobalKey<FormState>();

  final AuthenticationController controller =
      Get.find<AuthenticationController>();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

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
        child: Form(
          key: _forgetFormKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
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
                  height: 20,
                ),
                const SmallText(
                  text:
                      "Don't worry! It happens. Please enter the phonenumber \nwe will send the OTP in this phone\nnumber",
                  size: 18,
                ),
                const SizedBox(
                  height: 20,
                ),
                _customForm("phone number",
                    phone: true, controller: phoneController),
                const SizedBox(
                  height: 20,
                ),
                _customForm("New Password",
                    controller: passwordController,
                    isPassword: true,
                    isVisible: isConfirmPasswordVisible,
                    onVisibleToggle: _toggleConfirmPasswordVisibility),
                const SizedBox(
                  height: 20,
                ),
                _customForm("Confirm Password",
                    controller: confirmPasswordController,
                    isPassword: true,
                    isVisible: isConfirmPasswordVisible,
                    onVisibleToggle: _toggleConfirmPasswordVisibility),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      text: LocaleData.continues.getString(context),
                      onpressed: () async {
                        String phonenumber = phoneController.text;
                        String newPassword = passwordController.text;
                        String confirmPassword = confirmPasswordController.text;
                        if (_forgetFormKey.currentState?.validate() ?? false) {
                          await controller.forgetPassword(phonenumber);
                          Get.toNamed(AppRoute.otpverify, arguments: {
                            'otp': controller.forget.value!.otp,
                            'phone': phonenumber,
                            'new_password': newPassword,
                            'confirm_password': confirmPassword
                          });
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

  Widget _customForm(
    String text, {
    required TextEditingController controller,
    bool isPassword = false,
    bool isVisible = false,
    bool phone = false,
    VoidCallback? onVisibleToggle,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword && !isVisible,
      keyboardType: phone ? TextInputType.phone : TextInputType.text,
      decoration: InputDecoration(
          hintText: text,
          hintStyle: const TextStyle(color: AppColors.grey)
              .merge(GoogleFonts.notoSansKhmer()),
          contentPadding: const EdgeInsets.all(16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.grey),
          ),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    isVisible ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.lightGrey,
                  ),
                  onPressed: onVisibleToggle,
                )
              : null),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$text${LocaleData.required.getString(context)}';
        }
        return null;
      },
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      isConfirmPasswordVisible = !isConfirmPasswordVisible;
    });
  }
}
