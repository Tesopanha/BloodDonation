import 'package:blood_donation_mobile/component/appbar_widget.dart';
import 'package:blood_donation_mobile/component/widget_colors.dart';

import 'package:blood_donation_mobile/component/widget_text.dart';
import 'package:blood_donation_mobile/localization/locales.dart';
import 'package:blood_donation_mobile/route/route.dart';
import 'package:blood_donation_mobile/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    final List<Map<dynamic, dynamic>> feature = [
      {'asset/icons/dark-mode.png': LocaleData.dark.getString(context)},
      {
        'asset/icons/notification-light.png':
            LocaleData.notification.getString(context)
      },
      {'asset/icons/Language-1.png': LocaleData.language.getString(context)},
      {'asset/icons/Login.png': LocaleData.security.getString(context)},
      {'asset/icons/help.png': LocaleData.help.getString(context)},
    ];
    return Scaffold(
      appBar: AppBarWidget(
        text: LocaleData.setting.getString(context),
        showBackButton: true,
        showNotification: false,
        onNotificationPressed: () => Get.back(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                separatorBuilder: (context, _) => const Divider(
                      height: 30,
                      color: AppColors.lightGrey,
                    ),
                itemCount: feature.length,
                itemBuilder: (context, index) {
                  final detail = feature[index];
                  final key = detail.keys.first;

                  return GestureDetector(
                    onTap: () {
                      if (index == 1) {
                        Get.toNamed(AppRoute.notification);
                      }
                      if (index == 2) {
                        Get.toNamed(AppRoute.langauge);
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              key,
                              color: AppColors.darkBlue,
                              fit: BoxFit.fill,
                              width: 30,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SmallText(
                              text: detail[key],
                              size: 16,
                              color:
                                  Theme.of(context).textTheme.bodyLarge?.color,
                              fontWeight: FontWeight.w500,
                            )
                          ],
                        ),
                        if (index == 0)
                          Obx(() {
                            return Switch(
                              activeColor: AppColors.darkBlue,
                              value: themeController.isDarkMode.value,
                              onChanged: (value) {
                                themeController.toggleTheme();
                                print(
                                    "Colors:${Theme.of(context).textTheme.bodyLarge?.color}");
                              },
                            );
                          }),
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
