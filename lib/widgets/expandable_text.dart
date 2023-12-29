import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/widgets/small_text.dart';
import 'package:flutter/material.dart';
import '../utils/dimensions.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({
    super.key,
    required this.text,
  });

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firsHalf;
  late String lastHalf;

  bool isHidden = true;

  late double textHeight = Layout.screenHeight / 5.6;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firsHalf = widget.text.substring(0, textHeight.toInt());
      lastHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firsHalf = widget.text;
      lastHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: lastHalf.isEmpty
          ? SmallText(
              size: Layout.font16,
              color: Styles.paraColor,
              text: firsHalf,
              height: 1.8,
            )
          : Column(children: [
              SmallText(
                height: 1.8,
                text: isHidden ? "$firsHalf..." : firsHalf + lastHalf,
                size: Layout.font16,
                color: Styles.paraColor,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isHidden = !isHidden;
                  });
                },
                child: Row(
                  children: [
                    isHidden
                        ? SmallText(
                            text: 'Show More',
                            color: Styles.mainColor,
                          )
                        : SmallText(text: 'Show less', color: Styles.mainColor),
                    Icon(
                      isHidden
                          ? Icons.keyboard_arrow_down
                          : Icons.keyboard_arrow_up,
                      color: Styles.mainColor,
                    ),
                  ],
                ),
              )
            ]),
    );
  }
}
