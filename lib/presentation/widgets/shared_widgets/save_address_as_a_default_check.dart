import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/presentation/buisness_logic/address_cubit/address_cubit.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SaveAddressAsADefault extends StatefulWidget {
  const SaveAddressAsADefault({super.key});

  @override
  State<SaveAddressAsADefault> createState() => _SaveAddressAsADefaultState();
}

class _SaveAddressAsADefaultState extends State<SaveAddressAsADefault> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 16.h,
          width: 16.w,
          child: Checkbox(
            value: isChecked,
            activeColor: AppColors.primaryColor,
            side: const BorderSide(color: AppColors.authHintTextColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            ),
            onChanged: (newValue) {

              setState(() {
                isChecked = newValue!;
              });
              if(isChecked==true){
                AddressCubit.get(context).isDefault = 1;
              }else{
                AddressCubit.get(context).isDefault = 0;
              }
              print(AddressCubit.get(context).isDefault);
            },
          ),
        ),
        const CustomSizedBox(
          width: 8,
        ),
        Expanded(
          child: Text("Save this address as default",style: CustomThemes.termsAnConditionInactiveText(context),),
        ),
      ],
    );
  }
}
