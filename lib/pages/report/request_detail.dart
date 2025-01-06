import 'package:blood_donation_mobile/component/appbar_widget.dart';
import 'package:blood_donation_mobile/component/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestDetail extends StatelessWidget {
  RequestDetail({super.key});
  final detail = Get.arguments as Map<String, String>;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        text: "Request Donation Detail",
        onNotificationPressed: () => Get.back(),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CustomTextFormField(
                        icon: Icons.person, label: detail['name'] ?? 'Unknown'),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextFormField(
                        icon: Icons.location_on,
                        label: detail['location'] ?? 'Unknown'),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextFormField(
                        icon: Icons.bloodtype,
                        label: detail['bloodType'] ?? 'Unknown'),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextFormField(
                        icon: Icons.phone, label: detail['phone'] ?? 'Unknown'),
                    const SizedBox(
                      height: 30,
                    ),
                    const CustomTextFormField(
                        icon: Icons.note_outlined, label: "Add Note"),
                  ],
                ),
              ])),
    );
  }
}
