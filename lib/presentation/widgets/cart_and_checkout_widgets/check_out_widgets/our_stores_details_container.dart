import 'package:abyaty/core/assets_path/svg_path.dart';
import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/presentation/buisness_logic/check_out_cubit/check_out_state.dart';
import 'package:abyaty/presentation/widgets/cart_and_checkout_widgets/check_out_widgets/delivery_options_check_box_widget.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/app_theme/custom_themes.dart';
import '../../../buisness_logic/check_out_cubit/check_out_cubit.dart';
import '../../bottom_sheets/checkout_bottom_sheets/delivery_time_bottom_sheet.dart';
import '../../shared_widgets/custom_check_box.dart';
import '../../shared_widgets/custom_outlined_button.dart';

class OurStoreDetailsContainer extends StatefulWidget {
  const OurStoreDetailsContainer({super.key});

  @override
  State<OurStoreDetailsContainer> createState() =>
      _OurStoreDetailsContainerState();
}

class _OurStoreDetailsContainerState extends State<OurStoreDetailsContainer> {
  int currentIndex = 0;
  List<Map<String, dynamic>> ourStoresDataList = [
    {
      "title": "Riyadh Store",
      "address": "25 ST - Wadi Ad-Dawasir - Riyadh",
      "opens": "8:00",
      "closing": "8:00",
    },
    {
      "title": "Tabuk Store",
      "address": "25 ST - Wadi Ad-Dawasir - Mekkah",
      "opens": "8:00",
      "closing": "8:00",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
            color: AppColors.shadowColor(),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Our Stores",
            style: CustomThemes.greyColo4DTextTheme(context).copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          const CustomSizedBox(
            height: 16,
          ),
          ListView.separated(
            itemBuilder: (_, index) {
              return StoreDetailsButton(
                isChecked: currentIndex == index,
                title: ourStoresDataList[index]["title"],
                address: ourStoresDataList[index]["address"],
                opens: ourStoresDataList[index]["opens"],
                closing: ourStoresDataList[index]["closing"],
                onPressed: (){
                  if (currentIndex != index){
                    currentIndex = index;
                    setState(() {

                    });
                  }
                },
              );
            },
            shrinkWrap: true,
            separatorBuilder: (_, index) => const CustomSizedBox(
              height: 16,
            ),
            padding: EdgeInsets.zero,
            itemCount: 2,
            physics: const NeverScrollableScrollPhysics(),
          )
        ],
      ),
    );
  }
}

class StoreDetailsButton extends StatelessWidget {
  final bool isChecked;
  final String title;
  final String address;
  final String opens;
  final String closing;
  final void Function()? onPressed;

  const StoreDetailsButton({
    super.key,
    required this.isChecked,
    required this.title,
    this.onPressed,
    required this.address,
    required this.opens,
    required this.closing,
  });

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      backgroundColor:
          isChecked ? AppColors.lightBlueBackgroundColor : AppColors.whiteColor,
      borderColor:
          isChecked ? AppColors.primaryColor : AppColors.authHintTextColor,
      borderRadius: 8,
      foregroundColor: AppColors.primaryColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: isChecked
                    ? CustomThemes.primaryColorTextTheme(context).copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      )
                    : CustomThemes.greyColor1ATextTheme(context).copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
              ),
              CustomCheckBox(isChecked: isChecked),
            ],
          ),
          const CustomSizedBox(
            height: 8,
          ),
          Row(
            children: [
              SvgPicture.asset(
                SvgPath.storeLocation,
                width: 14.w,
                height: 14.h,
              ),
              const CustomSizedBox(
                width: 4,
              ),
              Text(
                address,
                style: CustomThemes.greyColor80TextTheme(context)
                    .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const CustomSizedBox(
            height: 8,
          ),
          Row(
            children: [
              SvgPicture.asset(
                SvgPath.opens,
                width: 14.w,
                height: 14.h,
              ),
              const CustomSizedBox(
                width: 4,
              ),
              Text(
                "Opens at : $opens AM",
                style: CustomThemes.greyColor80TextTheme(context)
                    .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const CustomSizedBox(
            height: 8,
          ),
          Row(
            children: [
              SvgPicture.asset(
                SvgPath.closing,
                width: 14.w,
                height: 14.h,
              ),
              const CustomSizedBox(
                width: 4,
              ),
              Text(
                "Closing at : $closing PM",
                style: CustomThemes.greyColor80TextTheme(context)
                    .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ).symmetricPadding(vertical: 12, horizontal: 16),
    );
  }
}
