import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/app_router/screens_name.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/svg_path.dart';
import '../../../core/cache_helper/cache_keys.dart';
import '../../../core/cache_helper/shared_pref_methods.dart';
import '../../../core/constants/constants.dart';
import '../../../translations/locale_keys.g.dart';
import '../../widgets/shared_widgets/custom_blurry_background.dart';
import '../../widgets/shared_widgets/custom_sized_box.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _loading() {
    onboarding = CacheHelper.getData(
      key: CacheKeys.onboarding,
    );
    token = CacheHelper.getData(
      key: CacheKeys.token,
    );
    Timer(
      const Duration(seconds: 2),
      () {
        if (onboarding != null) {
          if (token != null) {
            Navigator.pushReplacementNamed(
              context,
              ScreenName.mainLayoutScreen,
            );
          } else {
            Navigator.pushReplacementNamed(
              context,
              ScreenName.loginScreen,
            );
          }
        } else {
          Navigator.pushReplacementNamed(
            context,
            ScreenName.onboardingScreen,
          );
        }
      },
    );
  }

  @override
  void initState() {
    _loading();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom],
    );
    return Scaffold(
      body: BlurryBackground(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  SvgPath.logo,
                  height: 160.h,
                  width: 160.w,
                ),
                const CustomSizedBox(
                  height: 24,
                ),
                Text(
                  LocaleKeys.abyatiStores.tr(),
                  textAlign: TextAlign.center,
                  style: CustomThemes.introScreensTitleTextStyle(context),
                ),
                const CustomSizedBox(
                  height: 8,
                ),
                Text(
                  LocaleKeys.yourOpenGateToWorld.tr(),
                  textAlign: TextAlign.center,
                  style: CustomThemes.introScreensBodyTextStyle(context)
                      .copyWith(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
