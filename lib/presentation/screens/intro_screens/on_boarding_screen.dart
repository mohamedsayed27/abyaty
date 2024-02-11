import 'package:abyaty/core/cache_helper/cache_keys.dart';
import 'package:abyaty/core/cache_helper/shared_pref_methods.dart';
import 'package:abyaty/core/constants/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_router/screens_name.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/images_path.dart';
import '../../../core/constants/dummy_data.dart';
import '../../../translations/locale_keys.g.dart';
import '../../widgets/on_boarding_widgets/on_boarding_progress_button.dart';
import '../../widgets/shared_widgets/custom_sized_box.dart';
import '../../widgets/shared_widgets/custom_text_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentStep = 1;
  List<String> imagesList = [
    ImagesPath.welcomeScreenImage,
    ImagesPath.welcomeScreenImage,
    ImagesPath.welcomeScreenImage,
  ];
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomSizedBox(
              height: 433.h,
              width: double.infinity,
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentStep = (index + 1);
                  });
                },
                itemBuilder: (_, index) {
                  return Image.asset(
                    DummyData.onboarding[index],
                    fit: BoxFit.contain,
                  );
                },
                itemCount: DummyData.onboarding.length,
              ),
            ),
            const CustomSizedBox(
              height: 40,
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
              style: CustomThemes.introScreensBodyTextStyle(context),
            ).symmetricPadding(horizontal: 68),
            const CustomSizedBox(
              height: 24,
            ),
            OnboardingProgressButton(
              currentStep: currentStep,
              onPressed: (){
                pageController.nextPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeIn,
                );
                if (currentStep != 3) {
                  setState(() {
                    currentStep++;
                  });
                } else {
                  CacheHelper.saveData(
                    key: CacheKeys.onboarding,
                    value: true,
                  ).then((value) {
                    Navigator.pushReplacementNamed(context, ScreenName.welcomeScreen);
                  });
                }
              },
            ),
            const CustomSizedBox(
              height: 24,
            ),
            CustomTextButton(
              title: currentStep == 3
                  ? LocaleKeys.startYourJourney.tr()
                  : LocaleKeys.skip.tr(),
              style: CustomThemes.secondaryColorTextTheme(context)
                  .copyWith(fontSize: 16.sp),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  ScreenName.mainLayoutScreen,
                  (route) => false,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
