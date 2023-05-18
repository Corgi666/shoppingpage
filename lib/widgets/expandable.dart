import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/widgets/small_text.dart';
import 'package:flutter/material.dart';

import '../utils/dimension.dart';

class Expandable_text_widget extends StatefulWidget {
  final String text;
  const Expandable_text_widget({super.key, required this.text});

  @override
  State<Expandable_text_widget> createState() => _Expandable_text_widgetState();
}

class _Expandable_text_widgetState extends State<Expandable_text_widget> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight / 5.63;
  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: secondHalf.isEmpty
            ? SmallText(text: firstHalf)
            : Column(
                children: [
                  SmallText(
                    text: hiddenText
                        ? ("$firstHalf...")
                        : (firstHalf + secondHalf),
                    size: 16,
                    color: AppColors.textColor,
                    height: 1.8,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        hiddenText = !hiddenText;
                      });
                    },
                    child: Row(
                      children: [
                        SmallText(
                          text: hiddenText ? "Show more" : "Show less",
                          color: AppColors.mainColor,
                          size: 16,
                        ),
                        Icon(
                          hiddenText
                              ? Icons.arrow_drop_down
                              : Icons.arrow_drop_up,
                          color: AppColors.mainColor,
                        )
                      ],
                    ),
                  )
                ],
              ));
  }
}
