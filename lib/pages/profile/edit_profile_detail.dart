import 'package:blood_donation_mobile/component/appbar_widget.dart';
import 'package:blood_donation_mobile/component/custom_button.dart';

import 'package:blood_donation_mobile/component/custom_text_form.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileDetail extends StatelessWidget {
  const EditProfileDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        text: "Edit Profile",
        showNotification: false,
        onNotificationPressed: () {
          Get.back();
        },
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                CustomTextFormField(icon: Icons.person, label: 'First Name'),
                SizedBox(
                  height: 30,
                ),
                CustomTextFormField(icon: Icons.person, label: "Last Name"),
                SizedBox(
                  height: 30,
                ),
                CustomTextFormField(icon: Icons.email_sharp, label: "Email"),
                SizedBox(
                  height: 30,
                ),
                CustomTextFormField(icon: Icons.phone, label: "Mobile Phone"),
                SizedBox(
                  height: 30,
                ),
                CustomTextFormField(icon: Icons.location_on, label: "Location"),
              ],
            ),
            SizedBox(
                width: double.infinity, child: CustomButton(text: "Update"))
          ],
        ),
      ),
    );
  }
}
