

import 'package:abyaty/core/constants/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/app_theme/custom_themes.dart';
import '../../shared_widgets/custom_elevated_button.dart';

class PromoCodeTextField extends StatelessWidget {
  const PromoCodeTextField({super.key});

  @override
  Widget build(BuildContext context) {
    InputBorder border = OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.authHintTextColor,
        width: 1.w,
      ),
      borderRadius: BorderRadius.circular(8.r),
    );
    return TextFormField(
      style: CustomThemes.authStringTextTheme(context),
      decoration: InputDecoration(
        focusedBorder: border,
        border: border,
        enabledBorder: border,
        contentPadding: EdgeInsetsDirectional.only(
          start: 16.w,
          end: 4.w,
          top: 4.h,
          bottom: 4.h,
        ),
        hintText: "Write the promo code ...",
        hintStyle: CustomThemes.authHintTextTheme(context).copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        suffixIcon: CustomElevatedButton(
          borderRadius: 4,
          text: "Apply",
          height: 40,
          onPressed: (){},
          backgroundColor: AppColors.lightBlueBackgroundColor,
          foregroundColor: AppColors.primaryColor,
          titleStyle: CustomThemes.primaryColorTextTheme(context).copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ).onlyDirectionalPadding(top: 4,bottom: 4,end: 4),
      ),
    );
  }
}