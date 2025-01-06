import 'package:blood_donation_mobile/component/widget_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? color;
  final VoidCallback? onpressed;
  const CustomButton({
    super.key,
    required this.text,
    this.color,
    this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onpressed ?? () {},
        style: ElevatedButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          backgroundColor: color ?? Theme.of(context).colorScheme.primary,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: BigText(
          text: text,
          color: Theme.of(context).colorScheme.onPrimary,
          size: 20,
        ));
  }
}
