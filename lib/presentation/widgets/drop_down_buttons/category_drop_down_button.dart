import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/custom_themes.dart';
import 'custom_drop_down_button.dart';

class CategoryDropDownButton extends StatefulWidget {
  const CategoryDropDownButton({super.key});

  @override
  State<CategoryDropDownButton> createState() => _CategoryDropDownButtonState();
}

class _CategoryDropDownButtonState extends State<CategoryDropDownButton> {
  String? value;
  List<String> unitsList = [
    "Fashion",
    "Sport",
    "Accessories",
    "Electronics",
  ];

  @override
  Widget build(BuildContext context) {
    return CustomDropDownButton(
      value: value,
      hintText: "EX :- Fashion",
      items: unitsList
          .map(
            (e) => DropdownMenuItem(
          value: e,
          child: Text(
            e,
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
