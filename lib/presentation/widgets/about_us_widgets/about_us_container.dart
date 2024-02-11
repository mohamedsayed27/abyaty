import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';



class AboutUsContainer extends StatelessWidget {
  final String iconPath;
  final String title;
  final Color borderColor;

  const AboutUsContainer({
    super.key,
    required this.iconPath,
    required this.borderColor,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88.h,
      padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 8.h),
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          SvgPicture.asset(
            iconPath,
            height: 36.h,
            width: 36.w,
          ),
          const CustomSizedBox(
            height: 8,
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: CustomThemes.greyColor1ATextTheme(context)
                  .copyWith(fontSize: 12.sp, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}