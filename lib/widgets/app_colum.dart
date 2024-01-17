import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:delivery_app/widgets/big_text.dart';
import 'package:delivery_app/widgets/icon_text.dart';
import 'package:delivery_app/widgets/small_text.dart';
import 'package:flutter/material.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Layout.font20,
        ),
        SizedBox(height: Layout.height10),
        Row(
          children: [
            // The stars for rating
            // The stars for rating
            Wrap(
              children: List.generate(
                5,
                (index) =>
                    const Icon(Icons.star, size: 15, color: Styles.mainColor),
              ),
            ),
            SizedBox(width: Layout.width10),
            SmallText(text: '4.5'),
            SizedBox(width: Layout.width10),
            SmallText(text: '1287 comments'),
          ],
        ),
        SizedBox(
          height: Layout.height20,
        ),

        // The section for restaurant statics (quality, location & delivery time)
        Padding(
          padding:
              EdgeInsets.only(right: Layout.width10, bottom: Layout.height10),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconAndText(
                icon: Icons.circle,
                text: 'Normal',
                color: Styles.signColor,
                iconColor: Styles.iconColor1,
              ),
              IconAndText(
                icon: Icons.location_on,
                text: '1.7 km',
                iconColor: Styles.mainColor,
                color: Styles.signColor,
              ),
              IconAndText(
                icon: Icons.timer,
                text: '32 min',
                iconColor: Styles.iconColor2,
                color: Styles.signColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
