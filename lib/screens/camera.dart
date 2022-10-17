import 'package:flutter/material.dart';

import '../widgets/app_icon.dart';

class Camera extends StatelessWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppIcon(
        iconsize: 30,
        bordercolor: Colors.transparent,
        backgroundcolor: Colors.transparent,
        icon: Icons.camera_alt,
      ),
    );
  }
}
