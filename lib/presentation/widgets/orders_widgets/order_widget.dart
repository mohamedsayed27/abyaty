import 'package:abyaty/core/app_router/screens_name.dart';
import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/assets_path/svg_path.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_outlined_button.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../bottom_sheets/order_details_bottom_sheet/order_details_bottom_sheet.dart';

class OrderWidget extends StatelessWidget {
  final bool isDelivered;
  final bool trackOrderWidget;

  const OrderWidget({
    super.key,
    this.isDelivered = true,
    this.trackOrderWidget = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 8.h),
              color: AppColors.shadowColor(),
              blurRadius: 32.r),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Order Id : #1234",
                style: CustomThemes.greyColor1ATextTheme(context).copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
              ),
              Text(
                "200 SAR",
                style: CustomThemes.primaryColorTextTheme(context).copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const CustomSizedBox(
            height: 12,
          ),
          DataWidget(
            imagePath: SvgPath.moreBox,
            title: "3 Items",
            titleStyle: CustomThemes.greyColo4DTextTheme(context).copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          const CustomSizedBox(
            height: 12,
          ),
          DataWidget(
            imagePath: SvgPath.calendar,
            title: !trackOrderWidget ? "12 Oct 2023" : "In progress",
            titleStyle: !trackOrderWidget
                ? CustomThemes.greyColo4DTextTheme(context).copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  )
                : CustomThemes.secondaryColorTextTheme(context).copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
          ),
          const CustomSizedBox(
            height: 12,
          ),
          if (isDelivered)
            CustomOutlinedButton(
              height: 48,
              borderColor: AppColors.grey4D,
              borderRadius: 8,
              foregroundColor: AppColors.grey4D,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) => const OrderDetailsBottomSheet(),
                  isScrollControlled: true,
                  useSafeArea: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.r),
                      topRight: Radius.circular(24.r),
                    ),
                  ),
                  showDragHandle: true,
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    SvgPath.moreBox,
                    colorFilter: const ColorFilter.mode(
                        AppColors.grey4D, BlendMode.srcIn),
                    width: 16.w,
                    height: 16.h,
                  ),
                  const CustomSizedBox(
                    width: 4,
                  ),
                  Text(
                    "Order Details",
                    style: CustomThemes.greyColo4DTextTheme(context).copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          if (!isDelivered)
            Row(
              children: [
                Expanded(
                  child: CustomOutlinedButton(
                    height: 48,
                    borderColor: AppColors.grey4D,
                    borderRadius: 8,
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (_) => const OrderDetailsBottomSheet(),
                        isScrollControlled: true,
                        useSafeArea: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24.r),
                            topRight: Radius.circular(24.r),
                          ),
                        ),
                        showDragHandle: true,
                      );
                    },
                    padding: EdgeInsets.zero,
                    foregroundColor: AppColors.grey4D,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          SvgPath.moreBox,
                          colorFilter: const ColorFilter.mode(
                              AppColors.grey4D, BlendMode.srcIn),
                          width: 16.w,
                          height: 16.h,
                        ),
                        const CustomSizedBox(
                          width: 4,
                        ),
                        Text(
                          "Order Details",
                          style: CustomThemes.greyColo4DTextTheme(context)
                              .copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const CustomSizedBox(
                  width: 15,
                ),
                Expanded(
                  child: CustomOutlinedButton(
                    height: 48,
                    borderColor: AppColors.primaryColor,
                    borderRadius: 8,
                    foregroundColor: AppColors.primaryColor,
                    onPressed: () {
                      Navigator.pushNamed(
                          context, ScreenName.trackYourOrderScreen);
                    },
                    padding: EdgeInsets.zero,
                    text: "Track Your Order",
                    style: CustomThemes.primaryColorTextTheme(context).copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
