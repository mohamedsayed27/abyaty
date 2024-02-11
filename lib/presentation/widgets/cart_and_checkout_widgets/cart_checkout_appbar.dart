import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CartAndCheckoutAppBar extends StatelessWidget {
  final String title;

  const CartAndCheckoutAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor(),
            offset: Offset(0, 8.h),
            blurRadius: 32.r,
          )
        ],
      ),
      child: AppBar(
        title: Text(
          title,
          style: CustomThemes.greyColor1ATextTheme(context).copyWith(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
