import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondaryColorElevatedButton extends StatelessWidget {
  final double? height;
  final double? width;
  final void Function()? onPressed;
  final Widget? child;
  final String? text;
  final TextStyle? style;
  final EdgeInsetsGeometry? padding;

  const SecondaryColorElevatedButton({
    super.key,
    this.height = 56,
    this.width = double.infinity,
    this.onPressed,
    this.child,
    this.text,
    this.style,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      borderRadius: 8,
      width: width,
      height: height,
      padding: padding,
      backgroundColor: AppColors.secondaryColor,
      foregroundColor: Colors.white,
      onPressed: onPressed,
      child: child ?? Text(text??"",style: style??Theme.of(context).textTheme.headlineMedium!.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),),

    );
  }
}
