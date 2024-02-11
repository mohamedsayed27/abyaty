import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/assets_path/svg_path.dart';
import 'package:abyaty/core/constants/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/assets_path/images_path.dart';
import '../cart_and_checkout_widgets/cart_button.dart';

class ShopAppBar extends StatelessWidget {
  final bool isInternalScreen;
  final String title;

  const ShopAppBar({
    super.key,
    this.isInternalScreen = false,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor(),
            offset: Offset(0, 8.h),
            blurRadius: 32.r,
          )
        ],
      ),
      child: AppBar(
        title: Text(
          title.tr(),
          style: CustomThemes.greyColor1ATextTheme(context).copyWith(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          isInternalScreen == false
              ? IconButton(
                  onPressed: () {},
                  icon: Container(
                    height: 24.h,
                    width: 24.w,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      ImagesPath.welcomeScreenImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ).onlyDirectionalPadding(end: 8)
              : const CartButton().onlyDirectionalPadding(end: 8),
        ],
      ),
    );
  }
}
