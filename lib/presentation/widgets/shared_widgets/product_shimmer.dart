import 'package:abyaty/core/app_router/screens_name.dart';
import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/assets_path/svg_path.dart';
import 'package:abyaty/core/constants/extensions.dart';
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

class ProductShimmerWidget extends StatelessWidget {
  final double? width;
  const ProductShimmerWidget({
    super.key,this.width,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ScreenName.productDetailsScreen);
      },
      splashColor: Colors.transparent,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        width: this.width,
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: Colors.white,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSizedBox(
              height: 80,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: CustomSizedBox(
                      height: 80,
                      width: 96,
                      child: CustomShimmer(),
                    ),
                  ),
                  PositionedDirectional(
                    start: 0,
                    top: 0,
                    child: Container(
                      height: 24.h,
                      width: 32.w,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.50),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: AppColors.secondaryColor,
                            size: 15.r,
                          ),
                          const CustomSizedBox(
                            width: 1,
                          ),

                      CustomSizedBox(
                        height: 10,
                        width: 10,
                        child: CustomShimmer(),
                      ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const CustomSizedBox(
              height: 16,
            ),
            CustomSizedBox(
              height: 10,
              width: 50,
              child: CustomShimmer(),
            ),
            const CustomSizedBox(
              height: 2,
            ),
            CustomSizedBox(
              height: 10,
              width: 100,
              child: CustomShimmer(),
            ),
            const CustomSizedBox(
              height: 8,
            ),
            // RichText(
            //   maxLines: 2,
            //   overflow: TextOverflow.ellipsis,
            //   text: WidgetSpan(child: CustomShimmer(),),
            // ),
            const CustomSizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomSizedBox(
                  height: 12,
                  width: 60,
                  child: CustomShimmer(),
                ),
                CustomSizedBox(
                  height: 12,
                  width: 30,
                  child: CustomShimmer(),
                ),
              ],
            ),
            Spacer(),
            CustomSizedBox(
              height: 24,
              width: double.infinity,
              child: CustomShimmer(),
            ),
            // CustomShimmer()
          ],
        ),
      ),
    );
  }
}
