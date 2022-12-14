import 'package:ecommerce/utils/colors.dart';
import 'package:flutter/material.dart';

class icon_with_text extends StatelessWidget {
  final String text;
  final double size;
  final IconData icon;
  const icon_with_text(
      {super.key, required this.text, required this.icon, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        Text(
          text,
          style: TextStyle(fontSize: size, color: AppColors.mainColor),
        ),
        Icon(icon)
      ],
    ));
  }
}
