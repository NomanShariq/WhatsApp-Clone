import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundcolor;
  final Color iconColour;
  final double size;
  final double iconsize;
  final Color bordercolor;
  AppIcon(
      {Key? key,
      required this.icon,
      this.backgroundcolor = Colors.white,
      this.iconColour = Colors.grey,
      this.size = 40,
      this.iconsize = 16,this.bordercolor=Colors.black,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        color: backgroundcolor,
        border: Border.all(
          color: bordercolor,
        )
      ),
      child: Icon(
        icon,
        color: iconColour,
        size: iconsize,
      ),
    );
  }
}
