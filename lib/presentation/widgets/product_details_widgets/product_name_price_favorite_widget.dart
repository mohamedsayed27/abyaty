import 'package:abyaty/core/constants/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/svg_path.dart';

class ProductNameAndPriceAndFavoriteWidget extends StatelessWidget {
  const ProductNameAndPriceAndFavoriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                text: "Green Lemon ",
                style: CustomThemes.greyColor1ATextTheme(context)
                    .copyWith(
                    fontSize: 20.sp, fontWeight: FontWeight.w600),
                children: [
                  TextSpan(
                    text: "(1Kg)",
                    style: CustomThemes.greyColor80TextTheme(context)
                        .copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
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
            text: "90 SAR ",
            style: CustomThemes.darkColorTextTheme(context).copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w800,
            ),
            children: [
              TextSpan(
                text: "100 SAR ",
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
