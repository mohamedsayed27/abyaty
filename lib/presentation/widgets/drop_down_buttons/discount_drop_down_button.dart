import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/custom_themes.dart';
import 'custom_drop_down_button.dart';

class DiscountDropDownButton extends StatefulWidget {
  const DiscountDropDownButton({super.key});

  @override
  State<DiscountDropDownButton> createState() => _DiscountDropDownButtonState();
}

class _DiscountDropDownButtonState extends State<DiscountDropDownButton> {
  String? value;
  List<String> unitsList = [
    "5",
    "10",
    "15",
    "20",
    "25",
    "30",
  ];

  @override
  Widget build(BuildContext context) {
    return CustomDropDownButton(
      value: value,
      hintText: "EX :- Up tO xx% ",
      items: unitsList
          .map(
            (e) => DropdownMenuItem(
          value: e,
          child: Text(
            "Up To $e%",
            style: CustomThemes.greyColor1ATextTheme(context).copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
            ),
          ),
        ),
      )
          .toList(),
      onChanged: (value){
        setState(() {
          this.value = value;
        });
      },
    );
  }
}
