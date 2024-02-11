import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/assets_path/svg_path.dart';
import 'custom_elevated_button.dart';
import 'custom_sized_box.dart';

class AddToCartElevatedButton extends StatelessWidget {
  final Color cartIconColor;
  final TextStyle titleTheme;
  final Color backgroundColor;
  final Color foregroundColor;
  final void Function()? onPressed;
  final double height;
  final double cartIconHeight;
  final double cartIconWidth;
  const AddToCartElevatedButton({
    super.key,
    required this.cartIconColor,
    required this.titleTheme,
    required this.backgroundColor,
    required this.foregroundColor,
    this.onPressed, required this.height, required this.cartIconHeight, required this.cartIconWidth,
  });

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      borderRadius: 8.r,
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      height: height,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            SvgPath.cartNavIcon,
            width: cartIconWidth.w,
            height: cartIconHeight.h,
            colorFilter: ColorFilter.mode(cartIconColor, BlendMode.srcIn),
          ),
          const CustomSizedBox(
            width: 4,
          ),
          Text(
            "Add To Cart",
            style: titleTheme,
          )
        ],
      ),
    );
  }
}
