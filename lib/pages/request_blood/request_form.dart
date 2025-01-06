// ignore_for_file: must_be_immutable

import 'package:blood_donation_mobile/component/appbar_widget.dart';
import 'package:blood_donation_mobile/component/custom_button.dart';

import 'package:blood_donation_mobile/component/custom_text_form.dart';
import 'package:blood_donation_mobile/component/widget_colors.dart';
import 'package:blood_donation_mobile/component/widget_text.dart';
import 'package:blood_donation_mobile/localization/locales.dart';
import 'package:blood_donation_mobile/pages/request_blood/controller/request_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';

class RequestForm extends StatelessWidget {
  RequestForm({super.key});
  final GlobalKey<FormState> _requestFormKey = GlobalKey<FormState>();
  final bloodTypeController = TextEditingController();
  final locationController = TextEditingController();
  final phonenumberController = TextEditingController();
  final noteController = TextEditingController();

  String? selectedRequestType = 'request';

  @override
  Widget build(BuildContext context) {
    final RequestController controller = Get.put(RequestController());
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBarWidget(
          text: LocaleData.formrequest.getString(context),
          onNotificationPressed: () {
            Get.back();
          },
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _requestFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CustomTextFormField(
                        controller: bloodTypeController,
                        icon: Icons.bloodtype,
                        label: LocaleData.bloodType.getString(context)),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextFormField(
                        controller: locationController,
                        icon: Icons.location_on,
                        label: LocaleData.location.getString(context)),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextFormField(
                        controller: phonenumberController,
                        icon: Icons.phone,
                        label: LocaleData.phone.getString(context)),
                    const SizedBox(
                      height: 30,
                    ),
                    // CustomTextFormField(
                    //     controller: requestTypeContoller,
                    //     icon: Icons.send,
                    //     label: LocaleData.requestType.getString(context)),
                    _drownDown(context),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextFormField(
                        controller: noteController,
                        icon: Icons.note_outlined,
                        label: LocaleData.note.getString(context)),
                  ],
                ),
                SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      text: LocaleData.request.getString(context),
                      onpressed: () async {
                        final bloodType = bloodTypeController.text;
                        final location = locationController.text;
                        final phonenumber = phonenumberController.text;
                        final request = selectedRequestType ?? '';
                        final note = noteController.text;
                        await controller.request(
                            bloodtype: bloodType,
                            location: location,
                            phonenumber: phonenumber,
                            request: request,
                            note: note);
                      },
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _drownDown(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedRequestType,
      onChanged: (String? newValue) {
        selectedRequestType = newValue;
      },
      items: <String>['request', 'donation']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: SmallText(
            text: value,
            size: 16,
          ),
        );
      }).toList(),
      decoration: InputDecoration(
        hintText: LocaleData.requestType.getString(context),
        prefixIcon: const Icon(
          Icons.send,
          color: Colors.grey,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey),
        ),
      ),
    );
  }
}
