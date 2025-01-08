import 'package:blood_donation_mobile/component/appbar_widget.dart';
import 'package:blood_donation_mobile/component/custom_button.dart';
import 'package:blood_donation_mobile/component/custom_text_form.dart';

import 'package:blood_donation_mobile/component/widget_colors.dart';
import 'package:blood_donation_mobile/pages/model/blood_donation_model.dart';
import 'package:blood_donation_mobile/pages/model/request_blood_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late final Map<String, dynamic> args;
  late dynamic detail;
  late String type;
  late final String primaryButtonText;
  late final String secondaryButtonText;
  late final bool backGround;

  @override
  void initState() {
    super.initState();

    // Initialize arguments
    args = Get.arguments as Map<String, dynamic>;
    type = args['type'];
    detail = args['detail'];

    // Validate and initialize fields
    if (type == 'request') {
      detail = args['detail'] as RequestBloodModel;
      primaryButtonText = 'Accept';
      secondaryButtonText = 'Cancel';
      backGround = true;
    } else if (type == 'donation') {
      detail = args['detail'] as BloodDonationModel;
      primaryButtonText = 'Donate';
      secondaryButtonText = 'Reject';
      backGround = false;
    } else {
      throw ArgumentError('Invalid argument: Unknown type "$type"');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        text: "Detail Screen",
        onNotificationPressed: () {
          Get.back();
        },
      ),
      body: Stack(
        children: [
          _background(context, backGround),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CustomTextFormField(
                        icon: Icons.person,
                        label:
                            '${detail.createdBy.firstName} ${detail.createdBy.lastName}'),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextFormField(
                        icon: Icons.location_on,
                        label: '${detail.location.address}'),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextFormField(
                        icon: Icons.bloodtype, label: '${detail.bloodType}'),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextFormField(
                        icon: Icons.phone, label: '${detail.phoneNumber}'),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextFormField(
                        icon: Icons.note_outlined, label: '${detail.note}'),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                            text: primaryButtonText, onpressed: () {})),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                          text: secondaryButtonText,
                          color: AppColors.red,
                        ))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _background(BuildContext context, bool background) {
    return background
        ? Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              'asset/image/drop_blood.png',
            ),
          )
        : Align(
            alignment: Alignment.centerRight,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: Image.asset(
                'asset/image/drop_blood.png',
              ),
            ),
          );
  }
}
