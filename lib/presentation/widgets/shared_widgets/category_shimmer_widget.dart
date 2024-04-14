import 'package:abyaty/core/app_router/screens_name.dart';
import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/assets_path/svg_path.dart';
import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/core/constants/route_exports.dart';
import 'package:abyaty/domain/entities/product_entity/product_details_details_entity.dart';
import 'package:abyaty/presentation/widgets/bottom_sheets/cart_bottom_sheet/add_to_cart_bottom_sheet.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/cached_network_image_widget.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_elevated_button.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_shimmer.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../domain/entities/product_entity/product_entity.dart';
import 'add_to_cart_elevated_button.dart';
import 'dart:math';

import 'package:abyaty/core/constants/dummy_data.dart';
import 'package:abyaty/core/constants/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../buisness_logic/product_cubit/product_cubit.dart';
import '../../buisness_logic/product_cubit/product_state.dart';
import '../../screens/shop_screen/category_details_screen.dart';
import '../shared_widgets/category_item_widget.dart';

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
