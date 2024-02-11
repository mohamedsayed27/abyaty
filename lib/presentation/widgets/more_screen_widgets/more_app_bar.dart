import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/constants/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/assets_path/images_path.dart';

class MoreAppBar extends StatelessWidget {
  final List<Widget>? actions;
  final Widget? leading;
  const MoreAppBar({super.key, this.actions, this.leading});

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
          "More",
          style: CustomThemes.greyColor1ATextTheme(context).copyWith(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: leading,
        centerTitle: true,
        actions: actions,
      ),
    );
  }
}
