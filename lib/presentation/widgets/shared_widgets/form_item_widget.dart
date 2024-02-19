import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/assets_path/fonts_path.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormItemWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String title;
  final String hintText;
  final bool isRequired;
  final bool enabled;
  final String? Function(String?)? validator;
  const FormItemWidget({
    super.key,
    this.controller,
    required this.title,
    required this.hintText,
    this.isRequired = false, this.enabled = true, this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: title.tr(),
            style: CustomThemes.greyColor80TextTheme(context).copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
            children: [
              if (isRequired)
                TextSpan(
                  text: " *",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.red,
                  ),
                )
            ],
          ),
        ),
        const CustomSizedBox(
          height: 8,
        ),
        CustomTextField(
          hintText: hintText,
          enabled: enabled,
          validator: validator,
          filled: enabled==false?true:null,
          fillColor: enabled==false?AppColors.authHintTextColor:null,
          controller: controller,
        ),
      ],
    );
  }
}
