import 'package:abyaty/core/app_router/screens_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/assets_path/svg_path.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushNamed(context, ScreenName.cartScreen);
      },
      icon: SvgPicture.asset(
        SvgPath.cartNavIcon,
        colorFilter: const ColorFilter.mode(
          AppColors.blackColor,
          BlendMode.srcIn,
        ),
        width: 24.w,
        height: 24.h,
      ),
    );
  }
}
