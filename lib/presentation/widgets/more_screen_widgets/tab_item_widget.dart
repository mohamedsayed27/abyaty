import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabItemWidget extends StatelessWidget {
  final String iconPath;
  final String title;
  final void Function()? onPressed;

  const TabItemWidget({
    super.key,
    required this.iconPath,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: AppColors.regularGreyTextColor,
        size: 20.r,
      ),
      contentPadding: EdgeInsets.zero,
      shape: const LinearBorder(
        side: BorderSide(
          color: AppColors.moreItemBackGroundColor,
        ),
        bottom: LinearBorderEdge(
          size: 1,
        )
      ),
      onTap: onPressed,
      title: Text(
        title.tr(),
        textAlign: TextAlign.start,
        style: CustomThemes.greyColor1ATextTheme(context).copyWith(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      leading: Container(
        height: 40.h,
        width: 40.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.moreItemBackGroundColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: SvgPicture.asset(
          iconPath,
          width: 24.w,
          height: 24.h,
        ),
      ),
    );
  }
}
