import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/assets_path/svg_path.dart';
import 'package:abyaty/core/constants/dummy_data.dart';
import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_app_bar.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:abyaty/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BlogsScreen extends StatelessWidget {
  const BlogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 63.h),
        child: const CustomAppBar(title: LocaleKeys.blog),
      ),
      body: Column(
        children: [
          const CustomSizedBox(height: 24,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.blog.tr(),
                style: CustomThemes.greyColor1ATextTheme(context).copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    SvgPath.upDownArrow,
                    height: 16.h,
                    width: 16.w,
                    colorFilter: const ColorFilter.mode(
                        AppColors.regularGreyTextColor, BlendMode.srcIn),
                  ),
                  const CustomSizedBox(
                    width: 16,
                  ),
                  SvgPicture.asset(
                    SvgPath.filterIcon,
                    height: 16.h,
                    width: 16.w,
                    colorFilter: const ColorFilter.mode(
                        AppColors.regularGreyTextColor, BlendMode.srcIn),
                  ),
                ],
              )
            ],
          ).symmetricPadding(horizontal: 16),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 24.h),
              itemBuilder: (_, index) =>
                  BlogWidget(image: DummyData.dummyBlogs[index]),
              separatorBuilder: (_, index) => const CustomSizedBox(
                height: 16,
              ),
              itemCount: DummyData.dummyBlogs.length,
            ),
          )
        ],
      ),
    );
  }
}

class BlogWidget extends StatelessWidget {
  final String image;

  const BlogWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 8.h),
            blurRadius: 32.r,
            color: AppColors.shadowColor()
          )
        ]
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 132.h,
            width: double.infinity,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "15 Oct, 2023",
                style: CustomThemes.greyColor99TextTheme(context).copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),

              CustomSizedBox(height: 8,),
              Text(
                "How to enhance your online shopping Experience ?",
                style: CustomThemes.greyColor1ATextTheme(context).copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ).symmetricPadding(horizontal: 16, vertical: 16)
        ],
      ),
    );
  }
}
