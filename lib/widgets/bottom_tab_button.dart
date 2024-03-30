import 'package:flutter/material.dart';
import 'package:beelive/widgets/image_widget.dart';
import 'package:beelive/constants/icons.dart';

Widget bottomTabButton({
  VoidCallback? onPressed,
  String imagePath = AppIcon.user,
  String imagePathSelected = AppIcon.user,
  int currentTab = 0,
  int tabNum = 0,
}) {
  return Expanded(
    child: Column(
      children: [
        InkWell(
          splashColor: Colors.transparent,
          onTap: onPressed ?? () {},
          // splashRadius: 25,
          child: SizedBox(
              child: appImage(
            width: 40,
            height: 40,
            imagePath: currentTab == tabNum ? imagePathSelected : imagePath,
          )),
        ),
      ],
    ),
  );
}
