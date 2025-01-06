import 'package:blood_donation_mobile/component/appbar_widget.dart';
import 'package:blood_donation_mobile/component/custom_button.dart';

import 'package:blood_donation_mobile/component/custom_text_form.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonorDetail extends StatelessWidget {
  DonorDetail({super.key});
  final detail = Get.arguments as Map<String, dynamic>;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        text: "Donor Detail",
        onNotificationPressed: () {
          Get.back();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                CustomTextFormField(
                    icon: Icons.person, label: detail['name'] ?? 'Name'),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                    icon: Icons.location_on,
                    label: detail['location'] ?? "Location"),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                    icon: Icons.bloodtype,
                    label: detail['bloodType'] ?? "Blood Type"),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                    icon: Icons.phone, label: detail['phone'] ?? "Mobile"),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                    icon: Icons.note_outlined,
                    label: detail['note'] ?? "Add Note"),
              ],
            ),
            Image.asset('asset/image/drop_of_blood.png'),
            SizedBox(
                width: double.infinity,
                child: CustomButton(
                  text: "Request",
                  onpressed: () {},
                ))
          ],
        ),
      ),
    );
  }
}
