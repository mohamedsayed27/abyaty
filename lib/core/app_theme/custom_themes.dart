import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../assets_path/fonts_path.dart';
import 'app_colors.dart';

class CustomThemes {
  static TextStyle introScreensTitleTextStyle(context) => Theme.of(context)
      .textTheme
      .headlineLarge!
      .copyWith(fontSize: 20.sp, fontWeight: FontWeight.w600);

  static TextStyle authHintTextTheme(context) =>
      Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          );

  static TextStyle authStringTextTheme(context) =>
      Theme.of(context).textTheme.headlineLarge!.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          );

  static TextStyle introScreensTitleHeavyTextStyle(context) =>
      Theme.of(context).textTheme.headlineLarge!.copyWith(
            fontSize: 20.sp,
            fontFamily: FontsPath.sfProTextHeavy,
          );

  static TextStyle authSecondaryColorTitleHeavyTextStyle(context) =>
      Theme.of(context).textTheme.headlineLarge!.copyWith(
            fontSize: 20.sp,
            fontFamily: FontsPath.sfProTextHeavy,
            color: AppColors.secondaryColor,
          );

  static TextStyle introScreensBodyTextStyle(context) =>
      Theme.of(context).textTheme.labelLarge!.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          );

  static TextStyle termsAnConditionActiveText(context) =>
      Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.secondaryColor,
          );

  static TextStyle termsAnConditionInactiveText(context) =>
      Theme.of(context).textTheme.headlineLarge!.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          );

  static TextStyle primaryColorTextTheme(context) =>
      Theme.of(context).textTheme.headlineSmall!;

  static TextStyle secondaryColorTextTheme(context) =>
      Theme.of(context).textTheme.titleLarge!;

  static TextStyle greyColor1ATextTheme(context) =>
      Theme.of(context).textTheme.headlineLarge!;

  static TextStyle greyColor80TextTheme(context) =>
      Theme.of(context).textTheme.titleSmall!;

  static TextStyle greyColorB3TextTheme(context) =>
      Theme.of(context).textTheme.titleMedium!;

  static TextStyle whiteColoTextTheme(context) =>
      Theme.of(context).textTheme.headlineMedium!;

  static TextStyle greyColor99TextTheme(context) =>
      Theme.of(context).textTheme.labelLarge!;

  static TextStyle greyColo4DTextTheme(context) =>
      Theme.of(context).textTheme.labelMedium!;

  static TextStyle darkColorTextTheme(context) =>
      Theme.of(context).textTheme.labelSmall!;

  static TextStyle greenTextColorTheme(context) =>
      Theme.of(context).textTheme.bodyLarge!;
}
