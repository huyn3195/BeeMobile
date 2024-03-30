import 'package:beelive/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:beelive/constants/colors.dart';
import 'package:beelive/constants/icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckInScreen extends ConsumerStatefulWidget {
  const CheckInScreen({Key? key}) : super(key: key);
  @override
  ConsumerState<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends ConsumerState<CheckInScreen> {
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryBg,
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(27.46, 205.16, 27.46, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "How are you feeling today?",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18.2,
                  fontFamily: 'Arima-Regular.ttf',
                  color: AppColors.primaryText,
                ),
              ),
              const SizedBox(height: 40.6),
              SizedBox(
                width: 334,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Image.asset(AppIcon.angry),
                    ),
                    const SizedBox(width: 13),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(AppIcon.sad),
                    ),
                    const SizedBox(width: 13),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(AppIcon.normal),
                    ),
                    const SizedBox(width: 13),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(AppIcon.happy),
                    ),
                    const SizedBox(width: 13),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(AppIcon.veryHappy),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "What's affecting your mood?",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18.2,
                  fontFamily: 'Arima-Regular.ttf',
                  color: AppColors.primaryText,
                ),
              ),
              const SizedBox(height: 150.16),
              const Text(
                "Let's write about it!",
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontSize: 18.2,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Arima-Regular.ttf',
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 363.67,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(color: Colors.black), // Border color
                  ),
                  child: const TextField(
                    style: TextStyle(
                        color: AppColors.primaryText, fontSize: 15.93),
                    decoration: InputDecoration(
                      hintText: 'Write here...',
                      hintStyle: TextStyle(color: AppColors.secondaryText),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8.8, horizontal: 20),
                      border: InputBorder.none,
                    ),
                    maxLines: null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
