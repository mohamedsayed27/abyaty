import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/assets_path/svg_path.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_app_bar.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_text_button.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/data_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_router/screens_name.dart';
import '../../../core/app_theme/app_colors.dart';
import '../../../core/assets_path/images_path.dart';
import '../../../translations/locale_keys.g.dart';
import '../../widgets/bottom_sheets/change_password_bottom_sheet/change_password_bottom_sheet.dart';
import '../../widgets/shared_widgets/custom_sized_box.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 63.h),
        child: CustomAppBar(
          title: LocaleKeys.profile,
          actions: [
            CustomTextButton(
              title: LocaleKeys.edit.tr(),
              onPressed: () {
                Navigator.pushNamed(context, ScreenName.editProfileScreen);
              },
              style: CustomThemes.primaryColorTextTheme(context).copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        children: [
          Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.orderDestinationTypeWidget,
              ),
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Row(
              children: [
                Container(
                  height: 64.h,
                  width: 64.w,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: Image.asset(
                    ImagesPath.welcomeScreenImage,
                    fit: BoxFit.cover,
                  ),
                ),
                const CustomSizedBox(
                  width: 8,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mustafa Emad",
                      style:
                          CustomThemes.greyColor1ATextTheme(context).copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const CustomSizedBox(
                      height: 8,
                    ),
                    Text(
                      "mustafa@example.com",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: CustomThemes.greyColor80TextTheme(context)
                          .copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const CustomSizedBox(
            height: 24,
          ),
          Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.orderDestinationTypeWidget,
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.profileInfo.tr(),
                  style: CustomThemes.greyColor1ATextTheme(context).copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const CustomSizedBox(
                  height: 24,
                ),
                const DataWidget(
                  imagePath: SvgPath.moreUser,
                  title: "Mustafa Emad",
                ),
                const CustomSizedBox(
                  height: 16,
                ),
                const DataWidget(
                  imagePath: SvgPath.sms,
                  title: "mustafa@example.com",
                ),
                const CustomSizedBox(
                  height: 16,
                ),
                const DataWidget(
                  imagePath: SvgPath.moreUser,
                  title: "+966 10 12345678",
                ),
                const CustomSizedBox(
                  height: 16,
                ),
                const DataWidget(
                  imagePath: SvgPath.gender,
                  title: "Male",
                ),
                const CustomSizedBox(
                  height: 16,
                ),
                const DataWidget(
                  imagePath: SvgPath.calendar,
                  title: "Birthday : 19/03/1999",
                ),
                const CustomSizedBox(
                  height: 16,
                ),
                const DataWidget(
                  imagePath: SvgPath.location,
                  title: "25 ST - Wadi Ad-Dawasir - Riyadh",
                ),
                const CustomSizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
          const CustomSizedBox(
            height: 24,
          ),
          Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.orderDestinationTypeWidget,
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.loginDetails.tr(),
                  style: CustomThemes.greyColor1ATextTheme(context).copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const CustomSizedBox(
                  height: 24,
                ),
                const DataWidget(
                  imagePath: SvgPath.sms,
                  title: "mustafa@example.com",
                ),
                const CustomSizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: DataWidget(
                        imagePath: SvgPath.lock,
                        title: "********",
                      ),
                    ),
                    SizedBox(
                      height: 18.h,
                      width: 108.w,
                      child: CustomTextButton(
                        title: LocaleKeys.changePassword.tr(),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (_) => const ChangePasswordBottomSheet(),
                            isScrollControlled: true,
                          );
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
