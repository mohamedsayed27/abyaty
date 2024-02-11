import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';

class OrdersTabBarWidget extends StatelessWidget {
  final TabController tabController;

  const OrdersTabBarWidget({
    super.key,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 8.h),
            color: AppColors.shadowColor(),
            blurRadius: 32.r
          )
        ]
      ),
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        labelPadding: EdgeInsets.symmetric(horizontal: 11.w),
        dividerColor: Colors.transparent,
        labelStyle: CustomThemes.whiteColoTextTheme(context).copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        unselectedLabelStyle: CustomThemes.greyColor99TextTheme(context).copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        labelColor: AppColors.whiteColor,
        unselectedLabelColor: AppColors.greyTextColor,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          color: AppColors.secondaryColor,
        ),
        tabs: const [
          Tab(
            text: "Delivered Orders",
          ),
          Tab(
            text: "In Progress Orders",
          ),
        ],
        controller: tabController,
      ),
    );
  }
}