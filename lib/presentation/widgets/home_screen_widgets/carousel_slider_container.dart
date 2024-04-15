import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/svg_path.dart';
import '../../../domain/entities/sliders/slider_details_entity.dart';
import '../shared_widgets/cached_network_image_widget.dart';
import '../shared_widgets/custom_elevated_button.dart';
import '../shared_widgets/custom_sized_box.dart';

class CarouselSliderContainer extends StatelessWidget {
  final SliderDetailsEntity sliderDetailsEntity;

  const CarouselSliderContainer({
    super.key,
    required this.sliderDetailsEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
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
                  sliderDetailsEntity.title ?? "",
                  style: CustomThemes.whiteColoTextTheme(context).copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const CustomSizedBox(
                  height: 4,
                ),
                Text(
                  sliderDetailsEntity.details ?? "",
                  style: CustomThemes.whiteColoTextTheme(context).copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
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
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 10.r,
                        ),
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
            child: CachedNetworkImageWidget(
              imageUrl: sliderDetailsEntity.photo!,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
