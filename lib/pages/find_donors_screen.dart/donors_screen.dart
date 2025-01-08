import 'package:blood_donation_mobile/component/appbar_widget.dart';
import 'package:blood_donation_mobile/component/widget_colors.dart';
import 'package:blood_donation_mobile/component/widget_text.dart';
import 'package:blood_donation_mobile/localization/locales.dart';
import 'package:blood_donation_mobile/pages/dashboard/controller/navigate_controller.dart';
import 'package:blood_donation_mobile/route/route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';

class FindDonorScreen extends StatefulWidget {
  const FindDonorScreen({super.key});

  @override
  State<FindDonorScreen> createState() => _FindDonorScreenState();
}

class _FindDonorScreenState extends State<FindDonorScreen> {
  final controller = Get.put(NavigateController());
  final List<Map<String, String>> details = [
    {
      'name': 'Nallarasi',
      'bloodType': "AB+",
      'location': "Phnom Penh Hospital",
      'phone': '012 123 123',
      'image': 'asset/image/Image.png'
    },
    {
      'name': 'Nallarasi',
      'bloodType': "A",
      'location': "Phnom Penh Hospital",
      'phone': '012 123 123',
      'image': 'asset/image/Image.png'
    },
    {
      'name': 'Nallarasi',
      'bloodType': "B",
      'location': "Phnom Penh Hospital",
      'phone': '012 123 123',
      'image': 'asset/image/Image.png'
    },
    {
      'name': 'Nallarasi',
      'bloodType': "A+",
      'location': "Phnom Penh Hospital",
      'phone': '012 123 123',
      'image': 'asset/image/Image.png'
    },
    {
      'name': 'Nallarasi',
      'bloodType': "B+",
      'location': "Phnom Penh Hospital",
      'phone': '012 123 123',
      'image': 'asset/image/Image.png'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBarWidget(
          text: LocaleData.donor.getString(context),
          showBackButton: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: LocaleData.name.getString(context),
                  hintStyle: TextStyle(
                      color: Theme.of(context).textTheme.titleLarge?.color),
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppColors.grey),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: details.length,
                  itemBuilder: (context, index) {
                    final detail = details[index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoute.donorDetail, arguments: detail);
                      },
                      child: Card(
                        elevation: 2,
                        child: Container(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          height: 95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset('asset/image/Image.png'),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SmallText(
                                    text: detail['name'] ?? 'Unknown',
                                    color: AppColors.darkGrey,
                                    size: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'asset/icons/map-hospital.png',
                                        width: 20,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      SmallText(
                                          text: detail['location'] ?? 'Unknown')
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  SmallText(
                                    text: detail['bloodType'] ?? '',
                                    size: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.darkGrey,
                                  ),
                                  Image.asset(
                                    'asset/icons/Blood.png',
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
