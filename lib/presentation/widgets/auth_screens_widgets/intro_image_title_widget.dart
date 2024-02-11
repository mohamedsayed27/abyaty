import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:abyaty/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/svg_path.dart';

class IntroImageTitleWidget extends StatelessWidget {
  final String bodyText;
  const IntroImageTitleWidget({super.key, required this.bodyText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          SvgPath.logo,
          height: 160.h,
          width: 160.w,
        ),
        const CustomSizedBox(height: 24,),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: LocaleKeys.welcomeAt.tr(),
            children: [
              TextSpan(
                text: " ${LocaleKeys.abyati.tr()} 👋🏻",
                style:
                    CustomThemes.authSecondaryColorTitleHeavyTextStyle(context)
                        .copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
            style:
                CustomThemes.introScreensTitleHeavyTextStyle(context).copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const CustomSizedBox(height: 8,),
        Text(
          bodyText.tr(),
          textAlign: TextAlign.center,
          style:
          CustomThemes.introScreensBodyTextStyle(context),
        )
      ],
    );
  }
}
