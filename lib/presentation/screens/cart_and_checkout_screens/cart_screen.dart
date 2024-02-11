import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/assets_path/fonts_path.dart';
import 'package:abyaty/core/constants/dummy_data.dart';
import 'package:abyaty/presentation/widgets/cart_and_checkout_widgets/cart_checkout_appbar.dart';
import 'package:abyaty/presentation/widgets/cart_and_checkout_widgets/cart_widgets/cart_item.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:abyaty/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/cart_and_checkout_widgets/cart_widgets/cart_recommende_products_and_checkout_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 63.h),
        child: const CartAndCheckoutAppBar(
          title: LocaleKeys.myCart,
        ),
      ),
      body: Column(
        children: [
          const CustomSizedBox(height: 24,),
          Container(
            height: 40.h,
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: 16.w,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                16.r,
              ),
              color: AppColors.cartNumberOfProductsContainerBackgroundColor,
            ),
            child: Text(
              "${LocaleKeys.youHave.tr()} 3 ${LocaleKeys.itemsInYouCart.tr()}",
              style: CustomThemes.greenTextColorTheme(context).copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (_, index) => CartProductItem(
                image: DummyData.topSellingProductsDummyList[index],
              ),
              padding: EdgeInsets.symmetric(vertical: 24.h,horizontal: 16.w),
              separatorBuilder: (_, index) => const CustomSizedBox(height: 16),
              itemCount: DummyData.topSellingProductsDummyList.length,
            ),
          ),
          const CartRecommendedProductsAndCheckoutButton(),
        ],
      ),
    );
  }
}
