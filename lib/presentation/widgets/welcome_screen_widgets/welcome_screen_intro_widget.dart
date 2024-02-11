import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/assets_path/images_path.dart';
import '../../../core/assets_path/svg_path.dart';
import '../shared_widgets/custom_sized_box.dart';

class WelcomeScreenIntroWidget extends StatelessWidget {
  const WelcomeScreenIntroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomSizedBox(
          height: 320,
          width: double.infinity,
          child: Image.asset(
            ImagesPath.welcomeScreenImage,
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.whiteColor.withOpacity(.89),
                  AppColors.blackColor.withOpacity(.64),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 120.h,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                SvgPath.logo,
                height: 96.h,
                width: 96.w,
              ),
              const CustomSizedBox(
                height: 16,
              ),
              Text(
                "Abyati Stores",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(fontSize: 20.sp),
              ),
            ],
          ),
        )
      ],
    );
  }
}
