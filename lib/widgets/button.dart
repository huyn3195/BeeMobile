import 'package:flutter/material.dart';
import 'package:beelive/constants/colors.dart';

Widget button(
    {VoidCallback? onTap,
    String buttonText = '',
    Color buttonColor = AppColors.primaryBackground,
    Color textColor = AppColors.primaryText,
    bool hasBorder = true,
    bool hasShadow = true,
    double borderRadius = 15}) {
  return GestureDetector(
    onTap: onTap ?? () {},
    child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          border: hasBorder
              ? Border.all(color: AppColors.primaryFourthElementText)
              : null,
          boxShadow: hasShadow
              ? [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ]
              : null,
        ),
        child: Center(
            child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ))),
  );
}
