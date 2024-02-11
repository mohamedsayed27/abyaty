import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/assets_path/svg_path.dart';
import 'package:abyaty/core/constants/dummy_data.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/counter_widget.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../shared_widgets/custom_elevated_button.dart';

class CartProductItem extends StatefulWidget {
  final String image;
  const CartProductItem({super.key, required this.image,});

  @override
  State<CartProductItem> createState() => _CartProductItemState();
}

class _CartProductItemState extends State<CartProductItem> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (s){

      },
      direction: DismissDirection.endToStart,
      background: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 24.h),
        decoration: BoxDecoration(
          color: AppColors.deleteItemFromCartBackgroundColor,
          borderRadius: BorderRadius.circular(16.r),

        ),
        alignment: AlignmentDirectional.centerEnd,
        child: SvgPicture.asset(SvgPath.trash,width: 40.w,height: 40.h,),
      ),
      key: Key(widget.image),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(
            width: 1.w,
            color: AppColors.favoriteButtonBackgroundGreyColoColor,
          ),
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 8.h),
                blurRadius: 8.r,
                color: AppColors.shadowColor(opacity: 0.12))
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              widget.image,
              width: 64.w,
              height: 64.h,
              fit: BoxFit.contain,
            ),
            const CustomSizedBox(width: 12,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Green Lemon",
                        style:
                            CustomThemes.greyColor1ATextTheme(context).copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                          width:24.w, height:24.h,
                        child: IconButton(
                          onPressed: () {},
                          style: IconButton.styleFrom(
                            padding: EdgeInsets.zero
                          ),
                          icon: SvgPicture.asset(
                            SvgPath.favorite,
                            width: 24.w,
                            height: 24.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "99 SAR",
                    style: CustomThemes.darkColorTextTheme(context).copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "(1 Kg)",
                        style: CustomThemes.greyColor80TextTheme(context)
                            .copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomElevatedButton(
                            borderRadius: 8,
                            onPressed: () {
                              if(counter>1){
                                counter--;
                                setState(() {

                                });
                              }
                            },
                            padding: EdgeInsets.zero,
                            height: 24.h,
                            width: 24.w,
                            foregroundColor: AppColors.primaryColor,
                            backgroundColor: AppColors.lightBlueBackgroundColor,
                            child: SvgPicture.asset(
                              SvgPath.minus,
                              width: 18.w,
                              height: 18.h,
                              colorFilter: const ColorFilter.mode(
                                AppColors.primaryColor,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          const CustomSizedBox(
                            width: 12,
                          ),
                          CustomElevatedButton(
                            borderRadius: 8,
                            backgroundColor:
                                AppColors.favoriteButtonBackgroundGreyColoColor,
                            padding: EdgeInsets.zero,
                            height: 24.h,
                            width: 24.w,
                            text: "$counter",
                            titleStyle: CustomThemes.greyColo4DTextTheme(context)
                                .copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const CustomSizedBox(
                            width: 12,
                          ),
                          CustomElevatedButton(
                            borderRadius: 8,
                            onPressed: () {
                                counter++;
                                setState(() {

                                });
                            },
                            padding: EdgeInsets.zero,
                            height: 24.h,
                            width: 24.w,
                            foregroundColor: AppColors.primaryColor,
                            backgroundColor: AppColors.lightBlueBackgroundColor,
                            child: SvgPicture.asset(
                              SvgPath.add,
                              width: 18.w,
                              height: 18.h,
                              colorFilter: const ColorFilter.mode(
                                AppColors.primaryColor,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
