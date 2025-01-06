import 'package:blood_donation_mobile/component/appbar_widget.dart';

import 'package:blood_donation_mobile/component/widget_colors.dart';
import 'package:blood_donation_mobile/component/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonorProfile extends StatelessWidget {
  DonorProfile({super.key});
  final List<String> inforType = ['Blood Type', 'Donated', 'Request'];
  final List<String> inforDonor = ['B+', '03', '06'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        text: "Profile",
        onNotificationPressed: () {
          Get.back();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              maxRadius: 60,
              backgroundColor: AppColors.lightGrey,
              child: Image.asset(
                'asset/icons/Vector.png',
                color: AppColors.grey,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const BigText(
              text: "Van Chackriya",
              color: Colors.black,
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
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 180,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.darkBlue,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('asset/icons/white_call.png'),
                          const SizedBox(
                            width: 10,
                          ),
                          const BigText(
                            text: "Call Now",
                            color: AppColors.white,
                            size: 20,
                          )
                        ],
                      )),
                ),
                SizedBox(
                  width: 180,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.red,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('asset/icons/profile_vectore.png'),
                          const SizedBox(
                            width: 10,
                          ),
                          const BigText(
                            text: "Request",
                            color: AppColors.white,
                            size: 20,
                          )
                        ],
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 100,
              child: ListView.separated(
                  separatorBuilder: (context, _) => const VerticalDivider(),
                  itemCount: inforDonor.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final detail = inforDonor[index];
                    final type = inforType[index];
                    return SizedBox(
                      width: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BigText(
                            text: detail,
                            fontWeight: FontWeight.bold,
                            size: 28,
                          ),
                          SmallText(
                            text: type,
                            size: 16,
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
