import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/presentation/widgets/drop_down_buttons/custom_drop_down_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PackSizeDropDownButton extends StatefulWidget {
  const PackSizeDropDownButton({super.key});

  @override
  State<PackSizeDropDownButton> createState() => _PackSizeDropDownButtonState();
}

class _PackSizeDropDownButtonState extends State<PackSizeDropDownButton> {
  String? value;
  List<String> unitsList = [
    "100",
    "200",
    "300",
    "400",
    "500",
  ];

  @override
  Widget build(BuildContext context) {
    return CustomDropDownButton(
      value: value,
      hintText: "EX :- 500g",
      items: unitsList
          .map(
            (e) => DropdownMenuItem(
          value: e,
          child: Text(
            "$e g",
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
