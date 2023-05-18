import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double siez;
  final double IconSize;
  const AppIcon(
      {super.key,
      required this.icon,
      this.backgroundColor = const Color(0xFFfcf4e4),
      this.iconColor = const Color(0xFF756d54),
      this.siez = 40,this.IconSize=16});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: siez,
      height: siez,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(siez / 2),
        color: backgroundColor,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: IconSize,
      ),
    );
  }
}
