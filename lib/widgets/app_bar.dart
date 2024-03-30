import 'package:beelive/constants/colors.dart';
import 'package:flutter/material.dart';

AppBar appBar(
    {String? title,
    Widget? leading,
    List<Widget>? actions,
    Color backgroundColor = Colors.transparent}) {
  return AppBar(
    backgroundColor: backgroundColor,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    title: title != null
        ? Text(title,
            style: const TextStyle(
              fontFamily: "Avenir",
              color: AppColors.primaryText,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ))
        : null,
    leading: leading,
    actions: actions,
  );
}
