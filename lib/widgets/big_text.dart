import 'package:delivery_app/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;

  BigText({
    super.key,
    this.color = const Color(0xFF332d2b),
    required this.text,
    this.size = 0,
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: 1,
      text,
      overflow: overflow,
      style: GoogleFonts.roboto(
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: size == 0 ? Layout.font20 : size,
      ),
    );
  }
}
