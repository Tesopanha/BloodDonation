import 'dart:math';

import 'package:blood_donation_mobile/component/appbar_widget.dart';
import 'package:blood_donation_mobile/component/widget_cart.dart';
import 'package:blood_donation_mobile/component/widget_colors.dart';
import 'package:blood_donation_mobile/component/widget_text.dart';
import 'package:blood_donation_mobile/localization/locales.dart';
import 'package:blood_donation_mobile/pages/dashboard/controller/navigate_controller.dart';
import 'package:blood_donation_mobile/pages/home/controller/home_controller.dart';
import 'package:blood_donation_mobile/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(HomeController());
  final _controllerNav = Get.put(NavigateController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBarWidget(
        text: LocaleData.home.getString(context),
        showBackButton: false,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.fetchBloodDonated();
          await controller.fetchRequestBlood();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            padding: const EdgeInsets.only(top: 16),
            children: [
              Obx(
                () => SizedBox(
                  child: fadeInImage(context, controller.opacity.value),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              featureButton(height, width),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(
                    text: LocaleData.request.getString(context),
                  ),
                  InkWell(
                    onTap: () => Get.toNamed(AppRoute.request),
                    child: const CircleAvatar(
                      maxRadius: 20,
                      backgroundColor: AppColors.lightblue,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.white,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: min(controller.requestBloodList.length, 3),
                    separatorBuilder: (context, _) => const SizedBox(
                          height: 10,
                        ),
                    itemBuilder: (context, index) {
                      final detail = controller.requestBloodList[index];
                      final fullname =
                          '${detail.createdBy.firstName} ${detail.createdBy.lastName}';
                      return CardRequest(
                          ontapAccept: () {
                            print(
                                "idddd===${controller.requestBloodList[index].id}");
                          },
                          ontapCancel: () {},
                          name: fullname,
                          bloodType: detail.bloodType,
                          location: detail.location.address,
                          time: detail.createdAt.toString());
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(
                    text: LocaleData.donation.getString(context),
                  ),
                  InkWell(
                    onTap: () => Get.toNamed(AppRoute.donation),
                    child: const CircleAvatar(
                      maxRadius: 20,
                      backgroundColor: AppColors.lightblue,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.white,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: min(controller.bloodDonatdList.length, 3),
                    separatorBuilder: (context, _) => const SizedBox(
                          height: 10,
                        ),
                    itemBuilder: (context, index) {
                      final detail = controller.bloodDonatdList[index];
                      final fullname =
                          '${detail.createdBy.firstName} ${detail.createdBy.lastName}';
                      return CardRequest(
                          ontapAccept: () {
                            print('idd===${detail.id}');
                          },
                          ontapCancel: () {},
                          isSelected: false,
                          name: fullname,
                          bloodType: detail.bloodType,
                          location: detail.location.address,
                          time: detail.createdAt.toString());
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget featureButton(final height, final width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            _controllerNav.changeScreenIndex(1);
          },
          child: Card(
            elevation: 4,
            child: SizedBox(
              width: width / 3.6,
              height: 110,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'asset/icons/Search.png',
                    color: AppColors.blue,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SmallText(
                    text: LocaleData.donor.getString(context),
                    size: 15,
                  )
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () => Get.toNamed(
            AppRoute.requestForm,
          ),
          child: Card(
            elevation: 4,
            child: SizedBox(
              width: width / 3.6,
              height: 110,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'asset/icons/donation.png',
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SmallText(
                    text: LocaleData.formrequest.getString(context),
                    size: 15,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () => _controllerNav.changeScreenIndex(2),
          child: Card(
            elevation: 4,
            child: SizedBox(
              width: width / 3.6,
              height: 110,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'asset/icons/clipboard.png',
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SmallText(
                    text: LocaleData.report.getString(context),
                    size: 15,
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget fadeInImage(BuildContext context, double opacity,
      {Duration duration = const Duration(milliseconds: 500)}) {
    var image = controller.imageFadeIn[controller.currentIndex.value];

    return AnimatedOpacity(
        duration: duration,
        opacity: opacity,
        child: Image.asset(
          image,
          fit: BoxFit.fill,
        ));
  }
}
