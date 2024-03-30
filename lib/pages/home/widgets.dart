import 'package:beelive/pages/home/screens/homeScreen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:beelive/constants/icons.dart';
import 'package:beelive/widgets/image_widget.dart';

import 'package:beelive/pages/home/screens/communityScreen/community_screen.dart';

Widget appScreen({
  int index = 0,
}) {
  List<Widget> screen = [
    Center(
        child: appImage(
            height: 100, width: 100, imagePath: AppIcon.messageSelected)),
    Center(
        child:
            appImage(height: 100, width: 100, imagePath: AppIcon.homeSelected)),
    const CommunityScreen(),
  ];

  return screen[index];
}
