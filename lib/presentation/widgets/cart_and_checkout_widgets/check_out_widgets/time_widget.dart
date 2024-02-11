import 'package:abyaty/core/constants/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/app_theme/custom_themes.dart';
import '../../shared_widgets/custom_check_box.dart';
import '../../shared_widgets/custom_outlined_button.dart';

class TimeWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final bool isChecked;

  const TimeWidget({
    super.key,
    this.onPressed,
    required this.title,
    required this.isChecked,
  });

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      backgroundColor:
          isChecked ? AppColors.lightBlueBackgroundColor : AppColors.whiteColor,
      borderColor:
          isChecked ? AppColors.primaryColor : AppColors.authHintTextColor,
      borderRadius: 8,
      foregroundColor: AppColors.primaryColor,
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: CustomThemes.greyColor1ATextTheme(context)
                  .copyWith(fontWeight: FontWeight.w500, fontSize: 16.sp),
            ),
          ),
          CustomCheckBox(isChecked: isChecked),
        ],
      ).symmetricPadding(horizontal: 16),
    );
  }
}
