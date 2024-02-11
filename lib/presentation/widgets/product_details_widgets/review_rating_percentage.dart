import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/app_colors.dart';
import 'rating_details_item.dart';

class ReviewsRatingPercentage extends StatelessWidget {
  const ReviewsRatingPercentage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 8.h),
            blurRadius: 32.r,
            color: AppColors.shadowColor(),
          )
        ],
      ),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RatingDetailsItem(
            starRate: 5,
            ratePercentage: 75,
          ),
          RatingDetailsItem(
            starRate: 4,
            ratePercentage: 65,
          ),
          RatingDetailsItem(
            starRate: 3,
            ratePercentage: 85,
          ),
          RatingDetailsItem(
            starRate: 2,
            ratePercentage: 50,
          ),
          RatingDetailsItem(
            starRate: 1,
            ratePercentage: 20,
          ),
        ],
      ),
    );
  }
}
