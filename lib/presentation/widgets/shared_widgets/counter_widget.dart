import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/assets_path/svg_path.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CounterWidget extends StatelessWidget {
  final Color controlButtonsColor;
  final Color counterButtonColor;
  final Color? minusPlusIconColor;
  final int counter;
  final double counterFontSize;
  final void Function()? onPlusPressed;
  final void Function()? onMinusPressed;
  final double itemHeight;
  final double itemWidth;

  const CounterWidget({
    super.key,
    required this.controlButtonsColor,
    required this.counterButtonColor,
    required this.counter,
    required this.counterFontSize,
    this.onPlusPressed,
    this.onMinusPressed,
    required this.itemHeight,
    required this.itemWidth,
    this.minusPlusIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomElevatedButton(
          borderRadius: 8,
          onPressed: onMinusPressed,
          padding: EdgeInsets.zero,
          height: itemHeight,
          width: itemWidth,
          backgroundColor: controlButtonsColor,
          child: SvgPicture.asset(
            SvgPath.minus,
            colorFilter: ColorFilter.mode(
                minusPlusIconColor ?? AppColors.whiteColor, BlendMode.srcIn),
          ),
        ),
        CustomElevatedButton(
          borderRadius: 8,
          backgroundColor: counterButtonColor,
          padding: EdgeInsets.zero,
          
          height: itemHeight,
          width: itemWidth,
          text: "$counter",
          titleStyle: CustomThemes.greyColo4DTextTheme(context).copyWith(
            fontSize: counterFontSize.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        CustomElevatedButton(
          borderRadius: 8,
          onPressed: onPlusPressed,
          padding: EdgeInsets.zero,
          height: itemHeight,
          width: itemWidth,
          backgroundColor: controlButtonsColor,
          child: SvgPicture.asset(
            SvgPath.add,
            colorFilter: ColorFilter.mode(
                minusPlusIconColor ?? AppColors.whiteColor, BlendMode.srcIn),
          ),
        ),
      ],
    );
  }
}
