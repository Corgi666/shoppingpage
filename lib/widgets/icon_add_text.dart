import 'package:ecommerce/widgets/small_text.dart';
import 'package:flutter/material.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final double fontsize;
  final Color color;
  final Color iconCOlor;
  const IconAndTextWidget({
    super.key,
    required this.icon,
    required this.iconCOlor,
    required this.text,
    required this.color,
    required this.fontsize
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconCOlor,
        ),
        const SizedBox(
          width: 5,
        ),
        SmallText(
          text: text,
          color: color,size: fontsize,
        )
      ],
    );
  }
}
