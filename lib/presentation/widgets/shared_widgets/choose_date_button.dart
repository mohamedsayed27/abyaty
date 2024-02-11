import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/svg_path.dart';
import 'custom_outlined_button.dart';

class ChooseDateButton extends StatelessWidget {
  final void Function()? onPressed;
  final String value;

  const ChooseDateButton({
    super.key,
    this.onPressed,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedButton(
      borderColor: AppColors.authHintTextColor,
      borderRadius: 8,
      height: 48,
      onPressed: onPressed,
      foregroundColor: AppColors.primaryColor,
      padding: EdgeInsetsDirectional.only(
        start: 8.w,
        end: 2.w,
        top: 2.h,
        bottom: 2.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            value,
            style: CustomThemes.greyColor1ATextTheme(context)
                .copyWith(fontWeight: FontWeight.w400, fontSize: 16.sp),
          ),
          Ink(
            height: 40.h,
            width: 40.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              color: AppColors.lightBlueBackgroundColor,
            ),
            child: Center(
              child: SvgPicture.asset(
                SvgPath.calendar,
                height: 20.h,
                width: 20.w,
                alignment: Alignment.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
