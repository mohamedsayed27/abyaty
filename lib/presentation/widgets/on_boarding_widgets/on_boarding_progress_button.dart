import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../core/app_theme/app_colors.dart';

class OnboardingProgressButton extends StatelessWidget {
  final int currentStep;
  final void Function()? onPressed;

  const OnboardingProgressButton({
    super.key,
    required this.currentStep,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 96.w,
      height: 96.h,
      child: CircularStepProgressIndicator(
        totalSteps: 3,
        circularDirection: CircularDirection.counterclockwise,
        currentStep: currentStep,
        selectedColor: AppColors.primaryColor,
        stepSize: 2.w,
        child: Padding(
          padding: EdgeInsets.all(10.r),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: const CircleBorder(),
                padding: EdgeInsets.zero,
                shadowColor: Colors.transparent,
                foregroundColor: Colors.white,
                elevation: 1),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              child: currentStep != 3
                  ? Icon(
                      Icons.arrow_forward_outlined,
                      size: 26.r,
                    )
                  : Text(
                      LocaleKeys.ready.tr(),
                      style: CustomThemes.whiteColoTextTheme(context)
                          .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
            ),
          ),
        ),
        roundedCap: (_, isSelected) => isSelected,
      ),
    );
  }
}
