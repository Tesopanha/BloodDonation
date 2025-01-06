import 'package:blood_donation_mobile/component/custom_button.dart';
import 'package:blood_donation_mobile/component/widget_colors.dart';
import 'package:blood_donation_mobile/component/widget_text.dart';
import 'package:blood_donation_mobile/localization/locales.dart';
import 'package:blood_donation_mobile/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';

class SelectLangaugeScreen extends StatefulWidget {
  const SelectLangaugeScreen({super.key});

  @override
  State<SelectLangaugeScreen> createState() => _SelectLangaugeScreenState();
}

class _SelectLangaugeScreenState extends State<SelectLangaugeScreen> {
  late FlutterLocalization _flutterLocalization;
  late String _currentLocale = 'en';

  @override
  void initState() {
    super.initState();
    _flutterLocalization = FlutterLocalization.instance;
    _currentLocale = _flutterLocalization.currentLocale!.languageCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 65, 16, 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Column(
                children: [
                  Image.asset('asset/image/Language.png'),
                  const SizedBox(
                    height: 40,
                  ),
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
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: LocaleData.confirm.getString(context),
                onpressed: () {
                  _flutterLocalization.translate(_currentLocale);
                  Get.offAllNamed(AppRoute.authPage);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageOption({
    required String flag,
    required String language,
    required String value,
  }) {
    _currentLocale == value;

    return Container(
      width: 220,
      decoration: BoxDecoration(
        color: _currentLocale == value
            ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
            : Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: _currentLocale == value
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).dividerColor,
        ),
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
          color: Theme.of(context).textTheme.bodyMedium?.color,
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
