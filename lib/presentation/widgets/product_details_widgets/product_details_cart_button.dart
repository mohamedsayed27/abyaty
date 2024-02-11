import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../bottom_sheets/cart_bottom_sheet/add_to_cart_bottom_sheet.dart';
import '../shared_widgets/add_to_cart_elevated_button.dart';

class ProductDetailsCartButton extends StatelessWidget {
  const ProductDetailsCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 100.h,
          width: double.infinity,
          color: AppColors.whiteColor.withOpacity(.72),
          // decoration: BoxDecoration(
          //   // color: AppColors.whiteColor.withOpacity(.72),
          //   boxShadow: [
          //     BoxShadow(
          //       offset: Offset.zero,
          //       color: AppColors.whiteColor.withOpacity(.72),
          //       spreadRadius: 32.r,
          //       blurRadius: 0.r
          //     )
          //   ]
          // ),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Center(
            child: AddToCartElevatedButton(
              cartIconWidth: 20,
              cartIconHeight: 20,
              cartIconColor: AppColors.whiteColor,
              height: 48,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.white,
                  useSafeArea: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.r),
                      topRight: Radius.circular(24.r),
                    ),
                  ),
                  showDragHandle: true,
                  isScrollControlled: true,
                  builder: (context) {
                    return const AddToCartBottomSheet();
                  },
                );
              },
              titleTheme:
              CustomThemes.whiteColoTextTheme(context).copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              backgroundColor: AppColors.primaryColor,
              foregroundColor: AppColors.whiteColor,
            ),
          ),
        ));
  }
}
