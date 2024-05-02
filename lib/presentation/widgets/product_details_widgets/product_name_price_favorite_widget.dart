import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/core/constants/route_exports.dart';
import 'package:abyaty/domain/entities/product_entity/product_details_details_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/svg_path.dart';

class ProductNameAndPriceAndFavoriteWidget extends StatelessWidget {
  final ProductDetailsEntity productDetailsEntity;
  const ProductNameAndPriceAndFavoriteWidget({super.key, required this.productDetailsEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: "${productDetailsEntity.name} ",
                  style: CustomThemes.greyColor1ATextTheme(context)
                      .copyWith(
                      fontSize: 20.sp, fontWeight: FontWeight.w600),
                  children: const [
                    // TextSpan(
                    //   text: "(${productDetailsEntity.})",
                    //   style: CustomThemes.greyColor80TextTheme(context)
                    //       .copyWith(
                    //     fontSize: 16.sp,
                    //     fontWeight: FontWeight.w400,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                SvgPath.favorite,
                width: 24.w,
                height: 24.h,
              ),
            ),
          ],
        ).onlyDirectionalPadding(start: 16, end: 4),
        RichText(
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            text: "${productDetailsEntity.discountPrice} ",
            style: CustomThemes.darkColorTextTheme(context).copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w800,
            ),
            children: [
              if(productDetailsEntity.discountPrice!=productDetailsEntity.beforeDiscountPrice)TextSpan(
                text: "${productDetailsEntity.beforeDiscountPrice} ",
                style: CustomThemes.greyColor80TextTheme(context)
                    .copyWith(
                  decoration: TextDecoration.lineThrough,
                  decorationColor: AppColors.regularGreyTextColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w800,
                ),
              )
            ],
          ),
        ).onlyDirectionalPadding(start: 16)
      ],
    );
  }
}
