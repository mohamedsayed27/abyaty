import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_text_button.dart';
import 'package:abyaty/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SaveCardForFutureUse extends StatefulWidget {
  const SaveCardForFutureUse({super.key});

  @override
  State<SaveCardForFutureUse> createState() => _SaveCardForFutureUseState();
}

class _SaveCardForFutureUseState extends State<SaveCardForFutureUse> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 16.h,
          width: 16.w,
          child: Checkbox(
            value: isChecked,
            activeColor: AppColors.primaryColor,
            side: const BorderSide(color: AppColors.authHintTextColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            ),
            onChanged: (newValue) {
              setState(() {
                isChecked = newValue!;
              });
            },
          ),
        ),
        const CustomSizedBox(
          width: 8,
        ),
        Expanded(
          child: Text(LocaleKeys.saveThisCardForAFutureUse.tr(),style: CustomThemes.termsAnConditionInactiveText(context),),
        ),
      ],
    );
  }
}
