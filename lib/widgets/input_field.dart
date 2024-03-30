import 'package:flutter/material.dart';
import 'package:beelive/constants/colors.dart';

Widget inputField(
    {String hintText = '',
    bool obscureText = false,
    String labelText = '',
    Function(String value)? func,
    TextEditingController? controller}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        labelText,
        textAlign: TextAlign.left,
        style: const TextStyle(
          color: AppColors.primarySecondaryElementText,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      Container(
        height: 50,
        padding: const EdgeInsets.only(top: 0, bottom: 0),
        decoration: BoxDecoration(
            color: AppColors.primaryBackground,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            border: Border.all(color: AppColors.primaryFourthElementText)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Container(
            //   margin: const EdgeInsets.only(left: 17),
            //   padding: const EdgeInsets.only(left: 0, top: 0),
            //   width: 16,
            //   height: 16,
            //   child: Image.asset("assets/icons/user.png"),
            // ),
            SizedBox(
              width: 280,
              height: 50,
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: obscureText ? '********' : hintText,
                  contentPadding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  hintStyle: const TextStyle(
                    color: AppColors.primaryThirdElementText,
                  ),
                ),
                style: const TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
                onChanged: (value) {
                  func!(value);
                },
                maxLines: 1,
                autocorrect: false,
                obscureText: obscureText,
              ),
            )
          ],
        ),
      ),
    ],
  );
}
