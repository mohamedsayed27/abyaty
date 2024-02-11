import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/presentation/widgets/cart_and_checkout_widgets/check_out_widgets/promo_code_text_field.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/app_theme/custom_themes.dart';
import '../../shared_widgets/custom_sized_box.dart';

class CostSummaryContainer extends StatelessWidget {
  const CostSummaryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
            color: AppColors.shadowColor(),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cost Summary",
            style: CustomThemes.greyColo4DTextTheme(context).copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          const CustomSizedBox(
            height: 16,
          ),
          const PromoCodeTextField(),
          const CustomSizedBox(
            height: 24,
          ),
          const CostDetailsAndPriceWidget(
            title: "Sub Total",
            price: "218.35 SAR",
          ),
          const CustomSizedBox(
            height: 16,
          ),
          const CostDetailsAndPriceWidget(
            title: "Delivery",
            price: "5 SAR",
          ),
          const CustomSizedBox(
            height: 16,
          ),
          const CostDetailsAndPriceWidget(
            title: "Discount",
            price: "2 SAR",
          ),
        ],
      ),
    );
  }
}

class CostDetailsAndPriceWidget extends StatelessWidget {
  final String title;
  final String price;

  const CostDetailsAndPriceWidget({
    super.key,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: CustomThemes.greyColor80TextTheme(context)
              .copyWith(fontWeight: FontWeight.w400, fontSize: 16.sp),
        ),
        Text(
          price,
          style: CustomThemes.greyColor1ATextTheme(context)
              .copyWith(fontWeight: FontWeight.w600, fontSize: 16.sp),
        ),
      ],
    );
  }
}
