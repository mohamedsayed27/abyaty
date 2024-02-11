import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/presentation/widgets/drop_down_buttons/custom_drop_down_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UnitDropDownButton extends StatefulWidget {
  const UnitDropDownButton({super.key});

  @override
  State<UnitDropDownButton> createState() => _UnitDropDownButtonState();
}

class _UnitDropDownButtonState extends State<UnitDropDownButton> {
  String? value;
  List<String> unitsList = [
    "Kilogram",
    "Gram",
    "Unit",
    "piece",
  ];

  @override
  Widget build(BuildContext context) {
    return CustomDropDownButton(
      value: value,
      hintText: "EX :- Kilogram",
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
