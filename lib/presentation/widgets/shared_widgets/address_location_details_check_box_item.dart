import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_outlined_button.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_check_box.dart';

class AddressLocationDetailsCheckItem extends StatelessWidget {
  final bool isChecked;
  final String title;
  final String description;
  final void Function()? onPressed;

  const AddressLocationDetailsCheckItem({
    super.key,
    this.isChecked = false,
    required this.title,
    required this.description,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      borderColor:
          isChecked ? AppColors.primaryColor : AppColors.authHintTextColor,
      foregroundColor: AppColors.primaryColor,
      backgroundColor: isChecked
          ? AppColors.lightBlueBackgroundColor
          : AppColors.whiteColor,
      borderRadius: 8,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: isChecked
                    ? CustomThemes.primaryColorTextTheme(context).copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      )
                    : CustomThemes.greyColor1ATextTheme(context).copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
              ),
              CustomCheckBox(isChecked: isChecked),
            ],
          ),
          Text(
            description,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: CustomThemes.greyColor80TextTheme(context)
                .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400),
          ),

        ],
      ).symmetricPadding(vertical: 12,horizontal: 16),
    );
  }
}
