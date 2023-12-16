import 'package:delivery_app/widgets/small_text.dart';
import 'package:flutter/material.dart';

class IconAndText extends StatelessWidget {
  final IconData? icon;
  final String text;
  final Color? iconColor;
  final Color? color;
  const IconAndText(
      {super.key, required this.text, this.icon, this.iconColor, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: iconColor,
        ),
        const SizedBox(
          width: 5.0,
        ),
        SmallText(
          text: text,
          color: color,
        )
      ],
    );
  }
}
