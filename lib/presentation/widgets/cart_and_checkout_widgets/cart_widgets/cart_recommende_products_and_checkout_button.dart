import 'package:abyaty/core/app_router/screens_name.dart';
import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/assets_path/svg_path.dart';
import 'package:abyaty/core/constants/dummy_data.dart';
import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/presentation/widgets/cart_and_checkout_widgets/cart_checkout_appbar.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/primary_color_elevated_button.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/secondary_color_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/app_theme/custom_themes.dart';



class CartRecommendedProductsAndCheckoutButton extends StatelessWidget {
  const CartRecommendedProductsAndCheckoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: AppColors.recommendedProductsContainerBackgroundColor,
          padding:
          EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Recommended For You",
                style:
                CustomThemes.greyColo4DTextTheme(context).copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const CustomSizedBox(height: 16,),
              Row(
                children: [
                  Expanded(
                    flex:2,
                    child: SizedBox(
                      height: 56.h,
                      child: ListView.separated(
                          itemBuilder: (_, index) {
                            return Container(
                              height: 56.h,
                              width: 56.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius:
                                BorderRadius.circular(8.r),
                              ),
                              child: Center(
                                child: Image.asset(
                                  DummyData.topSellingProductsDummyList[
                                  index],
                                  height: 48.h,
                                  width: 48.w,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            );
                          },
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.zero,
                          separatorBuilder: (_, index) =>
                              SvgPicture.asset(
                                SvgPath.add,
                                height: 16.h,
                                width: 16.w,
                                colorFilter: const ColorFilter.mode(
                                    AppColors.blackColor,
                                    BlendMode.srcIn),
                              ).symmetricPadding(horizontal: 4),
                          itemCount: DummyData
                              .topSellingProductsDummyList.length),
                    ),
                  ),
                  const CustomSizedBox(
                    width: 16,
                  ),
                  Expanded(
                    flex:1,
                    child: Column(
                      children: [
                        Text(
                          "By 24.5 SAR",
                          style:
                          CustomThemes.primaryColorTextTheme(context)
                              .copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const CustomSizedBox(height: 8,),
                        SecondaryColorElevatedButton(
                          height: 32,
                          padding: EdgeInsets.zero,
                          onPressed: (){},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                SvgPath.cartNavIcon,
                                width: 16.w,
                                height: 16.h,
                                colorFilter: const ColorFilter.mode(
                                    AppColors.whiteColor, BlendMode.srcIn),
                              ),
                              const CustomSizedBox(width: 4,),
                              Text(
                                "Add To Cart",
                                style: CustomThemes.whiteColoTextTheme(context).copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        const CustomSizedBox(height: 40,),
        PrimaryColorElevatedButton(
          text: "Checkout",
          onPressed: (){
            Navigator.pushNamed(context, ScreenName.checkoutScreen);
          },
        ).symmetricPadding(horizontal: 16),
        const CustomSizedBox(height: 40,)
      ],
    );
  }
}
