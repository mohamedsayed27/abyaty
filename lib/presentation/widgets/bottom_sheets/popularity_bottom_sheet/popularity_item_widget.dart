import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared_widgets/custom_check_box.dart';

class PopularityItem extends StatelessWidget {
  final bool isChecked;
  final String title;
  final void Function()? onPressed;
  const PopularityItem({super.key, this.isChecked = false, required this.title, this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.popularityContainerBackgroundColor,
      borderRadius: BorderRadius.circular(16.r),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(16.r),

        child: Ink(
          padding: EdgeInsetsDirectional.only(start: 16.w,end: 8.w,top: 8.h,bottom: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,style: CustomThemes.greyColor80TextTheme(context).copyWith(fontSize: 16.sp,fontWeight: FontWeight.w500),),
              CustomCheckBox(isChecked: isChecked),
            ],
          ),
        ),
      ),
    );
  }
}
