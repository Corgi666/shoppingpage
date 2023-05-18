import 'package:flutter/material.dart';

import '../utils/colors.dart';

class AppIcon2 extends StatelessWidget {
  final IconData icon;
  final GestureTapCallback onpress;
  const AppIcon2({super.key, required this.icon, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 20),
      child: IconButton(
        onPressed:  onpress,
        icon: Icon(
          icon,
          color: AppColors.mainColor,
        ),
      ),
    );
  }
}
