import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_outlined_button.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared_widgets/custom_check_box.dart';

class DeliveryOptionsCheckBoxWidget extends StatelessWidget {
  final bool isChecked;
  final String title;
  final String description;
  final void Function()? onPressed;
  final void Function()? changePressed;
  final bool isStandardOptions;

  const DeliveryOptionsCheckBoxWidget({
    super.key,
    this.isChecked = false,
    required this.title,
    required this.description,
    this.onPressed,
    this.isStandardOptions = true,
    this.changePressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedButton(
      padding: EdgeInsets.zero,
        onPressed:onPressed,
      backgroundColor: isChecked
          ? AppColors.lightBlueBackgroundColor
          : AppColors.whiteColor,
      borderColor: isChecked
          ? AppColors.primaryColor
          : AppColors.authHintTextColor,
      borderRadius: 8,
      foregroundColor: AppColors.primaryColor,
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
          isStandardOptions
              ? Text(
                  description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: CustomThemes.greyColor80TextTheme(context)
                      .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400),
                )
              : SizedBox(
                  height: 20.h,
                  child: TextButton(
                    onPressed: changePressed,
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Text(
                      description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: isStandardOptions?CustomThemes.greyColor80TextTheme(context)
                          .copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ):CustomThemes.secondaryColorTextTheme(context)
                          .copyWith(
                        fontSize: 14.sp,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.secondaryColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
        ],
      ).symmetricPadding(vertical: 12, horizontal: 16),
    );
  }
}
