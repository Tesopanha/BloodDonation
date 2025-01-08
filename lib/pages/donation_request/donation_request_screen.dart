import 'package:blood_donation_mobile/component/appbar_widget.dart';

import 'package:blood_donation_mobile/component/widget_cart.dart';
import 'package:blood_donation_mobile/localization/locales.dart';
import 'package:blood_donation_mobile/pages/home/controller/home_controller.dart';

import 'package:blood_donation_mobile/route/route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';

class DonationRequestScreen extends StatefulWidget {
  const DonationRequestScreen({super.key});

  @override
  State<DonationRequestScreen> createState() => _DonationRequestScreenState();
}

class _DonationRequestScreenState extends State<DonationRequestScreen> {
  final _controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        text: LocaleData.donation.getString(context),
        onNotificationPressed: () {
          Get.back();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.separated(
            padding: const EdgeInsets.only(top: 10),
            separatorBuilder: (context, _) => const SizedBox(
                  height: 10,
                ),
            itemCount: _controller.bloodDonatdList.length,
            itemBuilder: (context, index) {
              final detail = _controller.bloodDonatdList[index];

              return GestureDetector(
                onTap: () => Get.toNamed(AppRoute.detail,
                    arguments: {'type': 'donation', 'detail': detail}),
                child: CardRequest(
                    ontapAccept: () {},
                    ontapCancel: () {},
                    isSelected: false,
                    name: detail.createdBy.firstName,
                    bloodType: detail.bloodType,
                    location: detail.location.address,
                    time: detail.createdAt.toString()),
              );
            }),
      ),
    );
  }
}
