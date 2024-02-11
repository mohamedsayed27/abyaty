import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/assets_path/images_path.dart';
import 'package:abyaty/core/assets_path/svg_path.dart';
import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../widgets/about_us_widgets/section_title_widget.dart';

class OurCreativeTeamComponent extends StatelessWidget {
  const OurCreativeTeamComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitleWidget(title: "Our Creative Team").onlyDirectionalPadding(start: 16),
        const CustomSizedBox(
          height: 16,
        ),
        Text(
          "Abayti Team Members",
          style: CustomThemes.greyColor1ATextTheme(context)
              .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ).onlyDirectionalPadding(start: 16),
        CustomSizedBox(
          height: 170,
          child: ListView.separated(
              padding: EdgeInsets.only(
                top: 16.h,
                bottom: 24.h,
                left: 16.w,
                right: 16.w,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return Container(
                  width: 100.w,
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 4.h),
                        color: AppColors.shadowColor(),
                        blurRadius: 24.r,
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(ImagesPath.team1,height: 48.h,width: 48.w,),
                      Text(
                        "Team$index",
                        style: CustomThemes.greyColo4DTextTheme(context)
                            .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Developer $index",
                        style: CustomThemes.greyColor80TextTheme(context)
                            .copyWith(fontSize: 12.sp, fontWeight: FontWeight.w500),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(SvgPath.be1,height: 16.h,width: 16.w,),
                          SvgPicture.asset(SvgPath.be2,height: 16.h,width: 16.w,),
                        ],
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (_, index) {
                return const CustomSizedBox(
                  width: 16,
                );
              },
              itemCount: 5),
        ),
      ],
    );
  }
}
