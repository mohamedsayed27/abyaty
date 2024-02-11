import 'package:abyaty/core/constants/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/app_theme/custom_themes.dart';
import '../../../../core/assets_path/svg_path.dart';
import '../../drop_down_buttons/unit_drop_down_button.dart';
import '../../shared_widgets/counter_widget.dart';
import '../../shared_widgets/custom_sized_box.dart';
import '../../shared_widgets/custom_text_button.dart';
import '../../shared_widgets/primary_color_elevated_button.dart';

class AddToCartBottomSheet extends StatefulWidget {
  const AddToCartBottomSheet({super.key});

  @override
  State<AddToCartBottomSheet> createState() => _AddToCartBottomSheetState();
}

class _AddToCartBottomSheetState extends State<AddToCartBottomSheet> {
  int counter = 1;

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
                    "Add To Cart",
                    style: CustomThemes.greyColor1ATextTheme(context)
                        .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                  CustomTextButton(
                    title: "Cancel",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: CustomThemes.primaryColorTextTheme(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              const CustomSizedBox(
                height: 4,
              ),
              Text(
                "Unit",
                style: CustomThemes.greyColor99TextTheme(context)
                    .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
              const CustomSizedBox(
                height: 8,
              ),
              const UnitDropDownButton(),
              const CustomSizedBox(
                height: 20,
              ),
              Text(
                "Quantity",
                style: CustomThemes.greyColor99TextTheme(context)
                    .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),

              const CustomSizedBox(
                height: 8,
              ),
              CounterWidget(
                controlButtonsColor: AppColors.primaryColor,
                counterButtonColor: AppColors.favoriteButtonBackgroundGreyColoColor,
                counter: counter,
                counterFontSize: 16,
                itemHeight: 40,
                itemWidth: 40,
                onMinusPressed: () {
                  counter--;setState(() {

                  });
                },
                minusPlusIconColor: AppColors.whiteColor,
                onPlusPressed: () {
                  counter++;setState(() {
                  });
                },
              ),
              const CustomSizedBox(height: 40,),
              PrimaryColorElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      SvgPath.cartNavIcon,
                      width: 20.w,
                      height: 20.h,
                      colorFilter: const ColorFilter.mode(
                          AppColors.whiteColor, BlendMode.srcIn),
                    ),
                    const CustomSizedBox(width: 4,),
                    Text(
                      "Add To Cart",
                      style: CustomThemes.whiteColoTextTheme(context).copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                onPressed: (){},
              ),
              const CustomSizedBox(height: 24,),
            ],
          ).symmetricPadding(horizontal: 16),
        ),
      ),
    );
  }
}
