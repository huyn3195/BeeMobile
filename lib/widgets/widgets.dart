library widgets;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:beelive/constants/icons.dart';
import 'package:beelive/constants/colors.dart';

import 'image_widget.dart';
import 'box_decoration.dart';
import 'button.dart';

export 'button.dart';
export 'toast.dart';
export 'input_field.dart';
export 'app_bar.dart';
export 'box_decoration.dart';
export 'image_widget.dart';
export 'bottom_tab_button.dart';

Widget dailyCheckinScreeen(
    {VoidCallback? closeBottomSheet,
    Function(int value)? setScreenIndex,
    int index = 0,
    double height = 500}) {
  final now = DateTime.now();

  final PageController controller = PageController();

  return SizedBox(
    height: height,
    child: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        children: [
          Container(
            decoration: boxGradientWithTopRadius(radius: 20),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(children: [
                Stack(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 36,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: AppColors.primaryBackground,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            children: [
                              Text(
                                  DateFormat('EEE, d MMM')
                                      .format(now)
                                      .toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  )),
                              const SizedBox(
                                width: 7,
                              ),
                              appImageWithColor(
                                  width: 16,
                                  height: 16,
                                  imagePath: AppIcon.calendar,
                                  color: AppColors.primaryText)
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      closeButton(onTap: closeBottomSheet)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 36,
                        child: const Text('1/2',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            )),
                      ),
                    ],
                  ),
                ]),
                const SizedBox(
                  height: 500,
                ),
                continueButton(index: 1, controller: controller)
              ]),
            ),
          ),
          Container(
            decoration: boxGradientWithTopRadius(radius: 20),
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      backButton(index: 0, controller: controller),
                      const Spacer(),
                      const Text('2/2',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          )),
                      const Spacer(),
                      closeButton(onTap: closeBottomSheet)
                    ],
                  ),
                ])),
          ),
        ]),
  );
}

Widget continueButton({int index = 0, required PageController controller}) {
  return button(
      onTap: () {
        if (index < 2) {
          controller.animateToPage(
            index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        } else {}
      },
      buttonText: 'Continue',
      buttonColor: AppColors.primaryElement,
      textColor: AppColors.primaryBackground,
      hasBorder: false,
      borderRadius: 30);
}

Widget closeButton({VoidCallback? onTap}) {
  return InkWell(
    splashColor: Colors.transparent,
    focusColor: Colors.transparent,
    hoverColor: Colors.transparent,
    onTap: onTap ?? () {},
    child: Container(
      width: 28,
      height: 28,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primaryBackground,
      ),
      child: appImageWithColor(
          imagePath: AppIcon.close, color: AppColors.primaryText),
    ),
  );
}

Widget backButton({int index = 0, required PageController controller}) {
  return InkWell(
    splashColor: Colors.transparent,
    focusColor: Colors.transparent,
    hoverColor: Colors.transparent,
    onTap: () => {
      if (index >= 0)
        {
          controller.animateToPage(
            index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          )
        }
    },
    child: SizedBox(
      width: 28,
      height: 28,
      child: appImageWithColor(
          imagePath: AppIcon.arrowLeft, color: AppColors.primaryText),
    ),
  );
}
