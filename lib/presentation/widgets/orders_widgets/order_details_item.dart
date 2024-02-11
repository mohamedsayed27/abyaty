import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/svg_path.dart';
import '../shared_widgets/custom_elevated_button.dart';
import '../shared_widgets/custom_sized_box.dart';

class OrderDetailsItem extends StatelessWidget {
  final String imagePath;
  final String counter;

  const OrderDetailsItem({
    super.key,
    required this.imagePath,
    required this.counter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(
          width: 1.w,
          color: AppColors.favoriteButtonBackgroundGreyColoColor,
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 8.h),
              blurRadius: 8.r,
              color: AppColors.shadowColor(opacity: 0.12))
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 64.w,
            height: 64.h,
            fit: BoxFit.contain,
          ),
          const CustomSizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Green Lemon",
                      style:
                          CustomThemes.greyColor1ATextTheme(context).copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 24.w,
                      height: 24.h,
                      child: IconButton(
                        onPressed: () {},
                        style: IconButton.styleFrom(padding: EdgeInsets.zero),
                        icon: SvgPicture.asset(
                          SvgPath.favorite,
                          width: 24.w,
                          height: 24.h,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  "99 SAR",
                  style: CustomThemes.darkColorTextTheme(context).copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "(1 Kg)",
                      style: CustomThemes.greyColor80TextTheme(context)
                          .copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColors.favoriteButtonBackgroundGreyColoColor,
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 5.h, horizontal: 8.5.w),
                      alignment: Alignment.center,
                      child: Text(
                        counter,
                        style:
                            CustomThemes.greyColo4DTextTheme(context).copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
