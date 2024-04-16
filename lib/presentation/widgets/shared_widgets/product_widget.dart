import 'package:abyaty/core/app_router/screens_name.dart';
import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/assets_path/svg_path.dart';
import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/domain/entities/product_entity/product_details_details_entity.dart';
import 'package:abyaty/presentation/buisness_logic/product_cubit/product_cubit.dart';
import 'package:abyaty/presentation/widgets/bottom_sheets/cart_bottom_sheet/add_to_cart_bottom_sheet.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/cached_network_image_widget.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_elevated_button.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../domain/entities/product_entity/product_entity.dart';
import 'add_to_cart_elevated_button.dart';

class ProductWidget extends StatelessWidget {
  final ProductEntity productEntity;
  final double? width;
  final void Function()? onTap;
  const ProductWidget({
    super.key,
    required this.productEntity, this.width, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
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
                      child: CachedNetworkImageWidget(imageUrl: productEntity.photo!),
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
                          Text(
                            "5",
                            textAlign: TextAlign.center,
                            style: CustomThemes.whiteColoTextTheme(context)
                                .copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  PositionedDirectional(
                    end: 0,
                    top: 0,
                    child: CustomElevatedButton(
                      borderRadius: 8,
                      height: width > 380 ? 24 : 27,
                      padding: EdgeInsets.zero,
                      width: 24,
                      backgroundColor:
                          AppColors.favoriteButtonBackgroundGreyColoColor,
                      onPressed: () {},
                      foregroundColor: Colors.red,
                      child: SvgPicture.asset(
                        true ? SvgPath.filledFavorite : SvgPath.favorite,
                        height: 16.h,
                        width: 16.w,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const CustomSizedBox(
              height: 8,
            ),
            Expanded(
              child: Text(
                productEntity.name??"",
                textAlign: TextAlign.start,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: CustomThemes.greyColor80TextTheme(context).copyWith(
                  fontSize: 14.sp,
                  height: 1.2.h,
                  fontWeight: FontWeight.w400,
                ),
              ).onlyDirectionalPadding(end: 10),
            ),
            const CustomSizedBox(
              height: 8,
            ),
            RichText(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                  text: "${productEntity.discountPrice}  ",
                  style: CustomThemes.darkColorTextTheme(context).copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w800,
                  ),
                  children: [
                    if(productEntity.discountPrice!=productEntity.beforeDiscountPrice)TextSpan(
                      text: "${productEntity.beforeDiscountPrice}",
                      style: CustomThemes.greyColor80TextTheme(context)
                          .copyWith(
                        decoration: TextDecoration.lineThrough,
                        decorationColor: AppColors.regularGreyTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    )
                  ]),
            ),
            const CustomSizedBox(
              height: 16,
            ),
            Align(
              alignment: Alignment.center,
              child: AddToCartElevatedButton(
                cartIconWidth: 14,
                cartIconHeight: 14,
                cartIconColor: AppColors.primaryColor,
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
                    CustomThemes.primaryColorTextTheme(context).copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
                height: 32,
                backgroundColor: AppColors.lightBlueBackgroundColor,
                foregroundColor: AppColors.primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
