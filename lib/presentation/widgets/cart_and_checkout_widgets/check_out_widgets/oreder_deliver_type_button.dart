import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/assets_path/svg_path.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_outlined_button.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderDeliverTypeButton extends StatelessWidget {
  final bool isSelected;
  final String title;
  final String imagePath;
  final void Function()? onPressed;
  const OrderDeliverTypeButton({
    super.key,
    required this.isSelected,
    required this.title,
    required this.imagePath, this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedButton(
      onPressed: onPressed,
      borderColor: isSelected
          ? AppColors.primaryColor
          : AppColors.orderDestinationTypeWidget,
      borderRadius: 8,
      backgroundColor:
          isSelected ? AppColors.primaryColor : AppColors.whiteColor,
      foregroundColor: isSelected
          ? AppColors.whiteColor
          : AppColors.orderDestinationTypeWidget,
      height: 100,
      width: 100,
      padding: EdgeInsets.only(top: 16.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            imagePath,
            width: 40.w,
            height: 40.h,
          ),
          const CustomSizedBox(height: 8,),
          Expanded(
            child: Text(
              title,
              style: isSelected
                  ? CustomThemes.whiteColoTextTheme(context)
                      .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600)
                  : CustomThemes.greyColor80TextTheme(context)
                      .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
