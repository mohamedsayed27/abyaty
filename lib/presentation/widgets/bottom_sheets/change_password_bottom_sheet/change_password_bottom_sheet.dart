import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/presentation/widgets/auth_screens_widgets/password_text_form_field.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared_widgets/primary_color_elevated_button.dart';

class ChangePasswordBottomSheet extends StatelessWidget {
  const ChangePasswordBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Change Password",
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
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      style: CustomThemes.primaryColorTextTheme(context).copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primaryColor,
                      ),
                    ),
                  )
                ],
              ),
              const CustomSizedBox(height: 10,),
              Text(
                "Old Password",
                style: CustomThemes.greyColor80TextTheme(context).copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const CustomSizedBox(height: 8,),
              const PasswordTextFormField(
                hintText: "Enter The Old Password",
              ),
              const CustomSizedBox(height: 16,),
              Text(
                "New Password",
                style: CustomThemes.greyColor80TextTheme(context).copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const CustomSizedBox(height: 8,),
              const PasswordTextFormField(
                hintText: "Enter The New Password",
              ),
              const CustomSizedBox(height: 16,),
              Text(
                "Confirm Password",
                style: CustomThemes.greyColor80TextTheme(context).copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const CustomSizedBox(height: 8,),
              const PasswordTextFormField(
                hintText: "Confirm The New Password",
              ),
              const CustomSizedBox(height: 26,),
              PrimaryColorElevatedButton(
                text: "Confirm",
                onPressed: (){},
              ),
              const CustomSizedBox(height: 20,),
            ],
          ),
        ).symmetricPadding(horizontal: 16),
      ),
    );
  }
}
