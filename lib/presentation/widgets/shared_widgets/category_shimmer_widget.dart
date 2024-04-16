
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/app_colors.dart';
import 'custom_shimmer.dart';
import 'custom_sized_box.dart';




class CategoriesShimmerGridViewComponent extends StatefulWidget {

  const CategoriesShimmerGridViewComponent({super.key});

  @override
  State<CategoriesShimmerGridViewComponent> createState() =>
      _CategoriesShimmerGridViewComponentState();
}

class _CategoriesShimmerGridViewComponentState
    extends State<CategoriesShimmerGridViewComponent> {
  List<Color> itemsColor = [
    AppColors.firstDummyColor,
    AppColors.secondDummyColor,
    AppColors.thirdDummyColor,
    AppColors.fourthDummyColor,
    AppColors.fifthDummyColor,
    AppColors.sixthDummyColor,
    AppColors.seventhDummyColor,
    AppColors.eightsDummyColor,
    AppColors.ninthDummyColor,
  ];


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.87,
        crossAxisSpacing: 15.5.w,
        mainAxisSpacing: 16.h,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            color: (itemsColor..shuffle()).first,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                offset: Offset(0, 8.h),
                blurRadius: 32.r,
              ),
            ],
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                height: 56,
                width: 56,
                child: const CustomShimmer(),
              ),
              const CustomSizedBox(
                height: 16,
              ),
              const CustomSizedBox(
                height: 12,
                width: 50,
                child: CustomShimmer(),
              ),
            ],
          ),
        );
      },
    );
  }
}
