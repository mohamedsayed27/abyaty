import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/assets_path/images_path.dart';
import 'package:abyaty/core/assets_path/svg_path.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_elevated_button.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CarouselSliderContainer extends StatelessWidget {
  const CarouselSliderContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        gradient: const LinearGradient(
          begin: AlignmentDirectional.centerStart,
          end: AlignmentDirectional.centerEnd,
          colors: [
            AppColors.primaryColor,
            AppColors.carouselSecondaryGradientColor,
          ],
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Weekend Offer",
                      style: CustomThemes.whiteColoTextTheme(context).copyWith(
                          fontSize: 12.sp, fontWeight: FontWeight.w400),
                    ),
                    const CustomSizedBox(
                      width: 2,
                    ),
                    SvgPicture.asset(
                      SvgPath.fire,
                      width: 14.w,
                      height: 14.h,
                    )
                  ],
                ),
                const CustomSizedBox(
                  height: 12,
                ),
                Text(
                  "Premium Dry Fruits",
                  style: CustomThemes.whiteColoTextTheme(context)
                      .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
                const CustomSizedBox(
                  height: 4,
                ),
                Text(
                  "Get fresh fruits now and get 35% discount !",
                  style: CustomThemes.whiteColoTextTheme(context)
                      .copyWith(fontSize: 12.sp, fontWeight: FontWeight.w400),
                ),

                const CustomSizedBox(
                  height: 12,
                ),
                CustomElevatedButton(
                  borderRadius: 8,
                  onPressed: () {},
                  width: 91,
                  height: 32,
                  padding: EdgeInsets.zero,
                  elevation: 0,
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Shop Now",
                        style: CustomThemes.whiteColoTextTheme(context)
                            .copyWith(
                                fontSize: 12.sp, fontWeight: FontWeight.w400),
                      ),

                      const CustomSizedBox(
                        width: 8,
                      ),
                      Container(
                        height: 14.h,
                        width: 14.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 1.w,
                          ),
                        ),
                        child: Icon(Icons.arrow_forward_ios,size: 10.r,),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const CustomSizedBox(
            width: 13,
          ),
          CustomSizedBox(
            height: 121,
            width: 156,
            child: Image.asset(
              ImagesPath.carouselImage,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
