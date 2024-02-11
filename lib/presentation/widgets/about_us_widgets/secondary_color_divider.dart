import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/app_colors.dart';

class SecondaryColorDivider extends StatelessWidget {
  final double width;

  const SecondaryColorDivider({super.key, this.width = 32});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2.h,
      width: width.w,
      color: AppColors.secondaryColor,
    );
  }
}
