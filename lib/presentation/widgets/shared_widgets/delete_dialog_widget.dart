import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_elevated_button.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_outlined_button.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:abyaty/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:easy_localization/easy_localization.dart';
class DeleteDialogWidget extends StatelessWidget {
  final String? title;
  const DeleteDialogWidget({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      backgroundColor: AppColors.whiteColor,
      surfaceTintColor: AppColors.whiteColor,
      elevation: 0,
      // insetPadding: EdgeInsets.all(16.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title?.tr()??LocaleKeys.deleteCardAlert.tr(),
            style: CustomThemes.greyColor1ATextTheme(context).copyWith(
              fontSize: 19.sp,
              fontWeight: FontWeight.w600,
            ),
          ),

          const CustomSizedBox(height: 16,),
          Row(
            children: [
              Expanded(
                child: CustomElevatedButton(
                  borderRadius: 8,
                  backgroundColor: AppColors.redColor,
                  padding: EdgeInsets.zero,
                  height: 56,
                  onPressed: (){},
                  text: LocaleKeys.delete.tr(),
                  titleStyle: CustomThemes.whiteColoTextTheme(context).copyWith(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const CustomSizedBox(width: 16,),
              Expanded(
                child: CustomOutlinedButton(
                  borderRadius: 8,
                  padding: EdgeInsets.zero,
                  onPressed: (){},
                  height: 56,
                  text: "Cancel",
                  foregroundColor: AppColors.primaryColor,
                  style: CustomThemes.primaryColorTextTheme(context).copyWith(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w600,
                  ), borderColor: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ],
      ).symmetricPadding(horizontal: 16,vertical: 16),
    );
  }
}
