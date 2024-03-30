import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:beelive/constants/colors.dart';
import 'package:beelive/constants/icons.dart';

Widget appImage(
    {String imagePath = AppIcon.user, double width = 30, double height = 30}) {
  return Image.asset(imagePath, width: width.w, height: height.h);
}

Widget appImageWithColor(
    {String imagePath = AppIcon.user,
    double width = 20,
    double height = 20,
    Color color = AppColors.primaryText}) {
  return Image.asset(
    imagePath,
    width: width.w,
    height: height.h,
    color: color,
  );
}
