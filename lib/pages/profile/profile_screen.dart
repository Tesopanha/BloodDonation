import 'package:blood_donation_mobile/component/appbar_widget.dart';

import 'package:blood_donation_mobile/component/widget_colors.dart';
import 'package:blood_donation_mobile/component/widget_text.dart';
import 'package:blood_donation_mobile/localization/locales.dart';
import 'package:blood_donation_mobile/pages/auth/controller/authentication_controller.dart';
import 'package:blood_donation_mobile/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<String> inforType = ['Blood Type', 'Donated', 'Request'];
  final List<String> inforDonor = ['O+', '03', '06'];

  final _controler = Get.find<AuthenticationController>();

  @override
  Widget build(BuildContext context) {
    final List<Map<dynamic, dynamic>> feature = [
      {'asset/icons/Availble.png': LocaleData.avaible.getString(context)},
      {'asset/icons/Invite.png': LocaleData.invite.getString(context)},
      {'asset/icons/edit.png': LocaleData.edit.getString(context)},
      {'asset/icons/Setting.png': LocaleData.setting.getString(context)},
      {'asset/icons/Signout.png': LocaleData.signout.getString(context)},
    ];
    return Scaffold(
      appBar: AppBarWidget(
        showBackButton: false,
        text: LocaleData.profile.getString(context),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            CircleAvatar(
              maxRadius: 50,
              backgroundColor: AppColors.lightGrey,
              child: Image.asset(
                'asset/icons/Vector.png',
                color: AppColors.grey,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            BigText(
              text:
                  "${_controler.profile.value?.lastName} ${_controler.profile.value?.firstName}",
              color: Theme.of(context).textTheme.bodyLarge?.color,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('asset/icons/call.png'),
                const SizedBox(width: 10),
                const SmallText(
                  text: "General Hospital, Phnom Penh",
                  size: 18,
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 100,
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, _) => const VerticalDivider(),
                  itemCount: inforDonor.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final detail = inforDonor[index];
                    final type = inforType[index];
                    return SizedBox(
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BigText(
                            text: detail,
                            fontWeight: FontWeight.bold,
                            size: 26,
                          ),
                          SmallText(
                            text: type,
                            size: 14,
                          )
                        ],
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 40,
            ),
            ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                separatorBuilder: (context, _) => const Divider(
                      height: 40,
                      color: AppColors.lightGrey,
                    ),
                itemCount: feature.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final detail = feature[index];
                  final key = detail.keys.first;

                  return GestureDetector(
                    onTap: () {
                      if (index == 2) {
                        Get.toNamed(AppRoute.editProfile);
                      }
                      if (index == 3) {
                        Get.toNamed(AppRoute.setting);
                      }
                      if (index == 4) {
                        // _controler.signout();
                        // Get.offAllNamed(AppRoute.authPage);
                        Get.defaultDialog(
                          title: 'Sign Out',
                          middleText: 'Are you sure you want to sign out?',
                          textConfirm: 'Yes',
                          textCancel: 'No',
                          confirmTextColor: Colors.white,
                          buttonColor: AppColors.darkBlue,
                          cancelTextColor: AppColors.darkBlue,
                          titleStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          onConfirm: () {
                            _controler.signout();
                            Get.offAllNamed(AppRoute.authPage);
                          },
                          onCancel: () {
                            Get.back();
                          },
                        );
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 25,
                              height: 25,
                              child: Image.asset(
                                key,
                                fit: BoxFit.fill,
                                color: index == 4
                                    ? AppColors.darkRed
                                    : AppColors.darkBlue,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SmallText(
                              text: detail[key],
                              size: 16,
                              color: index == 4
                                  ? AppColors.darkRed
                                  : AppColors.darkBlue,
                            ),
                          ],
                        ),
                        if (index == 0)
                          Switch(
                              activeColor: AppColors.darkBlue,
                              value: _controler.isActive,
                              onChanged: (value) {
                                setState(() {
                                  _controler.isActive = value;
                                });
                              }),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
