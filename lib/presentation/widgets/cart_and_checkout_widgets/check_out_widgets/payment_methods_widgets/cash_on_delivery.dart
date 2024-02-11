import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/assets_path/images_path.dart';
import 'package:abyaty/core/assets_path/svg_path.dart';
import 'package:abyaty/core/constants/dummy_data.dart';
import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_elevated_button.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_outlined_button.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../shared_widgets/custom_check_box.dart';

class CashOnDelivery extends StatelessWidget {
  final bool isChecked;
  final void Function()? onPressed;

  const CashOnDelivery({super.key, this.isChecked = false, this.onPressed});

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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                SvgPath.moneys,
                colorFilter: const ColorFilter.mode(
                  AppColors.primaryColor,
                  BlendMode.srcIn,
                ),
                width: 16.w,
                height: 16.h,
              ),
              const CustomSizedBox(
                width: 8,
              ),
              Text(
                "Cash On Delivery",
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
              const Spacer(),
              CustomCheckBox(isChecked: isChecked),
            ],
          ),
          Text(
            "Pay once you get your order",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: CustomThemes.greyColor80TextTheme(context)
                .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400),
          ).onlyDirectionalPadding(start: 24),
        ],
      ).symmetricPadding(vertical: 12, horizontal: 16),
    );
  }
}
