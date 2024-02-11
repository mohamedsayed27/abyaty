import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/custom_themes.dart';
import 'related_product_widget.dart';

class CareInstructionComponent extends StatelessWidget {
  const CareInstructionComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const CustomSizedBox(
          height: 16,
        ),
        Text(
          "Additional Info",
          style: CustomThemes.greyColo4DTextTheme(context).copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ).symmetricPadding(horizontal: 16),
        const CustomSizedBox(
          height: 16,
        ),
        ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 2.5.r,
                  backgroundColor: AppColors.regularGreyTextColor,
                ).onlyDirectionalPadding(top: 4),
                const CustomSizedBox(
                  width: 8,
                ),
                Expanded(
                    child: Text(
                  "Store cream cakes in a refrigerator. Fondant cakes in a refrigerator. Fondant cakes in a refrigerator. Fondant cakes",
                  textAlign: TextAlign.start,
                  style:
                      CustomThemes.greyColor80TextTheme(context).copyWith(
                    height: 1.h,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),)
              ],
            );
          },
          separatorBuilder: (_, index) => const CustomSizedBox(
            height: 16,
          ),
          itemCount: 5,
        ),
        const CustomSizedBox(
          height: 16,
        ),
        const RelatedProductWidget()
      ],
    );
  }
}
