import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/app_colors.dart';

class CustomDividerWidget extends StatelessWidget {
  final double? width;
  const CustomDividerWidget({super.key, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 2.h,
      decoration: BoxDecoration(
          color: AppColors.dividerColor,
          border: Border.all(
            width: width?.w??4.w,
            color: AppColors.dividerColor,
          )
      ),
    );
  }
}
