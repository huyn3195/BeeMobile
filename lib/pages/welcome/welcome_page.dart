import 'package:beelive/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:beelive/routes/names.dart';
import 'package:beelive/constants/colors.dart';
import 'package:beelive/global.dart';
import 'package:beelive/pages/welcome/notifiers/welcome_notifier.dart';

final indexProvider = StateProvider<int>((ref) => 0);

class Welcome extends ConsumerWidget {
  Welcome({Key? key}) : super(key: key);

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final state = ref.watch(indexProvider);

    return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
                body: Container(
          margin: const EdgeInsets.only(top: 34),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              PageView(
                scrollDirection: Axis.horizontal,
                reverse: false,
                onPageChanged: (index) {
                  ref.read(welcomeProvider.notifier).pageChanged(index);
                },
                controller: _controller,
                pageSnapping: true,
                physics: const ClampingScrollPhysics(),
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 345,
                        child: Image.asset("assets/images/reading.png",
                            fit: BoxFit.fitWidth),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: Text("First See Learning",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.normal,
                            )),
                      ),
                      Container(
                        width: 375,
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Text(
                          "Forget about a for of paper all knowledge in one learning!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.primarySecondaryElementText,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      _buildTLogin(context, 1, "Next")
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 345,
                        child: Image.asset("assets/images/man.png",
                            fit: BoxFit.fitWidth),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: Text("Connect With Everyone",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.normal,
                            )),
                      ),
                      Container(
                        width: 375,
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Text(
                          "Always keep in touch with your tutor & friend. let’s get connected!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.primarySecondaryElementText,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      _buildTLogin(context, 2, "Next")
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 345,
                        child: Image.asset("assets/images/boy.png",
                            fit: BoxFit.fitWidth),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: Text("Always Fascinated Learning",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.normal,
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Text(
                          "Anywhere, anytime. The time is at your discretion so study whenever you want.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.primarySecondaryElementText,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      _buildTLogin(context, 3, "Get Started")
                    ],
                  ),
                ],
              ),
            ],
          ),
        ))));
  }

  Widget _buildTLogin(BuildContext context, int index, String title) {
    return GestureDetector(
        child: Container(
            height: 50,
            margin: const EdgeInsets.only(top: 100, left: 25, right: 25),
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Center(
                child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryBackground,
                fontWeight: FontWeight.normal,
                fontSize: 16.sp,
              ),
            ))),
        onTap: () {
          if (index < 3) {
            _controller.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          } else {
            Global.storageService
                .setBool(AppConstants.STORAGE_DEVICE_FIRST_OPEN_KEY, true);
            Navigator.of(context).pushNamedAndRemoveUntil(
                AppRoutes.signIn, (Route<dynamic> route) => false);
          }
        });
  }
}
