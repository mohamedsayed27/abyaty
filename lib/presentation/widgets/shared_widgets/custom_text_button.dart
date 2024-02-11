import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String? title;
  final void Function()? onPressed;
  final TextStyle? style;
  final Widget? child;
  const CustomTextButton({
    super.key,
    this.title,
    this.onPressed,
    this.style, this.child,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        foregroundColor: AppColors.primaryColor,
      ),
      child: child??Text(
        title??"",
        style: style,
      ),
    );
  }
}
