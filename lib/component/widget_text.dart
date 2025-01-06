import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BigText extends StatelessWidget {
  final String text;
  final double size;
  final Color? color;
  final FontWeight fontWeight;

  const BigText({
    super.key,
    required this.text,
    this.size = 22,
    this.color,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          fontSize: size,
          color: color ?? Theme.of(context).textTheme.titleLarge?.color,
          fontWeight: fontWeight,
        ).merge(GoogleFonts.notoSansKhmer()));
  }
}

class SmallText extends StatelessWidget {
  final String text;
  final double size;
  final Color? color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextOverflow textOverflow;
  const SmallText(
      {super.key,
      required this.text,
      this.size = 14,
      this.color,
      this.fontWeight = FontWeight.normal,
      this.textOverflow = TextOverflow.clip,
      this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
              fontSize: size,
              color: color ?? Theme.of(context).textTheme.titleLarge?.color,
              fontWeight: fontWeight)
          .merge(GoogleFonts.notoSansKhmer()),
      overflow: textOverflow,
      textAlign: textAlign,
    );
  }
}
