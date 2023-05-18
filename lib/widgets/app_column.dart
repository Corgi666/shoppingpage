import 'package:ecommerce/widgets/small_text.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'big_text.dart';
import 'icon_add_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  final int star;
  final int starCount;
  const AppColumn(
      {super.key,
      required this.text,
      required this.star,
      required this.starCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text),
        const SizedBox(
          height: 10,
        ),
        Row(
          //  mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Wrap(
              children: [
                for (int i = 0; i < star; i++)
                  const Icon(
                    Icons.star,
                    size: 13,
                    color: AppColors.mainColor,
                  ),
                for (int i = star; i < 5; i++)
                  const Icon(
                    Icons.star_border,
                    size: 13,
                    color: AppColors.mainColor,
                  ),
                const SizedBox(
                  width: 10,
                ),
                SmallText(
                  text: '$starCount',
                  size: 14,
                ),
                const SizedBox(
                  width: 10,
                ),
                const SmallText(
                  text: '1872',
                  size: 14,
                ),
                const SizedBox(
                  width: 10,
                ),
                const SmallText(
                  text: 'Comments',
                  size: 14,
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 22,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconAndTextWidget(
                icon: Icons.circle,
                text: 'Normal',
                fontsize: 14,
                color: AppColors.mainColor,
                iconCOlor: AppColors.iconColor1),
            SizedBox(
              width: 15,
            ),
            IconAndTextWidget(
                icon: Icons.location_on,
                text: '1.72km',
                fontsize: 14,
                color: AppColors.mainColor,
                iconCOlor: AppColors.iconColor2),
            SizedBox(
              width: 15,
            ),
            IconAndTextWidget(
                icon: Icons.access_time_rounded,
                text: '32min',
                fontsize: 14,
                color: AppColors.mainColor,
                iconCOlor: AppColors.iconColor1),
          ],
        ),
      ],
    );
  }
}
