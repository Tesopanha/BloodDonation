import 'package:blood_donation_mobile/pages/auth/controller/authentication_controller.dart';
import 'package:blood_donation_mobile/pages/dashboard/controller/navigate_controller.dart';
import 'package:get/get.dart';

class Dashbinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavigateController());
    Get.put(AuthenticationController());
  }
}
