import 'package:abyaty/core/constants/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/images_path.dart';
import '../../../core/assets_path/svg_path.dart';
import '../shared_widgets/custom_sized_box.dart';

class BankWalletItemWidget extends StatelessWidget {
  final int? index;

  const BankWalletItemWidget({super.key, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      width: 255.w,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: index! % 2 == 0
              ? [
                  const Color(0xffE96031),
                  const Color(0xffFDEB37),
                ]
              : [
                  const Color(0xff095EA6),
                  const Color(0xff43B284),
                ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 8.h),
            blurRadius: 32.r,
            color: Colors.black.withOpacity(0.08),
          )
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            SvgPath.fire,
                            width: 14.w,
                            height: 14.h,
                          ),
                          const CustomSizedBox(
                            width: 2,
                          ),
                          Text(
                            "Money Company",
                            style: CustomThemes.whiteColoTextTheme(context)
                                .copyWith(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const CustomSizedBox(
                        height: 12,
                      ),
                      Text(
                        "Get 50% OFF",
                        style: CustomThemes.whiteColoTextTheme(context)
                            .copyWith(
                                fontSize: 14.sp, fontWeight: FontWeight.w700),
                      ),
                      const CustomSizedBox(
                        height: 4,
                      ),
                      Text(
                        "When you spend 20\$",
                        style: CustomThemes.whiteColoTextTheme(context)
                            .copyWith(
                                fontSize: 12.sp, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                const CustomSizedBox(
                  width: 13,
                ),
                CustomSizedBox(
                  height: 64,
                  width: 86,
                  child: Image.asset(
                    ImagesPath.bankWalletHomeScreenDummyImage,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ).onlyDirectionalPadding(top: 12, end: 12, start: 12),
          ),
          Container(
            height: 32.h,
            width: double.infinity,
            padding: EdgeInsetsDirectional.only(start: 12.w),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12.r),
                bottomRight: Radius.circular(12.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "code : 12muM12",
                  style: CustomThemes.whiteColoTextTheme(context)
                      .copyWith(fontSize: 12.sp, fontWeight: FontWeight.w400),
                ),
                IconButton(
                  onPressed: () {},
                  style: IconButton.styleFrom(
                    foregroundColor: Colors.white
                  ),
                  icon: SvgPicture.asset(
                    SvgPath.copy,
                    width: 14.w,
                    height: 14.h,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
