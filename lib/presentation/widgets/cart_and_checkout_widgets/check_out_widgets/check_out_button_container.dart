import 'package:abyaty/core/app_router/screens_name.dart';
import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/assets_path/svg_path.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/primary_color_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckOutButtonContainer extends StatelessWidget {
  const CheckOutButtonContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        bottom: 40.h,
        top: 24.h,
      ),
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    SvgPath.receipt,
                    width: 16.w,
                    height: 16.h,
                  ),
                  const CustomSizedBox(
                    width: 8,
                  ),
                  Text(
                    "Grand Total",
                    style: CustomThemes.greyColo4DTextTheme(context)
                        .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              Text(
                "200 SAR",
                style: CustomThemes.greyColo4DTextTheme(context)
                    .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600),
              )
            ],
          ),
          const CustomSizedBox(
            height: 24,
          ),
          PrimaryColorElevatedButton(
            text: "Checkout & Pay 200 SAR",
            height: 48,
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, ScreenName.mainLayoutScreen, (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
