import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/custom_themes.dart';
import 'custom_sized_box.dart';

class RatingBarWidget extends StatefulWidget {
  const RatingBarWidget({super.key});

  @override
  State<RatingBarWidget> createState() => _RatingBarWidgetState();
}

class _RatingBarWidgetState extends State<RatingBarWidget> {
  RangeValues values = const RangeValues(10, 10000);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Price Range",
          style: CustomThemes.greyColor99TextTheme(context)
              .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
        ),
        const CustomSizedBox(
          height: 8,
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            border: Border.all(color: AppColors.authHintTextColor),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: RangeSlider(
            values: values,
            labels: RangeLabels(
                "${values.start.round()} SAR", "${values.end.round()} SAR"),
            min: 5,
            divisions: 10000,
            max: 10000,
            inactiveColor: AppColors.inActiveSliderColor,
            activeColor: AppColors.primaryColor,
            onChanged: (value) {
              setState(() {
                values = value;
              });
            },
          ),
        )
      ],
    );
  }
}
