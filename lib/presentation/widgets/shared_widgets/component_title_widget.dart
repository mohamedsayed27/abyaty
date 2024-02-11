import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_text_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ComponentTitleWidget extends StatelessWidget {
  final String componentTitle;
  final bool isSeeAll;
  final void Function()? onSeeAllPressed;

  const ComponentTitleWidget({
    super.key,
    required this.componentTitle,
    this.isSeeAll = true,
    this.onSeeAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          componentTitle.tr(),
          style: CustomThemes.greyColor1ATextTheme(context).copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (isSeeAll)
          CustomTextButton(
            onPressed: onSeeAllPressed,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "See All",
                  style: CustomThemes.primaryColorTextTheme(context).copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.primaryColor,
                  size: 12.sp,
                ),
              ],
            ),
          ),
      ],
    );
  }
}
