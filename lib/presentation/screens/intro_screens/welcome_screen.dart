import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_router/screens_name.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../translations/locale_keys.g.dart';
import '../../widgets/shared_widgets/primary_color_elevated_button.dart';
import '../../widgets/shared_widgets/primary_color_outlined_button.dart';
import '../../widgets/shared_widgets/secondary_color_elevated_button.dart';
import '../../widgets/welcome_screen_widgets/welcome_screen_intro_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const WelcomeScreenIntroWidget(),
            const CustomSizedBox(
              height: 40,
            ),
            Text(
              "${LocaleKeys.welcomeAt.tr()} ${LocaleKeys.welcomeAt.tr()} 👋🏻",
              textAlign: TextAlign.center,
              style:
                  CustomThemes.introScreensTitleHeavyTextStyle(context).copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            const CustomSizedBox(
              height: 8,
            ),
            Text(
              LocaleKeys.yourOpenGateToWorld.tr(),
              textAlign: TextAlign.center,
              style: CustomThemes.introScreensBodyTextStyle(context).copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
              ),
            ).symmetricPadding(horizontal: 68),
            const CustomSizedBox(
              height: 40,
            ),
            Column(
              children: [
                PrimaryColorElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, ScreenName.signUpScreen);
                  },
                  text: LocaleKeys.signUp.tr(),
                ),
                const CustomSizedBox(
                  height: 16,
                ),
                PrimaryColorOutlinedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, ScreenName.loginScreen);
                  },
                  text: LocaleKeys.login.tr(),
                ),
                const CustomSizedBox(
                  height: 40,
                ),
                Text(
                  LocaleKeys.or.tr(),
                  textAlign: TextAlign.center,
                  style: CustomThemes.introScreensBodyTextStyle(context).copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                  ),
                ),
                const CustomSizedBox(
                  height: 16,
                ),
                SecondaryColorElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, ScreenName.mainLayoutScreen,(route)=>false);
                  },
                  text: LocaleKeys.startExploringAbyati.tr(),
                ),
              ],
            ).symmetricPadding(horizontal: 16)
          ],
        ),
      ),
    );
  }
}
