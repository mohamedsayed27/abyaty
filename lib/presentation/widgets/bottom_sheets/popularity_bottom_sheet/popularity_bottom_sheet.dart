import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/presentation/widgets/bottom_sheets/popularity_bottom_sheet/popularity_item_widget.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/app_theme/custom_themes.dart';
import '../../shared_widgets/custom_text_button.dart';
import '../../shared_widgets/primary_color_elevated_button.dart';

class PopularityBottomSheet extends StatefulWidget {
  const PopularityBottomSheet({super.key});

  @override
  State<PopularityBottomSheet> createState() => _PopularityBottomSheetState();
}

class _PopularityBottomSheetState extends State<PopularityBottomSheet> {
  List<String> titles = [
    "Most Popular",
    "Low - High Price",
    "High - Low Price",
    "Low - High Rating",
    "High - Low Rating",
    "A - Z Order",
    "Z - A Order",
    "Low - High Discount %Off",
    "High - Low Discount %Off",
  ];
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sort By",
                    style:
                    CustomThemes.greyColor1ATextTheme(context).copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CustomTextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style:
                      CustomThemes.primaryColorTextTheme(context).copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryColor
                      ),
                    ),
                  ),
                ],
              ),
              const CustomSizedBox(height: 8,),
              ListView.separated(
                itemBuilder: (_, index) {
                  return PopularityItem(title: titles[index],onPressed: (){
                    if(selectedIndex!=index){
                      setState(() {
                        selectedIndex = index;
                      });
                    }else{
                      selectedIndex = null;
                      setState(() {

                      });
                    }
                  },isChecked: selectedIndex==index,);
                },
                separatorBuilder: (_, index) => const CustomSizedBox(
                  height: 16,
                ),
                itemCount: titles.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
              const CustomSizedBox(height: 40,),
              PrimaryColorElevatedButton(
                text: "Apply",
                onPressed: (){},
              ),
              const CustomSizedBox(height: 24,),
            ],
          ),
        ).symmetricPadding(horizontal: 16),
      ),
    );
  }
}
