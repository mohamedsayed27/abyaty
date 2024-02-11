import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DataWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final TextStyle? titleStyle;

  const DataWidget({
    super.key,
    required this.imagePath,
    required this.title,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          imagePath,
          height: 16.h,
          width: 16.w,
          colorFilter: const ColorFilter.mode(
            AppColors.boldGreyTextColor,
            BlendMode.srcIn,
          ),
        ),
        const CustomSizedBox(
          width: 8,
        ),
        Text(
          title,
          style: titleStyle ??
              CustomThemes.greyColor80TextTheme(context).copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
        )
      ],
    );
  }
}
