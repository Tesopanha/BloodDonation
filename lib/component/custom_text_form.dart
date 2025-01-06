import 'package:blood_donation_mobile/component/widget_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  final IconData? icon;
  final String label;
  final TextEditingController? controller;
  const CustomTextFormField({
    super.key,
    this.icon,
    required this.label,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: label,
          hintStyle: const TextStyle(color: AppColors.grey)
              .merge(GoogleFonts.notoSansKhmer()),
          prefixIcon: Icon(
            icon,
            color: AppColors.grey,
          ),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.lightGrey))),
    );
  }
}
