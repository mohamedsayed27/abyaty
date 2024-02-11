import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import 'add_review_container.dart';
import 'customers_comments.dart';
import 'review_rating_percentage.dart';

class ReviewsComponent extends StatefulWidget {
  const ReviewsComponent({super.key});

  @override
  State<ReviewsComponent> createState() => _ReviewsComponentState();
}

class _ReviewsComponentState extends State<ReviewsComponent> {
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(
        top: 10.h,
        bottom: 100.h,
        left: 16.w,
        right: 16.w,
      ),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Customer Reviews",
              style: CustomThemes.greyColo4DTextTheme(context).copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  size: 20.r,
                  color: AppColors.secondaryColor,
                ),
                Text(
                  "4.5",
                  textAlign: TextAlign.start,
                  style:
                      CustomThemes.greyColor80TextTheme(context).copyWith(
                    height: 1.h,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            )
          ],
        ),
        const CustomSizedBox(
          height: 16,
        ),
        const ReviewsRatingPercentage(),
        const CustomSizedBox(
          height: 24,
        ),
        Text(
          "Add A Review",
          style: CustomThemes.greyColo4DTextTheme(context).copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        const CustomSizedBox(
          height: 16,
        ),
        const AddReviewContainer(),
        const CustomSizedBox(
          height: 24,
        ),
        Text(
          "Customer Comments",
          style: CustomThemes.greyColo4DTextTheme(context).copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        const CustomSizedBox(
          height: 16,
        ),
        const CustomersComments(),
      ],
    );
  }
}
