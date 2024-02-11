import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/svg_path.dart';

class CustomDropDownButton extends StatelessWidget {
  final List<DropdownMenuItem<dynamic>>? items;
  final void Function(dynamic)? onChanged;
  final dynamic value;
  final String? hintText;
  final Widget? hint;
  final Widget? prefixIcon;
  final TextStyle? style;
  const CustomDropDownButton({
    super.key,
    this.items,
    this.onChanged,
    this.value,
    this.hintText, this.hint, this.prefixIcon, this.style,
  });

  @override
  Widget build(BuildContext context) {
    InputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: AppColors.authHintTextColor,
        width: 1.w,
      ),
    );
    InputBorder focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: AppColors.authHintTextColor,
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
    return DropdownButtonFormField(
      items: items,
      onChanged: onChanged,
      value: value,
      isExpanded: true,
      hint: hint,
      style: style,
      padding: EdgeInsets.zero,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        hintStyle: CustomThemes.authHintTextTheme(context),
        border: border,
        contentPadding: EdgeInsetsDirectional.only(
          start: 12.w,
          end: 4.w,
          bottom: 4.h,
          top: 4.h,
        ),
        focusedBorder: focusedBorder,
        enabledBorder: border,

        disabledBorder: border,
        errorBorder: errorBorderColor,
      ),
      iconSize: 40.r,
      icon: Ink(
        height: 40.h,
        width: 40.w,
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          color: AppColors.lightBlueBackgroundColor,
        ),
        child: SvgPicture.asset(
          SvgPath.dropDownArrow,
          height: 16.h,
          width: 16.w,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
