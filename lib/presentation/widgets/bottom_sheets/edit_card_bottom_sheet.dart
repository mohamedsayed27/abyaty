import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../shared_widgets/form_item_widget.dart';
import '../shared_widgets/primary_color_elevated_button.dart';
import 'add_new_card_bottom_sheet/add_card_for_future_use.dart';


class EditCardBottomSheet extends StatelessWidget {
  const EditCardBottomSheet({super.key});

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
                    "Edit Card",
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
              FormItemWidget(
                title: "Card Number",
                hintText: "EX : 0000 0000 0000 0000",
                isRequired: true,
                enabled: false,
                controller: TextEditingController(text: "xxxx xxxx xxxx 1234"),
              ),
              const CustomSizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: FormItemWidget(
                      title: "Expiry Date",
                      hintText: "EX : mm/yyyy",
                      isRequired: true,
                      enabled: false,
                      controller: TextEditingController(text: "01/24"),
                    ),
                  ),
                  CustomSizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: FormItemWidget(
                      title: "CVV",
                      hintText: "EX : mm/yyyy",
                      isRequired: true,
                      enabled: false,
                      controller: TextEditingController(text: "***"),
                    ),
                  ),
                ],
              ),
              const CustomSizedBox(
                height: 16,
              ),
              FormItemWidget(
                title: "Card Holder Name",
                hintText: "EX : Mustafa Emad",
                isRequired: true,
                enabled: false,
                controller: TextEditingController(text: "Mustafa Emad"),
              ),
              const CustomSizedBox(
                height: 16,
              ),
              const FormItemWidget(
                title: "Card Label",
                hintText: "EX : Enter the desired label for card",
                isRequired: false,
              ),
              const CustomSizedBox(
                height: 40,
              ),
              PrimaryColorElevatedButton(
                text: "Submit",
                onPressed: () {},
              ),
              const CustomSizedBox(
                height: 24,
              ),
            ],
          ),
        ).symmetricPadding(horizontal: 16),
      ),
    );
  }
}


/*

               FormItemWidget(
                title: "Card Number",
                hintText: "EX : 0000 0000 0000 0000",
                isRequired: true,
                enabled: false,
                controller: TextEditingController(text: "adfaCASD"),
              ),
* */