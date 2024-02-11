import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/app_colors.dart';

class CustomCheckBox extends StatelessWidget {
  final bool isChecked;
  final double? width;
  final double? height;
  final double? padding;
  const CustomCheckBox({
    super.key,
    this.isChecked = false, this.width, this.height, this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width?.w??24.w,
      height: height?.h??24.h,
      padding: EdgeInsets.all(padding?.r??4.r),
      decoration: BoxDecoration(
        color: isChecked
            ? AppColors.checkBoxBackgroundColor
            : Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: isChecked
              ? AppColors.primaryColor
              : AppColors.regularGreyTextColor,
          width: 1.w,
        ),
      ),
      child: isChecked
          ? Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
              ),
            )
          : null,
    );
  }
}
