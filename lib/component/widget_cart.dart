import 'package:blood_donation_mobile/component/widget_colors.dart';
import 'package:blood_donation_mobile/component/widget_text.dart';
import 'package:blood_donation_mobile/localization/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:intl/intl.dart';

class CardRequest extends StatelessWidget {
  final String name;
  final String bloodType;
  final String location;
  final String time;
  final bool process;
  final bool isSelected;
  final VoidCallback? ontapAccept;
  final VoidCallback? ontapCancel;
  const CardRequest(
      {super.key,
      required this.name,
      required this.bloodType,
      required this.location,
      required this.time,
      this.ontapAccept,
      this.ontapCancel,
      this.process = false,
      this.isSelected = true});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'asset/icons/Light/Profile.png',
                      width: screenWidth * 0.06,
                      height: screenWidth * 0.06,
                      color: AppColors.darkGrey,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SmallText(
                      text: LocaleData.name.getString(context),
                      color: AppColors.grey,
                    ),
                  ],
                ),
                BigText(
                  text: bloodType,
                  size: 22,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(
                      text: name,
                      size: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'asset/icons/location.png',
                          color: AppColors.darkGrey,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SmallText(
                          text: LocaleData.location.getString(context),
                          textOverflow: TextOverflow.clip,
                          color: AppColors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
                Image.asset(
                  'asset/icons/Blood.png',
                  width: screenWidth * 0.11,
                  height: screenWidth * 0.11,
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            SmallText(
              text: location,
              size: 16,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                Image.asset(
                  'asset/icons/time.png',
                  width: screenWidth * 0.05,
                  height: screenWidth * 0.05,
                ),
                const SizedBox(
                  width: 6,
                ),
                SmallText(
                  text: LocaleData.time.getString(context),
                  color: AppColors.grey,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallText(
                    text: formatTime(time),
                    size: 16,
                    fontWeight: FontWeight.bold),
                const SizedBox(
                  width: 15,
                ),
                if (isSelected)
                  SmallText(
                    text: process
                        ? LocaleData.complete.getString(context)
                        : "Pending",
                    size: 16,
                    fontWeight: FontWeight.bold,
                    color: process ? Colors.green : Colors.yellow.shade800,
                  ),
                const SizedBox(
                  width: 20,
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: ontapCancel,
                      child: BigText(
                        text: isSelected
                            ? LocaleData.cancel.getString(context)
                            : LocaleData.reject.getString(context),
                        color: AppColors.darkRed,
                        size: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextButton(
                      onPressed: ontapAccept,
                      child: BigText(
                        text: isSelected
                            ? LocaleData.accept.getString(context)
                            : LocaleData.donate.getString(context),
                        color: AppColors.darkBlue,
                        size: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CardReport extends StatelessWidget {
  final String name;
  final String bloodType;
  final String location;
  final String time;
  final bool process;
  const CardReport(
      {super.key,
      required this.name,
      required this.bloodType,
      required this.location,
      required this.time,
      this.process = false});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'asset/icons/Light/Profile.png',
                      width: screenWidth * 0.06,
                      height: screenWidth * 0.06,
                      color: AppColors.darkGrey,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SmallText(
                      text: LocaleData.name.getString(context),
                      size: 16,
                      color: AppColors.grey,
                    ),
                  ],
                ),
                BigText(
                  text: bloodType,
                  size: 24,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(
                      text: name,
                      size: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'asset/icons/location.png',
                          color: AppColors.darkGrey,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SmallText(
                          text: LocaleData.location.getString(context),
                          textOverflow: TextOverflow.clip,
                          size: 16,
                          color: AppColors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
                Image.asset(
                  'asset/icons/Blood.png',
                  width: screenWidth * 0.12,
                  height: screenWidth * 0.12,
                )
              ],
            ),
            SmallText(
              text: location,
              size: 17,
              fontWeight: FontWeight.bold,
            ),
            Row(
              children: [
                Image.asset(
                  'asset/icons/time.png',
                ),
                const SizedBox(
                  width: 6,
                ),
                SmallText(
                  text: LocaleData.time.getString(context),
                  size: 16,
                  color: AppColors.grey,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallText(text: formatTime(time)),
                BigText(
                  text: process
                      ? LocaleData.complete.getString(context)
                      : LocaleData.cancel.getString(context),
                  color: process ? Colors.green : AppColors.darkRed,
                  size: 19,
                  fontWeight: FontWeight.normal,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

String formatTime(String timestamp) {
  DateTime dateTime = DateTime.parse(timestamp);
  return DateFormat.Hm().format(dateTime);
} // Outputs time in 24-hour format, like 14:22

