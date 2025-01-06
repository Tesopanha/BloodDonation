import 'package:blood_donation_mobile/localization/locales.dart';
import 'package:blood_donation_mobile/pages/dashboard/controller/navigate_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class DashBoard extends GetView<NavigateController> {
  const DashBoard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        children: controller.screen,
        onPageChanged: (index) {
          controller.selectedIndex.value = index;
        },
      ),
      bottomNavigationBar: Obx(
        () => GNav(
          tabMargin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          gap: 3,
          activeColor: Theme.of(context).colorScheme.primary,
          iconSize: 24,
          padding: const EdgeInsets.all(10),
          duration: const Duration(milliseconds: 400),
          tabBackgroundColor:
              Theme.of(context).colorScheme.primary.withOpacity(0.1),
          color: Theme.of(context).iconTheme.color,
          tabs: [
            GButton(
              icon: Icons.home,
              text: LocaleData.home.getString(context),
            ),
            GButton(
              icon: Icons.search,
              text: LocaleData.search.getString(context),
            ),
            GButton(
              icon: Icons.book_rounded,
              text: LocaleData.report.getString(context),
            ),
            GButton(
              icon: Icons.person,
              text: LocaleData.profile.getString(context),
            ),
          ],
          selectedIndex: controller.selectedIndex.value,
          onTabChange: (index) {
            controller.changeScreenIndex(index);
          },
        ),
      ),
    );
  }
}
