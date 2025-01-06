import 'package:blood_donation_mobile/pages/auth/page/forget_screen.dart';
import 'package:blood_donation_mobile/pages/auth/page/login_signup_screen.dart';
import 'package:blood_donation_mobile/pages/auth/page/otp_verify_screen.dart';
import 'package:blood_donation_mobile/pages/auth/page/verification_screen.dart';
import 'package:blood_donation_mobile/pages/dashboard/binding/binding.dart';
import 'package:blood_donation_mobile/pages/dashboard/dashboard_screen.dart';
import 'package:blood_donation_mobile/pages/donation_request/donation_request_screen.dart';
import 'package:blood_donation_mobile/pages/find_donors_screen.dart/donors_screen.dart';
import 'package:blood_donation_mobile/pages/home/detail_screen.dart';
import 'package:blood_donation_mobile/pages/home/home_screen.dart';
import 'package:blood_donation_mobile/pages/notifications/notificaton_screen.dart';
import 'package:blood_donation_mobile/pages/profile/change_langauge.dart';
import 'package:blood_donation_mobile/pages/profile/edit_profile_detail.dart';
import 'package:blood_donation_mobile/pages/profile/profile_screen.dart';
import 'package:blood_donation_mobile/pages/profile/setting_screen.dart';
import 'package:blood_donation_mobile/pages/report/report_screen.dart';
import 'package:blood_donation_mobile/pages/report/request_detail.dart';
import 'package:blood_donation_mobile/pages/find_donors_screen.dart/donor_detail.dart';
import 'package:blood_donation_mobile/pages/request_blood/request_blood_screen.dart';
import 'package:blood_donation_mobile/pages/request_blood/request_form.dart';
import 'package:blood_donation_mobile/pages/splash/select_langauge_screen.dart';
import 'package:blood_donation_mobile/pages/splash/splash_screen.dart';
import 'package:blood_donation_mobile/pages/splash/welcome_screen.dart';
import 'package:get/get.dart';

class AppRoute {
  static const String splash = '/splash';
  static const String lan = '/lan';
  static const String dash = '/';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String editProfile = '/editProfile';
  static const String findDonor = '/donor';
  static const String report = '/report';
  static const String request = '/request';
  static const String requestDetail = '/requestDetail';
  static const String donation = '/donation';
  static const String requestForm = '/requestForm';
  static const String detail = '/detail';
  static const String donorDetail = '/donorDetail';
  static const String donorProfile = '/donorProfile';
  static const String notification = '/notification';
  static const String authPage = '/authpage';
  static const String verification = '/verification';
  static const String welcome = '/welcome';
  static const String forget = '/forget';
  static const String otpverify = '/otpverify';
  static const String setting = '/setting';
  static const String langauge = '/langauge';
  static const String login = '/login';
}

final routes = [
  GetPage(name: AppRoute.splash, page: () => const SplashScreen()),
  GetPage(name: AppRoute.welcome, page: () => const WelcomeScreen()),
  GetPage(name: AppRoute.lan, page: () => const SelectLangaugeScreen()),
  GetPage(name: AppRoute.authPage, page: () => const LoginSignupScreen()),
  GetPage(name: AppRoute.verification, page: () => const VerificationScreen()),
  GetPage(name: AppRoute.forget, page: () => ForgetScreen()),
  GetPage(name: AppRoute.otpverify, page: () => const OtpVerifyScreen()),
  GetPage(
      name: AppRoute.dash,
      page: () => const DashBoard(),
      binding: Dashbinding()),
  GetPage(name: AppRoute.home, page: () => const HomeScreen()),
  GetPage(name: AppRoute.findDonor, page: () => const FindDonorScreen()),
  GetPage(name: AppRoute.profile, page: () => const ProfileScreen()),
  GetPage(name: AppRoute.editProfile, page: () => const EditProfileDetail()),
  GetPage(name: AppRoute.setting, page: () => const SettingScreen()),
  GetPage(name: AppRoute.request, page: () => const RequestBloodScreen()),
  GetPage(name: AppRoute.requestDetail, page: () => RequestDetail()),
  GetPage(name: AppRoute.donation, page: () => const DonationRequestScreen()),
  GetPage(name: AppRoute.report, page: () => const ReportScreen()),
  GetPage(name: AppRoute.requestForm, page: () => RequestForm()),
  GetPage(name: AppRoute.detail, page: () => const DetailScreen()),
  GetPage(name: AppRoute.donorDetail, page: () => DonorDetail()),
  GetPage(name: AppRoute.notification, page: () => const NotificatonScreen()),
  GetPage(name: AppRoute.langauge, page: () => const ChangeLangaugeScreen()),
];
