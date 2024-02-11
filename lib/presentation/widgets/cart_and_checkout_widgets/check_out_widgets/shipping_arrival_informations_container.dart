import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/assets_path/images_path.dart';
import 'package:abyaty/core/assets_path/svg_path.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShippingArrivalInformationContainer extends StatelessWidget {
  const ShippingArrivalInformationContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.lightBlueBackgroundColor,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            SvgPath.shipping,
            width: 40.w,
            height: 40.h,
          ),
          const CustomSizedBox(width: 16,),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: CustomThemes.greyColor80TextTheme(context).copyWith(
                  fontSize: 16.sp,
                  height: 0,
                  fontWeight: FontWeight.w400,
                ),
                text: "Your product will be shipped to your selected address",
                children: [
                  TextSpan(
                    text: " Home",
                    style:
                        CustomThemes.greyColor1ATextTheme(context).copyWith(
                      fontSize: 16.sp,
                      height: 0,
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        text: " after about :",
                        style: CustomThemes.greyColor80TextTheme(context)
                            .copyWith(
                          fontSize: 16.sp,
                          height: 0,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: " 14 Hours : 30 Minutes",
                            style:
                                CustomThemes.greyColor1ATextTheme(context)
                                    .copyWith(
                              fontSize: 16.sp,
                                  height: 0,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
