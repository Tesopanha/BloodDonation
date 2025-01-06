import 'package:blood_donation_mobile/component/appbar_widget.dart';
import 'package:blood_donation_mobile/component/widget_colors.dart';
import 'package:blood_donation_mobile/component/widget_text.dart';
import 'package:blood_donation_mobile/localization/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';

class ChangeLangaugeScreen extends StatefulWidget {
  const ChangeLangaugeScreen({super.key});

  @override
  State<ChangeLangaugeScreen> createState() => _ChangeLangaugeScreenState();
}

class _ChangeLangaugeScreenState extends State<ChangeLangaugeScreen> {
  late FlutterLocalization _flutterLocalization;
  late String _currentLocale;

  @override
  void initState() {
    super.initState();
    _flutterLocalization = FlutterLocalization.instance;
    _currentLocale = _flutterLocalization.currentLocale!.languageCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        text: LocaleData.language.getString(context),
        showBackButton: true,
        showNotification: false,
        onNotificationPressed: () {
          Get.back();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 65, 16, 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildLanguageOption(
                flag: 'asset/icons/Khmer.png',
                language: 'ភាសាខ្មែរ',
                value: 'kh',
              ),
              const SizedBox(
                height: 10,
              ),
              _buildLanguageOption(
                flag: 'asset/icons/English.png',
                language: 'English',
                value: 'en',
              ),
              const SizedBox(
                height: 10,
              ),
              _buildLanguageOption(
                flag: 'asset/icons/Chinese.png',
                language: 'Chinese',
                value: 'ch',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageOption({
    required String flag,
    required String language,
    required String value,
  }) {
    bool isSelected = _currentLocale == value;

    return Container(
      width: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: isSelected ? AppColors.blue : AppColors.grey,
          width: 1,
        ),
        color: isSelected ? AppColors.grey.withOpacity(0.1) : Colors.white,
      ),
      child: ListTile(
        onTap: () {
          setState(() {
            _currentLocale = value;
            _flutterLocalization.translate(_currentLocale);
          });
        },
        leading: Image.asset(
          flag,
          width: 30,
          height: 30,
        ),
        title: BigText(
          text: language,
          color: isSelected ? AppColors.blue : AppColors.grey,
          size: 16,
          fontWeight: FontWeight.w500,
        ),
        trailing: Radio<String>(
          value: value,
          groupValue: _currentLocale,
          activeColor: AppColors.darkBlue,
          onChanged: (value) => _setLocale(value),
        ),
      ),
    );
  }

  void _setLocale(String? value) {
    if (value == null) return;

    setState(() {
      _currentLocale = value;
      _flutterLocalization.translate(_currentLocale);
    });
  }
}
