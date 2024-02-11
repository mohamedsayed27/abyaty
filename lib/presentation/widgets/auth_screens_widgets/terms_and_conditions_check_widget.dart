import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_text_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../translations/locale_keys.g.dart';
import '../bottom_sheets/auth_bottom_sheets/privacy_policy_terms_condition_bottom.dart';

class TermsAndConditionsCheckWidget extends StatefulWidget {
  const TermsAndConditionsCheckWidget({super.key});

  @override
  State<TermsAndConditionsCheckWidget> createState() =>
      _TermsAndConditionsCheckWidgetState();
}

class _TermsAndConditionsCheckWidgetState
    extends State<TermsAndConditionsCheckWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
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
          child: RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              text: "${LocaleKeys.byClickingThis.tr()} ",
              style: CustomThemes.termsAnConditionInactiveText(context),
              children: [
                WidgetSpan(
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.white,
                        useSafeArea: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24.r),
                            topRight: Radius.circular(24.r),
                          ),
                        ),
                        showDragHandle: true,
                        isScrollControlled: true,
                        builder: (context) {
                          return const PrivacyPolicyTermsConditionsBottomSheet(
                            title: LocaleKeys.termsAndConditions,
                            body:
                            'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                            lastDate: '12 October 2023',
                          );
                        },
                      );
                    },
                    child: Text(
                      "${LocaleKeys.termsAndConditions.tr()} ",
                      style: CustomThemes.termsAnConditionActiveText(context),
                    ),
                  ),
                ),
                TextSpan(
                  text: "${LocaleKeys.and} ",
                  style: CustomThemes.termsAnConditionInactiveText(context),
                ),
                WidgetSpan(
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.white,
                        useSafeArea: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24.r),
                            topRight: Radius.circular(24.r),
                          ),
                        ),
                        showDragHandle: true,
                        isScrollControlled: true,
                        builder: (context) {
                          return const PrivacyPolicyTermsConditionsBottomSheet(
                            title: LocaleKeys.privacyPolicy,
                            body:
                            'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                            lastDate: '12 October 2023',
                          );
                        },
                      );
                    },
                    child: Text(
                      "${LocaleKeys.privacyPolicy.tr()} ",
                      style: CustomThemes.termsAnConditionActiveText(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
