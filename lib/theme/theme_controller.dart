import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  static const String THEME_KEY = 'isDarkMode';

  var isDarkMode = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadTheme();
  }

  void toggleTheme() async {
    isDarkMode.value = !isDarkMode.value;
    saveTheme(isDarkMode.value);
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    isDarkMode.value = prefs.getBool('isDarkMode') ?? false;
  }

  Future<void> saveTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', isDark);
  }
}
