import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/constants/dummy_data.dart';
import 'package:abyaty/core/constants/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../orders_widgets/order_details_item.dart';
import '../../shared_widgets/custom_sized_box.dart';

class OrderDetailsBottomSheet extends StatelessWidget {
  const OrderDetailsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Order Details",
                    style:
                        CustomThemes.greyColor1ATextTheme(context).copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    "1234",
                    style: CustomThemes.primaryColorTextTheme(context).copyWith(
                      fontWeight: FontWeight.w400,
                      decorationColor: AppColors.primaryColor,
                      decoration: TextDecoration.underline,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ).symmetricPadding(horizontal: 16),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 24.h,
                ),
                shrinkWrap: true,
                itemBuilder: (_, index) => OrderDetailsItem(
                  imagePath: DummyData.topSellingProductsDummyList[index],
                  counter: (index+2).toString(),
                ),
                separatorBuilder: (_, index) => const CustomSizedBox(
                  height: 16,
                ),
                itemCount: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
