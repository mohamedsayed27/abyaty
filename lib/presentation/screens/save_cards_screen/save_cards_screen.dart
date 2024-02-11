import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_app_bar.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_outlined_button.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/home_divider_widget.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/primary_color_outlined_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/assets_path/svg_path.dart';
import '../../../translations/locale_keys.g.dart';
import '../../widgets/bottom_sheets/add_new_card_bottom_sheet/add_new_card_bottom_sheet.dart';
import '../../widgets/bottom_sheets/edit_card_bottom_sheet.dart';
import '../../widgets/shared_widgets/custom_text_button.dart';
import '../../widgets/shared_widgets/delete_dialog_widget.dart';

class SaveCardsScreen extends StatelessWidget {
  const SaveCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 63.h),
        child: CustomAppBar(
          title: LocaleKeys.savedCards,
          actions: [
            CustomTextButton(
              title: LocaleKeys.addNew.tr(),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) => const AddNewCardBottomSheet(),
                  isScrollControlled: true,
                );
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
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 24.h),
        itemBuilder: (_, index) =>  CardWidget(
          cardTitle: LocaleKeys.cardName..tr(),
        ),
        separatorBuilder: (_, index) => const Column(
          children: [
            CustomSizedBox(
              height: 24,
            ),
            CustomDividerWidget(),
            CustomSizedBox(
              height: 24,
            ),
          ],
        ),
        itemCount: 3,
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String cardTitle;

  const CardWidget({super.key, required this.cardTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cardTitle,
          style: CustomThemes.greyColor80TextTheme(context).copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        const CustomSizedBox(
          height: 16,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                AppColors.primaryColor,
                const Color(0xff365980).withOpacity(.80),
              ],
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                "XXXX - XXXX - XXXX - 1234",
                style: CustomThemes.whiteColoTextTheme(context).copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const CustomSizedBox(
                height: 24,
              ),
              Text(
                "01/24",
                style: CustomThemes.whiteColoTextTheme(context).copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const CustomSizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Mustafa Emad",
                    style: CustomThemes.whiteColoTextTheme(context).copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "VISA",
                    style:
                        CustomThemes.secondaryColorTextTheme(context).copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const CustomSizedBox(
          height: 8,
        ),
        Row(
          children: [
            Expanded(
              child: PrimaryColorOutlinedButton(
                height: 48,
                onPressed: (){
                  showModalBottomSheet(
                    context: context,
                    builder: (_) => const EditCardBottomSheet(),
                    isScrollControlled: true,
                  );
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
                      style: CustomThemes.primaryColorTextTheme(context).copyWith(
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
                onPressed: (){
                  showDialog(context: context, builder: (_)=>DeleteDialogWidget());
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
                      colorFilter:  const ColorFilter.mode(
                          AppColors.redColor, BlendMode.srcIn),
                    ),
                    const CustomSizedBox(
                      width: 4,
                    ),
                    Text(
                      LocaleKeys.delete.tr(),
                      style: CustomThemes.greyColor80TextTheme(context).copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.redColor
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
