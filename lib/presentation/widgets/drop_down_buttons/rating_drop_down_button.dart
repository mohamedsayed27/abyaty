import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/custom_themes.dart';
import 'custom_drop_down_button.dart';

class RatingDropDownButton extends StatefulWidget {
  const RatingDropDownButton({super.key});

  @override
  State<RatingDropDownButton> createState() => _RatingDropDownButtonState();
}

class _RatingDropDownButtonState extends State<RatingDropDownButton> {
  String? value;

  List<String> unitsList = [
    "1 STAR",
    "2 STAR",
    "3 STAR",
    "4 STAR",
  ];

  @override
  Widget build(BuildContext context) {
    return CustomDropDownButton(
      value: value,
      hint: Row(
        children: [
          const Icon(
            Icons.star,
            color: AppColors.secondaryColor,
          ),
          Text(
            "5 Stars",
            style: CustomThemes.authHintTextTheme(context),
          )
        ],
      ),
      items: unitsList
          .map(
            (e) => DropdownMenuItem<String>(
              value: e,
              child:
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: AppColors.secondaryColor,
                  ),
                  Text(
                    e,
                    style: CustomThemes.greyColor1ATextTheme(context).copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                    ),
                  )
                ],
              ),
            ),
          )
          .toList(),
      onChanged: (value) {
        setState(() {
          this.value = value;
        });
      },
    );
  }
}
