import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../assets_path/fonts_path.dart';
import 'app_colors.dart';

class AppTheme{

  static ThemeData lightTheme = ThemeData(
    primarySwatch: AppColors.createMaterialColor(AppColors.primaryColor),
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    primaryColor: AppColors.primaryColor,
    canvasColor: Colors.white,
    useMaterial3: true,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryColor,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      elevation: 0
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      showDragHandle: true,
    ),
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontFamily: FontsPath.sfProText,
        color: AppColors.boldGreyTextColor,
      ),
      headlineMedium: TextStyle(
        fontFamily: FontsPath.sfProText,
        color: AppColors.whiteColor,
      ),
      headlineSmall: TextStyle(
        fontFamily: FontsPath.sfProText,
        color: AppColors.primaryColor,
      ),
      titleLarge: TextStyle(
        fontFamily: FontsPath.sfProText,
        color: AppColors.secondaryColor,
      ),
      titleSmall: TextStyle(
        fontFamily: FontsPath.sfProText,
        color: AppColors.regularGreyTextColor,
      ),
      titleMedium: TextStyle(
        fontFamily: FontsPath.sfProText,
        color: AppColors.authHintTextColor,
      ),
      labelLarge: TextStyle(
        fontFamily: FontsPath.sfProText,
        color: AppColors.greyTextColor,
      ),
      labelMedium: TextStyle(
        fontFamily: FontsPath.sfProText,
        color: AppColors.grey4D
      ),
      labelSmall: TextStyle(
        fontFamily: FontsPath.sfProText,
        color: AppColors.darkColor
      ),
      bodyLarge: TextStyle(
        color: AppColors.greenColor,
        fontFamily: FontsPath.sfProText,
      )
    ),
  );

}