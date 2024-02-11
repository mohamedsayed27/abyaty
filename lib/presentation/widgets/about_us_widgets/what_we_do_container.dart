import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/app_colors.dart';

class WhatWeDoContainer extends StatelessWidget {
  final String secondaryColorTitle;
  final String boldTitle;
  final String body;

  const WhatWeDoContainer({
    super.key,
    required this.secondaryColorTitle,
    required this.boldTitle,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor(),
              offset: Offset(0, 8.h),
              blurRadius: 32.r,
            ),
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: secondaryColorTitle,
              style: CustomThemes.secondaryColorTextTheme(context).copyWith(
                fontSize: 32.sp,
                fontWeight: FontWeight.w800,
              ),
              children: [
                TextSpan(
                  text: boldTitle,
                  style: CustomThemes.greyColo4DTextTheme(context).copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
          const CustomSizedBox(
            height: 8,
          ),
          Text(
            body,
            style: CustomThemes.greyColor80TextTheme(context).copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
