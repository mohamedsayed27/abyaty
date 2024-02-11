import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/assets_path/images_path.dart';
import 'package:abyaty/core/constants/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlogWidget extends StatelessWidget {
  const BlogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      width: 253.w,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Positioned.fill(
            child: Image.asset(ImagesPath.homeBlogDummyImage,fit: BoxFit.cover,),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.48),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "First Part Of The Blog Body, Second Line ..." * 2,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: CustomThemes.whiteColoTextTheme(context).copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "Category",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: CustomThemes.secondaryColorTextTheme(context).copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ).symmetricPadding(horizontal: 12,vertical: 12)
        ],
      ),
    );
  }
}
