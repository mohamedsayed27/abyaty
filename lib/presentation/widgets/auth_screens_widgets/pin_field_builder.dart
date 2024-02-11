import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../core/app_theme/app_colors.dart';


class PinFieldBuilder extends StatelessWidget {
  final TextEditingController? controller;

  const PinFieldBuilder({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
        controller: controller,
        appContext: context,
        length: 6,
        autoFocus: false,
        cursorColor: Colors.black,
        obscureText: false,
        hintCharacter: "-",
        textStyle: TextStyle(fontSize: 16.sp,color: AppColors.primaryColor),
        hintStyle: TextStyle(fontSize: 16.sp,color: AppColors.authHintTextColor),
        keyboardType: TextInputType.phone,
        animationType: AnimationType.scale,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(8.r),
          fieldHeight: 48.h,
          fieldWidth: 48.w,
          borderWidth: 1.w,
          activeFillColor: const Color(0xffEFF7FE),
          selectedFillColor: AppColors.whiteColor,
          activeColor: AppColors.primaryColor,selectedColor: AppColors.primaryColor,
          inactiveColor: AppColors.greyTextColor,
          inactiveFillColor: AppColors.whiteColor,
        ),
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Colors.transparent,
        enableActiveFill: true,
        onCompleted: (code) {},
        onChanged: (value) {});
  }
}