import 'dart:ui';

import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/secondary_color_elevated_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../translations/locale_keys.g.dart';

class PrivacyPolicyTermsConditionsBottomSheet extends StatelessWidget {
  final String title;
  final String body;
  final String lastDate;

  const PrivacyPolicyTermsConditionsBottomSheet({
    super.key,
    required this.title,
    required this.body,
    required this.lastDate,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.tr(),
                  style: CustomThemes.greyColor1ATextTheme(context).copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ).symmetricPadding(horizontal: 16),
                const CustomSizedBox(
                  height: 16,
                ),
                Text(
                  "${LocaleKeys.byClickingThis.tr()} : $lastDate",
                  style: CustomThemes.greyColor80TextTheme(context).copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ).symmetricPadding(horizontal: 16),
                const CustomSizedBox(
                  height: 16,
                ),
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    itemBuilder: (_, index) => RichText(
                      text: TextSpan(
                          text: "${LocaleKeys.abyati.tr()} ",
                          style:
                              CustomThemes.greyColor1ATextTheme(context).copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                          children: [
                            TextSpan(
                              text: body,
                              style: CustomThemes.greyColor99TextTheme(context)
                                  .copyWith(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ]),
                    ).onlyDirectionalPadding(bottom: index == 2 ? 115 : 0),
                    separatorBuilder: (_, index) => CustomSizedBox(
                      height: index == 2 ? 115 : 16,
                    ),
                    itemCount: 3,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 112.h,
            width: double.infinity,
            padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
            alignment: Alignment.center,
            color: Colors.white.withOpacity(.72),
            child: SecondaryColorElevatedButton(
              height: 48,
              text: LocaleKeys.gotIt.tr(),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
