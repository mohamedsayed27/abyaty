import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/assets_path/svg_path.dart';
import '../shared_widgets/custom_sized_box.dart';

class RatingDetailsItem extends StatelessWidget {
  final double starRate;
  final double ratePercentage;

  const RatingDetailsItem({
    super.key,
    required this.starRate,
    required this.ratePercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar.builder(
          initialRating: starRate,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemSize: 18.r,
          ignoreGestures: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 1.0.w),
          itemBuilder: (context, index) => SvgPicture.asset(
            index > starRate - 1 ? SvgPath.star : SvgPath.boldStar,
            colorFilter: const ColorFilter.mode(
                AppColors.secondaryColor, BlendMode.srcIn),
            height: 16.h,
            width: 16.w,
          ),
          onRatingUpdate: (rating) {
          },
        ),
        const CustomSizedBox(
          width: 24,
        ),
        Expanded(
          child: Container(
            height: 16.h,
            decoration: BoxDecoration(
              color: AppColors.favoriteButtonBackgroundGreyColoColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            alignment: AlignmentDirectional.centerStart,
            child: FractionallySizedBox(
              widthFactor: ratePercentage / 100,
              heightFactor: 1,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 1.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  gradient: const LinearGradient(
                    begin: AlignmentDirectional.centerStart,
                    end: AlignmentDirectional.centerEnd,
                    colors: [
                      AppColors.ratingBarFirstGradientColor,
                      AppColors.ratingBarSecondGradientColor,
                    ],
                  ),
                ),
                child: Text(
                  "${ratePercentage.round()} %",
                  style: CustomThemes.whiteColoTextTheme(context)
                      .copyWith(fontSize: 10.sp, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
