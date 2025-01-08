import 'dart:ui';

import 'package:blood_donation_mobile/localization/locales.dart';
import 'package:blood_donation_mobile/pages/auth/controller/authentication_controller.dart';
import 'package:blood_donation_mobile/pages/dashboard/binding/binding.dart';
import 'package:blood_donation_mobile/route/route.dart';
import 'package:blood_donation_mobile/theme/theme.dart';
import 'package:blood_donation_mobile/theme/theme_controller.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:blood_donation_mobile/component/pop_scope.dart'
    as custom; // Import the PopScope widget

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AuthenticationController());
  Get.put(ThemeController());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final FlutterLocalization localization = FlutterLocalization.instance;
  final ThemeController themeController = Get.find();

  @override
  void initState() {
    super.initState();
    configureLocalization();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // App is in the background
    } else if (state == AppLifecycleState.resumed) {
      // App is in the foreground
    }
  }

  Future<bool> _onWillPop() async {
    // Handle the back button press
    return false; // Prevent the app from closing
  }

  @override
  Widget build(BuildContext context) {
    return custom.PopScope(
      canPop: _onWillPop,
      child: Obx(
        () => GetMaterialApp(
          title: 'Blood Donation',
          theme: themeController.isDarkMode.value ? darkMode : lightMode,
          debugShowCheckedModeBanner: false,
          supportedLocales: localization.supportedLocales,
          localizationsDelegates: localization.localizationsDelegates,
          scrollBehavior: CustomScrollBehavior(),
          initialRoute: AppRoute.splash,
          getPages: routes,
          initialBinding: Dashbinding(),
        ),
      ),
    );
  }

  void configureLocalization() {
    localization.init(mapLocales: LOCALES, initLanguageCode: "en");
    localization.onTranslatedLanguage = (Locale? locale) {
      setState(() {});
    };
  }
}

class CustomScrollBehavior extends ScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const ClampingScrollPhysics();
  }
}
