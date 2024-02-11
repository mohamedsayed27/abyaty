import 'package:abyaty/core/app_router/screens_name.dart';
import 'package:abyaty/core/assets_path/svg_path.dart';
import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/data_widget.dart';
import 'package:abyaty/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../widgets/bottom_sheets/langauges_bottom_sheet/languages_bottom_sheet.dart';
import '../../widgets/shared_widgets/custom_app_bar.dart';
import '../../widgets/shared_widgets/custom_outlined_button.dart';
import '../../widgets/shared_widgets/custom_text_button.dart';
import '../../widgets/shared_widgets/delete_dialog_widget.dart';
import '../../widgets/shared_widgets/primary_color_outlined_button.dart';

class SavedAddressScreen extends StatelessWidget {
  const SavedAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 63.h),
        child: CustomAppBar(
          title:LocaleKeys.address.tr(),
          actions: [
            CustomTextButton(
              title: LocaleKeys.addNew.tr(),
              onPressed: () {
                Navigator.pushNamed(context, ScreenName.chooseAddressLocationScreen,arguments: false);
              },
              style: CustomThemes.primaryColorTextTheme(context).copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ).onlyDirectionalPadding(end: 16),
          ],
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 24.h,
        ),
        itemBuilder: (_, index) => const AddressDetails(),
        separatorBuilder: (_, index) => const CustomSizedBox(
          height: 16,
        ),
        itemCount: 5,
      ),
    );
  }
}

class AddressDetails extends StatelessWidget {
  const AddressDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(
          width: 1.w,
          color: AppColors.favoriteButtonBackgroundGreyColoColor,
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 8.h),
            blurRadius: 8.r,
            color: AppColors.shadowColor(),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                SvgPath.location,
                height: 16.h,
                width: 16.w,
                colorFilter: const ColorFilter.mode(
                  AppColors.boldGreyTextColor,
                  BlendMode.srcIn,
                ),
              ),
              const CustomSizedBox(
                width: 4,
              ),
              Text(
                "Home",
                style: CustomThemes.greyColor1ATextTheme(context).copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          const CustomSizedBox(
            height: 16,
          ),
          const DataWidget(
            imagePath: SvgPath.moreMap,
            title: "25 ST - Wadi Ad-Dawasir - Riyadh",
          ),
          const CustomSizedBox(
            height: 16,
          ),
          const DataWidget(
            imagePath: SvgPath.phone,
            title: "+966 10 12345678",
          ),
          const CustomSizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: PrimaryColorOutlinedButton(
                  height: 48,
                  onPressed: () {
                    // showModalBottomSheet(context: context, builder: (_)=>LanguagesBottomSheet(),isScrollControlled: true);
                  },
                  padding: EdgeInsets.zero,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        SvgPath.edit,
                        width: 16.w,
                        height: 16.h,
                        colorFilter: const ColorFilter.mode(
                            AppColors.primaryColor, BlendMode.srcIn),
                      ),
                      const CustomSizedBox(
                        width: 4,
                      ),
                      Text(
                        LocaleKeys.edit.tr(),
                        style: CustomThemes.primaryColorTextTheme(context)
                            .copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const CustomSizedBox(
                width: 17,
              ),
              Expanded(
                child: CustomOutlinedButton(
                  borderRadius: 8,
                  borderColor: AppColors.redColor,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => const DeleteDialogWidget(
                        title:
                        LocaleKeys.addNew,
                      ),
                    );
                  },
                  foregroundColor: AppColors.redColor,
                  height: 48,
                  padding: EdgeInsets.zero,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        SvgPath.trash,
                        width: 16.w,
                        height: 16.h,
                        colorFilter: const ColorFilter.mode(
                            AppColors.redColor, BlendMode.srcIn),
                      ),
                      const CustomSizedBox(
                        width: 4,
                      ),
                      Text(
                        LocaleKeys.delete.tr(),
                        style: CustomThemes.greyColor80TextTheme(context)
                            .copyWith(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.redColor),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
