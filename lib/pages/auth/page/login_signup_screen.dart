import 'package:blood_donation_mobile/component/widget_colors.dart';
import 'package:blood_donation_mobile/component/widget_text.dart';
import 'package:blood_donation_mobile/localization/locales.dart';
import 'package:blood_donation_mobile/pages/auth/controller/page_controller.dart';
import 'package:blood_donation_mobile/pages/auth/page/login_widget.dart';
import 'package:blood_donation_mobile/pages/auth/page/signup_widget.dart';
import 'package:blood_donation_mobile/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  final LoginSignupController controller = Get.put(LoginSignupController());
  final RxInt selectedPage = 0.obs;

  // TextEditingControllers for Login
  final TextEditingController loginPhoneController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  // TextEditingControllers for Signup
  final TextEditingController signupFirstNameController =
      TextEditingController();
  final TextEditingController signupLastNameController =
      TextEditingController();
  final TextEditingController signupPhoneController = TextEditingController();
  final TextEditingController signupPasswordController =
      TextEditingController();
  final TextEditingController signupConfirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    // Dispose controllers to free resources
    loginPhoneController.dispose();
    loginPasswordController.dispose();
    signupFirstNameController.dispose();
    signupLastNameController.dispose();
    signupPhoneController.dispose();
    signupPasswordController.dispose();
    signupConfirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: Column(
              children: [
                Obx(
                  () => SizedBox(
                      height: 160,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.toNamed(AppRoute.lan);
                              },
                              icon: const Icon(
                                Icons.language,
                                color: AppColors.white,
                                size: 32,
                              )),
                          SizedBox(
                            width: width - 380,
                          ),
                          header(
                            isSelected: controller.selectedPage.value == 0,
                          ),
                        ],
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                      //height: height,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30)),
                          color: Theme.of(context).cardColor),
                      child: Column(
                        children: [
                          Obx(
                            () => Container(
                              height: 55,
                              margin: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .dividerColor
                                    .withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  selectedAction(
                                    title: LocaleData.login.getString(context),
                                    isSelected:
                                        controller.selectedPage.value == 0,
                                    width: width,
                                    onTap: () {
                                      controller.changePage(0);
                                    },
                                  ),
                                  selectedAction(
                                      title:
                                          LocaleData.signup.getString(context),
                                      isSelected:
                                          controller.selectedPage.value == 1,
                                      width: width,
                                      onTap: () {
                                        controller.changePage(1);
                                      })
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: PageView(
                              controller: controller.pageController,
                              onPageChanged: (index) =>
                                  controller.selectedPage.value = index,
                              children: [
                                LoginWidget(
                                  phonenumberController: loginPhoneController,
                                  passwordController: loginPasswordController,
                                ),
                                SignupWidget(
                                  firstNameController:
                                      signupFirstNameController,
                                  lastNameController: signupLastNameController,
                                  phonenumberController: signupPhoneController,
                                  passwordController: signupPasswordController,
                                  confirmPasswordController:
                                      signupConfirmPasswordController,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          )),
    );
  }

  Widget header({required bool isSelected}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              isSelected
                  ? 'asset/icons/Light/login.png'
                  : 'asset/icons/Light/signup.png',
            ),
          ),
          const SizedBox(height: 24),
          BigText(
              text: LocaleData.welcome.getString(context),
              size: 24,
              color: AppColors.white),
          BigText(
              text: isSelected
                  ? LocaleData.loginTitle.getString(context)
                  : LocaleData.signupTitle.getString(context),
              size: 24,
              color: AppColors.white),
        ],
      ),
    );
  }

  Widget selectedAction({
    required String title,
    required bool isSelected,
    required double width,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: width / 2 - 25,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: BigText(
          text: title,
          size: 18,
          color: isSelected ? AppColors.darkBlue : AppColors.darkGrey,
        ),
      ),
    );
  }
}
