import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_theme/app_colors.dart';

class BottomNavBarIcon extends StatelessWidget {
  final String label;
  final String iconPath;
  final String activeIconPath;
  final void Function() onTap;
  final double? iconWidth;
  final bool isSelected;
  final double? iconHeight;

  const BottomNavBarIcon({
    Key? key,
    required this.label,
    required this.iconPath,
    required this.onTap,
    this.iconWidth,
    this.iconHeight,
    required this.activeIconPath,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.zero,
        side: const BorderSide(color: Colors.transparent),
        foregroundColor: AppColors.primaryColor,
        backgroundColor: AppColors.whiteColor,
        shape: const CircleBorder(),
      ),
      onPressed: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            isSelected ? activeIconPath : iconPath,
            width: 24.w,
            height: 24.h,
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            label,
            style: isSelected
                ? CustomThemes.primaryColorTextTheme(context)
                    .copyWith(fontSize: 12.sp, fontWeight: FontWeight.w500)
                : CustomThemes.greyColorB3TextTheme(context)
                    .copyWith(fontSize: 12.sp, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
