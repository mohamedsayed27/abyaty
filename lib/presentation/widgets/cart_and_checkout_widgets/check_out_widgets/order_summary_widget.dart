import 'package:abyaty/core/assets_path/svg_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/app_theme/custom_themes.dart';
import '../../../../core/constants/dummy_data.dart';
import '../../shared_widgets/custom_sized_box.dart';


class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({super.key});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Order Summary ",
                style: CustomThemes.greyColo4DTextTheme(context).copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "( ${DummyData.topSellingProductsDummyList.length} items )",
                style: CustomThemes.greyColo4DTextTheme(context).copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const CustomSizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: SizedBox(
                  height: 84.h,
                  child: ListView.separated(
                      itemBuilder: (_, index) {
                        return Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(left: 8.w,right: 8.w, top: 4.h),
                          decoration: BoxDecoration(
                            color: AppColors.lightBlueBackgroundColor,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                DummyData.topSellingProductsDummyList[index],
                                height: 32.h,
                                width: 32.w,
                                fit: BoxFit.contain,
                              ),
                              Text(
                                "${index+1}",
                                style: CustomThemes.greyColo4DTextTheme(context).copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "10$index SAR",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomThemes.darkColorTextTheme(context).copyWith(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.zero,
                      separatorBuilder: (_, index) => const CustomSizedBox(
                        width: 8,
                      ),
                      itemCount:
                      DummyData.topSellingProductsDummyList.length),
                ),
              ),
              const CustomSizedBox(
                width: 16,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 80.h,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: 12.h,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      8.r,
                    ),
                    border: Border.all(color: AppColors.greenColor,),
                    color: AppColors.cartNumberOfProductsContainerBackgroundColor,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(SvgPath.moneys,width: 16.w,height: 16.h,),
                          const CustomSizedBox(width: 4,),
                          Text(
                            "Total",
                            style: CustomThemes.greenTextColorTheme(context).copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Text(
                          "615",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: CustomThemes.greenTextColorTheme(context).copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
