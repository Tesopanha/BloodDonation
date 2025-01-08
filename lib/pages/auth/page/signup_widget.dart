import 'package:blood_donation_mobile/localization/locales.dart';
import 'package:blood_donation_mobile/pages/auth/controller/authentication_controller.dart';
import 'package:blood_donation_mobile/component/custom_button.dart';

import 'package:blood_donation_mobile/component/widget_colors.dart';
import 'package:blood_donation_mobile/component/widget_text.dart';
import 'package:blood_donation_mobile/pages/auth/controller/page_controller.dart';
import 'package:blood_donation_mobile/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupWidget extends StatefulWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController phonenumberController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const SignupWidget({
    required this.firstNameController,
    required this.lastNameController,
    required this.phonenumberController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  final GlobalKey<FormState> _signupFormKey = GlobalKey<FormState>();
  final AuthenticationController controller =
      Get.find<AuthenticationController>();
  final LoginSignupController loginSignupController =
      Get.put(LoginSignupController());
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: _signupFormKey,
            child: ListView(
              children: [
                _customForm(LocaleData.firstName.getString(context),
                    controller: widget.firstNameController),
                const SizedBox(height: 16),
                _customForm(LocaleData.lastName.getString(context),
                    controller: widget.lastNameController),
                const SizedBox(height: 16),
                _customForm(LocaleData.phone.getString(context),
                    phone: true, controller: widget.phonenumberController),
                const SizedBox(height: 16),
                _customForm(LocaleData.password.getString(context),
                    controller: widget.passwordController,
                    isPassword: true,
                    isVisible: isPasswordVisible,
                    onVisibleToggle: _togglePasswordVisibility),
                const SizedBox(height: 16),
                _customForm(LocaleData.confirmPassword.getString(context),
                    controller: widget.confirmPasswordController,
                    isPassword: true,
                    isVisible: isConfirmPasswordVisible,
                    onVisibleToggle: _toggleConfirmPasswordVisibility),

                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    text: LocaleData.signup.getString(context),
                    onpressed: () async {
                      if (_signupFormKey.currentState?.validate() ?? false) {
                        String firstName = widget.firstNameController.text;
                        String lastName = widget.lastNameController.text;
                        String phoneNumber = widget.phonenumberController.text;
                        String password = widget.passwordController.text;
                        String confirmPassword =
                            widget.confirmPasswordController.text;
                        try {
                          await controller.register(
                            firstName: firstName,
                            lastName: lastName,
                            phonenumber: phoneNumber,
                            password: password,
                            confirmpassword: confirmPassword,
                          );
                          if (controller.registerModel.value != null) {
                            Get.toNamed(AppRoute.verification, arguments: {
                              'phoneNumber': phoneNumber,
                              'otp': controller.registerModel.value?.otp
                            });
                          } else {
                            print("Registration failed: Unknown error");
                          }
                        } catch (e) {
                          Get.snackbar("Error", "Registration failed: $e",
                              snackPosition: SnackPosition.BOTTOM);
                        }
                      }
                    },
                  ),
                ),
                const SizedBox(height: 24),
                // Login Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallText(
                      text: LocaleData.have.getString(context),
                      size: 16,
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    ),
                    GestureDetector(
                      onTap: () {
                        loginSignupController.changePage(0);
                      },
                      child: SmallText(
                        text: LocaleData.login.getString(context),
                        size: 16,
                        color: AppColors.blue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
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
          contentPadding: const EdgeInsets.all(14),
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
