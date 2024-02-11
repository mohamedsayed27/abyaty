import 'package:abyaty/core/constants/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/app_theme/custom_themes.dart';
import '../../drop_down_buttons/category_drop_down_button.dart';
import '../../drop_down_buttons/discount_drop_down_button.dart';
import '../../drop_down_buttons/pack_size_drop_down_button.dart';
import '../../drop_down_buttons/rating_drop_down_button.dart';
import '../../shared_widgets/custom_sized_box.dart';
import '../../shared_widgets/custom_text_button.dart';
import '../../shared_widgets/primary_color_elevated_button.dart';
import '../../shared_widgets/rating_bar_widget.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Filter",
                    style:
                        CustomThemes.greyColor1ATextTheme(context).copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CustomTextButton(
                    onPressed: () {},
                    child: Text(
                      "Reset Filter",
                      style: CustomThemes.primaryColorTextTheme(context)
                          .copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),
              Text(
                "Category",
                style: CustomThemes.greyColor99TextTheme(context).copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const CustomSizedBox(
                height: 8,
              ),
              const CategoryDropDownButton(),
              const CustomSizedBox(
                height: 20,
              ),
              Text(
                "Sub Category",
                style: CustomThemes.greyColor99TextTheme(context).copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const CustomSizedBox(
                height: 8,
              ),
              const CategoryDropDownButton(),
              const CustomSizedBox(
                height: 20,
              ),
              const RatingBarWidget(),
              const CustomSizedBox(
                height: 20,
              ),
              Text(
                "Rating",
                style: CustomThemes.greyColor99TextTheme(context).copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const CustomSizedBox(
                height: 8,
              ),
              const RatingDropDownButton(),
              const CustomSizedBox(
                height: 20,
              ),
              Text(
                "Discount",
                style: CustomThemes.greyColor99TextTheme(context).copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const CustomSizedBox(
                height: 8,
              ),
              const DiscountDropDownButton(),
              const CustomSizedBox(
                height: 20,
              ),
              Text(
                "Pack Size",
                style: CustomThemes.greyColor99TextTheme(context).copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const CustomSizedBox(
                height: 8,
              ),
              const PackSizeDropDownButton(),
              const CustomSizedBox(height: 40,),
              PrimaryColorElevatedButton(
                text: "Apply",
                onPressed: (){},
              ),
              const CustomSizedBox(height: 24,),
            ],
          ).symmetricPadding(horizontal: 16),
        ),
      ),
    );
  }
}
