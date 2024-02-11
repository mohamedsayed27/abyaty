import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/assets_path/svg_path.dart';
import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_check_box.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_outlined_button.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/primary_color_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../shared_widgets/custom_text_button.dart';

class LanguagesBottomSheet extends StatefulWidget {
  const LanguagesBottomSheet({super.key});

  @override
  State<LanguagesBottomSheet> createState() => _LanguagesBottomSheetState();
}

class _LanguagesBottomSheetState extends State<LanguagesBottomSheet> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Languages",
                    style:
                    CustomThemes.greyColor1ATextTheme(context).copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 17.h,
                    width: 43.w,
                    child: CustomTextButton(
                      title: "cancel",
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style:
                      CustomThemes.primaryColorTextTheme(context).copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primaryColor,
                      ),
                    ),
                  )
                ],
              ),
              const CustomSizedBox(
                height: 10,
              ),
              LanguagesItem(
                isChecked: currentIndex == 0,
                imagePath: SvgPath.english,
                onPressed: (){
                  setState(() {
                    currentIndex = 0;
                  });
                },
                title: "English (UK)",
              ),
              const CustomSizedBox(height: 16,),
              LanguagesItem(
                isChecked: currentIndex == 1,
                imagePath: SvgPath.arabic,
                onPressed: (){
                  setState(() {
                    currentIndex = 1;
                  });
                },
                title: "العربية",
              ),
              const CustomSizedBox(height: 40,),
              PrimaryColorElevatedButton(
                onPressed: () {},
                text: "Update",
                padding: EdgeInsets.zero,
              ),
            ],
          ),
        ).symmetricPadding(horizontal: 16),
      ),
    );
  }
}

class LanguagesItem extends StatelessWidget {
  final bool isChecked;
  final String imagePath;
  final String title;
  final void Function()? onPressed;

  const LanguagesItem({
    super.key,
    required this.isChecked,
    required this.imagePath,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedButton(
      borderColor: isChecked?AppColors.primaryColor:AppColors.authHintTextColor,
      borderRadius: 8,
      height: 56,
      onPressed: onPressed,
      backgroundColor: isChecked?AppColors.lightBlueBackgroundColor:AppColors.whiteColor,
      foregroundColor: AppColors.primaryColor,
      child: Row(
        children: [
          CustomCheckBox(
            height: 24.h,
            width: 24.w,
            isChecked: isChecked,
          ),
          CustomSizedBox(width: 16,),
          SvgPicture.asset(
            imagePath,
            width: 32.w,
            height: 24.h,
          ),
          CustomSizedBox(width: 8,),
          Text(
            title,
            style: CustomThemes.greyColor80TextTheme(context).copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
