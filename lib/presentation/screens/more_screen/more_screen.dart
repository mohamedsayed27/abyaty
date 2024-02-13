import 'package:abyaty/core/app_router/screens_name.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/assets_path/svg_path.dart';
import 'package:abyaty/presentation/widgets/bottom_sheets/auth_bottom_sheets/privacy_policy_terms_condition_bottom.dart';
import 'package:abyaty/presentation/widgets/bottom_sheets/langauges_bottom_sheet/languages_bottom_sheet.dart';
import 'package:abyaty/presentation/widgets/more_screen_widgets/more_app_bar.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:abyaty/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/more_screen_widgets/tab_item_widget.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 63.h),
        child: MoreAppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                SvgPath.logout,
                width: 24.w,
                height: 24.h,
              ),
            )
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        children: [
          Text(
            LocaleKeys.account.tr(),
            style: CustomThemes.greyColor80TextTheme(context)
                .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
          const CustomSizedBox(
            height: 16,
          ),
          TabItemWidget(
            iconPath: SvgPath.moreCategory,
            title: LocaleKeys.overview,
            onPressed: () {
              Navigator.pushNamed(context, ScreenName.overViewScreen);
            },
          ),
          TabItemWidget(
            iconPath: SvgPath.moreUser,
            title: LocaleKeys.profile,
            onPressed: () {
              Navigator.pushNamed(context, ScreenName.profileScreen);
            },
          ),
          TabItemWidget(
            iconPath: SvgPath.moreBox,
            title: LocaleKeys.orders,
            onPressed: () {
              Navigator.pushNamed(context, ScreenName.ordersScreen);
            },
          ),
          TabItemWidget(
            iconPath: SvgPath.moreHeart,
            title: LocaleKeys.wishList,
            onPressed: () {
              Navigator.pushNamed(context, ScreenName.favoriteScreen);
            },
          ),
          TabItemWidget(
            iconPath: SvgPath.moreCards,
            title: LocaleKeys.savedCards,
            onPressed: () {
              Navigator.pushNamed(context, ScreenName.saveCardsScreen);
            },
          ),
          TabItemWidget(
            iconPath: SvgPath.moreMap,
            title: LocaleKeys.address,
            onPressed: () {
              Navigator.pushNamed(context, ScreenName.savedAddressScreen);
            },
          ),
          TabItemWidget(
            iconPath: SvgPath.moreTranslate,
            title: LocaleKeys.language,
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (_) => const LanguagesBottomSheet(),
                  isScrollControlled: true);
            },
          ),
          const CustomSizedBox(
            height: 40,
          ),
          Text(
            LocaleKeys.usefulLInks.tr(),
            style: CustomThemes.greyColor80TextTheme(context)
                .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
          const CustomSizedBox(
            height: 16,
          ),
          TabItemWidget(
            iconPath: SvgPath.moreGallery,
            title: LocaleKeys.blog,
            onPressed: () {
              Navigator.pushNamed(context, ScreenName.blogsScree);
            },
          ),
          TabItemWidget(
            iconPath: SvgPath.moreFlag,
            title: LocaleKeys.aboutUs,
            onPressed: () {},
          ),
          TabItemWidget(
            iconPath: SvgPath.moreFAQs,
            title: LocaleKeys.FAQ,
            onPressed: () {},
          ),
          TabItemWidget(
            iconPath: SvgPath.moreContactUs,
            title: LocaleKeys.contactUs,
            onPressed: () {},
          ),
          TabItemWidget(
            iconPath: SvgPath.moreTermsAndConditions,
            title: LocaleKeys.termsAndConditions,
            onPressed: () {
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
                builder: (_) => const PrivacyPolicyTermsConditionsBottomSheet(
                    title: LocaleKeys.termsAndConditions,
                    body:
                        "Abyati is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    lastDate: "12 October 2023"),
              );
            },
          ),
          TabItemWidget(
            iconPath: SvgPath.morePrivacyPolicy,
            title: LocaleKeys.privacyPolicy,
            onPressed: () {
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
                builder: (_) => const PrivacyPolicyTermsConditionsBottomSheet(
                  title: LocaleKeys.privacyPolicy,
                  body:
                      "Abyati is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  lastDate: "12 October 2023",
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
