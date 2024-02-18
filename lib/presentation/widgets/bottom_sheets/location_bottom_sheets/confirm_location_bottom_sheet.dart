import '../../../../core/constants/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_router/screens_name.dart';
import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/app_theme/custom_themes.dart';
import '../../shared_widgets/custom_sized_box.dart';
import '../../shared_widgets/custom_text_button.dart';
import '../../shared_widgets/custom_text_form_field.dart';
import '../../shared_widgets/form_item_widget.dart';
import '../../shared_widgets/primary_color_elevated_button.dart';
import '../../shared_widgets/save_address_as_a_default_check.dart';

class ConfirmLocationBottomSheet extends StatefulWidget {
  const ConfirmLocationBottomSheet({super.key});

  @override
  State<ConfirmLocationBottomSheet> createState() =>
      _ConfirmLocationBottomSheetState();
}

class _ConfirmLocationBottomSheetState
    extends State<ConfirmLocationBottomSheet> {
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
                    "Location",
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontSize: 16.sp),
                  ),
                  CustomTextButton(
                    title: "Cancel",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: CustomThemes.primaryColorTextTheme(context).copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              const CustomSizedBox(
                height: 8,
              ),
              const FormItemWidget(
                title: "Address Label",
                hintText: "EX : Home",
                isRequired: true,
              ),
              const CustomSizedBox(
                height: 16,
              ),
              CustomTextField(
                hintText: "EX: 25 ST - Wadi Ad-Dawasir",
                controller: TextEditingController(
                  text: "25 ST - Wadi Ad-Dawasir - Riyadh",
                ),
              ),
              const CustomSizedBox(
                height: 16,
              ),
              const FormItemWidget(
                title: "Floor Number",
                hintText: "EX: 4 ( optional )",
              ),
              const CustomSizedBox(
                height: 16,
              ),
              const FormItemWidget(
                title: "Flat Number",
                hintText: "EX: 4 ( optional )",
              ),
              const CustomSizedBox(
                height: 16,
              ),
              const SaveAddressAsADefault(),
              const CustomSizedBox(
                height: 16,
              ),
              PrimaryColorElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, ScreenName.mainLayoutScreen, (route) => false);
                },
                text: "Confirm",
              ),
              const CustomSizedBox(
                height: 16,
              ),
            ],
          ),
        ).symmetricPadding(horizontal: 16),
      ),
    );
  }
}
