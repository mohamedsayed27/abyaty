import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBarTextField extends StatelessWidget {
  final bool enabled;
  final bool readOnly;
  final TextEditingController? controller;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function()? onTap;
  final bool? autofocus;
  const SearchBarTextField({
    super.key,
    this.enabled = false,
    this.controller,
    required this.hintText,
    this.suffixIcon,
    this.autofocus = false,
    this.prefixIcon, this.onTap, this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    InputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: AppColors.searchBorderColor,
        width: 1.w,
      ),
    );
    InputBorder focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: AppColors.primaryColor,
        width: 1.w,
      ),
    );
    InputBorder errorBorderColor = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: AppColors.redColor,
        width: 1.w,
      ),
    );
    return TextField(
      controller: controller,
      onTap: onTap,
      readOnly: readOnly,
      autofocus: autofocus ?? false,
      style: CustomThemes.authStringTextTheme(context),
      decoration: InputDecoration(
        border: border,
        focusedBorder: focusedBorder,
        enabledBorder: border,
        disabledBorder: border,
        errorBorder: errorBorderColor,
        contentPadding: EdgeInsets.all(8.r),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.white,
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: CustomThemes.authHintTextTheme(context),
        enabled: enabled,
      ),
    );
  }
}
