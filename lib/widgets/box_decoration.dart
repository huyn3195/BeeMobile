import 'package:beelive/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

BoxDecoration boxShadowWithTopRadius(
    {Color color = AppColors.primaryElement,
    double radius = 20,
    double sR = 1,
    double bR = 2,
    BoxBorder? border}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius.h),
          topRight: Radius.circular(radius.h)),
      border: border,
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: sR,
            blurRadius: bR,
            offset: const Offset(0, 1))
      ]);
}

BoxDecoration boxGradientWithTopRadius({
  double radius = 20,
}) {
  return BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius.h),
          topRight: Radius.circular(radius.h)),
      gradient: const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        stops: [
          0.1,
          0.6,
          0.95,
        ],
        colors: [
          Color.fromARGB(255, 219, 240, 216),
          Color.fromARGB(255, 166, 178, 247),
          Color.fromARGB(255, 197, 245, 207),
        ],
      ));
}
