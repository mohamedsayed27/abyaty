import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_shimmer.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/products_shimmer_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/app_colors.dart';
import '../cart_and_checkout_widgets/cart_button.dart';
import '../shared_widgets/home_divider_widget.dart';

class ProductDetailsShimmer extends StatelessWidget {
  const ProductDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              const CustomSizedBox(
                height: 300,
                width: double.infinity,
                child: CustomShimmer(),
              ),
              PositionedDirectional(
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  leading: BackButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: AppColors.grey4D,
                  ),
                  actions: [
                    CartButton(
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
          const CustomSizedBox(
            height: 16,
          ),
          const CustomSizedBox(
            height: 20,
            width: 150,
            child: CustomShimmer(),
          ).onlyDirectionalPadding(start: 16),
          const CustomSizedBox(
            height: 16,
          ),
          const CustomSizedBox(
            height: 10,
            width: 100,
            child: CustomShimmer(),
          ).onlyDirectionalPadding(start: 16),
      
          const CustomSizedBox(
            height: 16,
          ),
          Container(
            height: 56,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            margin: EdgeInsets.symmetric(
              horizontal: 16.w,
            ),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: AppColors.authHintTextColor,
                width: 1.w,
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomSizedBox(
                  height: 50,
                  width: 100,
                  child: CustomShimmer(),
                ),
                CustomSizedBox(
                  height: 50,
                  width: 100,
                  child: CustomShimmer(),
                ),
                CustomSizedBox(
                  height: 50,
                  width: 100,
                  child: CustomShimmer(),
                )
              ],
            ),
          ),
          const CustomSizedBox(
            height: 16,
          ),
          const CustomSizedBox(
            height: 20,
            width: 100,
            child: CustomShimmer(),
          ).onlyDirectionalPadding(start: 16),
          const CustomSizedBox(
            height: 8,
          ),
          const CustomSizedBox(
            height: 10,
            width: double.infinity,
            child: CustomShimmer(),
          ).symmetricPadding(horizontal: 16),
          const CustomSizedBox(
            height: 4,
          ),
          const CustomSizedBox(
            height: 10,
            width: 300,
            child: CustomShimmer(),
          ).symmetricPadding(horizontal: 16),
          const CustomSizedBox(
            height: 4,
          ),
          const CustomSizedBox(
            height: 10,
            width: 300,
            child: CustomShimmer(),
          ).symmetricPadding(horizontal: 16),
          const CustomSizedBox(
            height: 4,
          ),
          const CustomSizedBox(
            height: 10,
            width: double.infinity,
            child: CustomShimmer(),
          ).symmetricPadding(horizontal: 16),
          const CustomSizedBox(
            height: 4,
          ),
          const CustomSizedBox(
            height: 10,
            width: double.infinity,
            child: CustomShimmer(),
          ).symmetricPadding(horizontal: 16),
          const CustomSizedBox(
            height: 4,
          ),
          const CustomSizedBox(
            height: 10,
            width: double.infinity,
            child: CustomShimmer(),
          ).symmetricPadding(horizontal: 16),
          const CustomSizedBox(height: 16),
          const CustomDividerWidget(),
          const CustomSizedBox(
            height: 16,
          ),
          const CustomSizedBox(
            height: 20,
            width: 120,
            child: CustomShimmer(),
          ).onlyDirectionalPadding(start: 16),
          CategoryProductsShimmerGridComponent(length: 2),
        ],
      ),
    );
  }
}
