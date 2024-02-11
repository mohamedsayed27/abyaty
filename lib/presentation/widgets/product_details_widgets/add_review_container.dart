import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/svg_path.dart';
import '../shared_widgets/custom_elevated_button.dart';
import '../shared_widgets/custom_sized_box.dart';

class AddReviewContainer extends StatefulWidget {
  const AddReviewContainer({super.key});

  @override
  State<AddReviewContainer> createState() => _AddReviewContainerState();
}

class _AddReviewContainerState extends State<AddReviewContainer> {
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 180.h,
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
      child: Column(
        children: [
          RatingBar.builder(
            initialRating: rating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: false,
            // itemSize: 28.r,
            ignoreGestures: false,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 8.w),
            itemBuilder: (context, index) => SvgPicture.asset(
              index > rating - 1 ? SvgPath.star : SvgPath.boldStar,
              colorFilter: const ColorFilter.mode(
                  AppColors.secondaryColor, BlendMode.srcIn),
              height: 40.h,
              width: 40.w,
            ),
            onRatingUpdate: (rating) {
              setState(() {
                this.rating = rating;
              });
            },
          ),
          const CustomSizedBox(
            height: 16,
          ),
          SizedBox(
            height: 80.h,
            child: TextFormField(
              minLines: null,
              maxLines: null,
              expands: true,
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.top,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(
                    color: AppColors.authHintTextColor,
                    width: 1.w,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(
                    color: AppColors.authHintTextColor,
                    width: 1.w,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(
                    color: AppColors.authHintTextColor,
                    width: 1.w,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(
                    color: AppColors.primaryColor,
                    width: 1.w,
                  ),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                hintText: "Your Comment ...",
                hintStyle: CustomThemes.greyColor80TextTheme(context)
                    .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400),
              ),
            ),
          ),
          const CustomSizedBox(
            height: 16,
          ),
          CustomElevatedButton(
            borderRadius: 8,
            backgroundColor: AppColors.lightBlueBackgroundColor,
            foregroundColor: AppColors.primaryColor,
            onPressed: () {},
            elevation: 0,
            padding: EdgeInsets.all(16.r),
            height: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  SvgPath.add,
                  height: 16.h,
                  width: 16.w,
                  colorFilter:
                      const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
                ),
                const CustomSizedBox(
                  width: 2,
                ),
                Text(
                  "Submit Review",
                  style: CustomThemes.primaryColorTextTheme(context)
                      .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
