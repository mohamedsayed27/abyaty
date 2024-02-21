import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_outlined_button.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategoriesTabBarButton extends StatelessWidget {
  final bool isSelected;
  final void Function()? onPressed;
  final String title;

  const SubCategoriesTabBarButton({
    super.key,
    required this.isSelected,
    this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedButton(
      borderColor:
          isSelected ? AppColors.secondaryColor : AppColors.greyTextColor,
      borderRadius: 8,
      backgroundColor: isSelected
          ? AppColors.categoriesTabBarBackgroundColor
          : AppColors.whiteColor,
      onPressed: onPressed,
      height: 32,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      foregroundColor: AppColors.secondaryColor,
      child: Text(
        title,
        style: isSelected
            ? CustomThemes.secondaryColorTextTheme(context).copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        )
            : CustomThemes.greyColor99TextTheme(context).copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
