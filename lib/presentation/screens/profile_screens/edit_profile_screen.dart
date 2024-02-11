import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/assets_path/svg_path.dart';
import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/presentation/widgets/drop_down_buttons/custom_drop_down_button.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/choose_date_button.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_text_form_field.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/primary_color_elevated_button.dart';
import 'package:abyaty/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';

import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/images_path.dart';
import '../../widgets/bottom_sheets/change_password_bottom_sheet/change_password_bottom_sheet.dart';
import '../../widgets/shared_widgets/custom_app_bar.dart';
import '../../widgets/shared_widgets/custom_text_button.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  List<String> gender = [
    "Male",
    "Female",
  ];
  late String genderValue;
  DateTime? chosenDate;

  @override
  void initState() {
    genderValue = gender.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 63.h),
        child: CustomAppBar(
          title: LocaleKeys.editProfile,
          actions: [
            CustomTextButton(
              title: LocaleKeys.cancel.tr(),
              onPressed: () {},
              style: CustomThemes.primaryColorTextTheme(context).copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.red
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        children: [
          Text(
            LocaleKeys.profilePicture.tr(),
            style: CustomThemes.greyColor80TextTheme(context).copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          const CustomSizedBox(height: 16,),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Container(
              height: 64.h,
              width: 64.w,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Stack(
                children: [
                  Image.asset(
                    ImagesPath.welcomeScreenImage,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: AppColors.blackColor.withOpacity(0.49),
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      SvgPath.camera,
                      width: 40.w,
                      height: 40.h,
                    ),
                  )
                ],
              ),
            ),
          ),
          const CustomSizedBox(height: 24,),
          Text(
            LocaleKeys.profileInfo.tr(),
            style: CustomThemes.greyColor80TextTheme(context).copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          const CustomSizedBox(height: 16,),
          CustomTextField(
            hintText: LocaleKeys.username.tr(),
            prefixIcon: IconButton(
              onPressed: null,
              icon: SvgPicture.asset(
                SvgPath.moreUser,
                width: 16.w,
                height: 16.h,
                colorFilter: const ColorFilter.mode(
                  AppColors.greyTextColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          const CustomSizedBox(height: 16,),
          CustomTextField(
            hintText: LocaleKeys.phoneNumber.tr(),
            prefixIcon: IconButton(
              onPressed: null,
              icon: SvgPicture.asset(
                SvgPath.phone,
                width: 16.w,
                height: 16.h,
                colorFilter: const ColorFilter.mode(
                  AppColors.greyTextColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          const CustomSizedBox(height: 16,),
          CustomDropDownButton(
            items: gender
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            hintText: LocaleKeys.gender.tr(),
            onChanged: (value) {
              setState(() {
                genderValue = value;
              });
            },
            style: CustomThemes.greyColor1ATextTheme(context)
                .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w400),
            value: genderValue,
            prefixIcon: IconButton(
              onPressed: null,
              icon: SvgPicture.asset(
                SvgPath.gender,
                width: 16.w,
                height: 16.h,
                colorFilter: const ColorFilter.mode(
                  AppColors.greyTextColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          const CustomSizedBox(height: 16,),
          ChooseDateButton(
            value: chosenDate == null
                ? Jiffy.parse(DateTime.now().toString()).yMd
                : Jiffy.parse(chosenDate.toString()).yMd,
            onPressed: () {
              showDatePicker(
                      context: context,
                      initialDate: chosenDate ?? DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 30)))
                  .then((value) {
                setState(() {
                  chosenDate = value;
                });
              });
            },
          ),
          const CustomSizedBox(height: 24,),
          Text(
            LocaleKeys.loginDetails.tr(),
            style: CustomThemes.greyColor80TextTheme(context).copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          const CustomSizedBox(height: 16,),
          CustomTextField(
            hintText: LocaleKeys.editProfile.tr(),
            prefixIcon: IconButton(
              onPressed: null,
              icon: SvgPicture.asset(
                SvgPath.sms,
                width: 16.w,
                height: 16.h,
                colorFilter: const ColorFilter.mode(
                  AppColors.greyTextColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          const CustomSizedBox(height: 16,),
          CustomTextField(
            hintText: LocaleKeys.password.tr(),
            suffixIcon: CustomTextButton(
              title: LocaleKeys.changePassword.tr(),
              onPressed: () {
                showModalBottomSheet(context: context, builder: (_) => ChangePasswordBottomSheet(),isScrollControlled: true);
              },
              style: CustomThemes.primaryColorTextTheme(context).copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ).onlyDirectionalPadding(end: 8),
            prefixIcon: IconButton(
              onPressed: null,
              icon: SvgPicture.asset(
                SvgPath.lock,
                width: 16.w,
                height: 16.h,
                colorFilter: const ColorFilter.mode(
                  AppColors.greyTextColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          const CustomSizedBox(height: 24,),
          PrimaryColorElevatedButton(
            text: LocaleKeys.update.tr(),
            onPressed: (){},
            height: 48,
          ),
        ],
      ),
    );
  }
}
